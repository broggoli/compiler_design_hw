(* X86lite Simulator *)

(* See the documentation in the X86lite specification, available on the 
   course web pages, for a detailed explanation of the instruction
   semantics.
*)

open X86
open Int64_overflow
(* simulator machine state -------------------------------------------------- *)

let mem_bot = 0x400000L          (* lowest valid address *)
let mem_top = 0x410000L          (* one past the last byte in memory *)
let mem_size = Int64.to_int (Int64.sub mem_top mem_bot)
let nregs = 17                   (* including Rip *)
let ins_size = 8L                (* assume we have a 8-byte encoding *)
let exit_addr = 0xfdeadL         (* halt when m.regs(%rip) = exit_addr *)

(* Your simulator should raise this exception if it tries to read from or
   store to an address not within the valid address space. *)
exception X86lite_segfault

(* The simulator memory maps addresses to symbolic bytes.  Symbolic
   bytes are either actual data indicated by the Byte constructor or
   'symbolic instructions' that take up eight bytes for the purposes of
   layout.

   The symbolic bytes abstract away from the details of how
   instructions are represented in memory.  Each instruction takes
   exactly eight consecutive bytes, where the first byte InsB0 stores
   the actual instruction, and the next sevent bytes are InsFrag
   elements, which aren't valid data.

   For example, the two-instruction sequence:
        at&t syntax             ocaml syntax
      movq %rdi, (%rsp)       Movq,  [~%Rdi; Ind2 Rsp]
      decq %rdi               Decq,  [~%Rdi]

   is represented by the following elements of the mem array (starting
   at address 0x400000):

       0x400000 :  InsB0 (Movq,  [~%Rdi; Ind2 Rsp])
       0x400001 :  InsFrag
       0x400002 :  InsFrag
       0x400003 :  InsFrag
       0x400004 :  InsFrag
       0x400005 :  InsFrag
       0x400006 :  InsFrag
       0x400007 :  InsFrag
       0x400008 :  InsB0 (Decq,  [~%Rdi])
       0x40000A :  InsFrag
       0x40000B :  InsFrag
       0x40000C :  InsFrag
       0x40000D :  InsFrag
       0x40000E :  InsFrag
       0x40000F :  InsFrag
       0x400010 :  InsFrag
*)
type sbyte = InsB0 of ins       (* 1st byte of an instruction *)
           | InsFrag            (* 2nd - 8th bytes of an instruction *)
           | Byte of char       (* non-instruction byte *)

(* memory maps addresses to symbolic bytes *)
type mem = sbyte array

(* Flags for condition codes *)
type flags = { mutable fo : bool
             ; mutable fs : bool
             ; mutable fz : bool
             }

(* Register files *)
type regs = int64 array

(* Complete machine state *)
type mach = { flags : flags
            ; regs : regs
            ; mem : mem
            }

(* simulator helper functions ----------------------------------------------- *)

(* The index of a register in the regs array *)
let rind : reg -> int = function
  | Rip -> 16
  | Rax -> 0  | Rbx -> 1  | Rcx -> 2  | Rdx -> 3
  | Rsi -> 4  | Rdi -> 5  | Rbp -> 6  | Rsp -> 7
  | R08 -> 8  | R09 -> 9  | R10 -> 10 | R11 -> 11
  | R12 -> 12 | R13 -> 13 | R14 -> 14 | R15 -> 15

(* Helper functions for reading/writing sbytes *)

(* Convert an int64 to its sbyte representation *)
let sbytes_of_int64 (i:int64) : sbyte list =
  let open Char in 
  let open Int64 in
  List.map (fun n -> Byte (shift_right i n |> logand 0xffL |> to_int |> chr))
           [0; 8; 16; 24; 32; 40; 48; 56]

(* Convert an sbyte representation to an int64 *)
let int64_of_sbytes (bs:sbyte list) : int64 =
  let open Char in
  let open Int64 in
  let f b i = match b with
    | Byte c -> logor (shift_left i 8) (c |> code |> of_int)
    | _ -> 0L
  in
  List.fold_right f bs 0L

(* Convert a string to its sbyte representation *)
let sbytes_of_string (s:string) : sbyte list =
  let rec loop acc = function
    | i when i < 0 -> acc
    | i -> loop (Byte s.[i]::acc) (Int.pred i)
  in
  loop [Byte '\x00'] @@ String.length s - 1

(* Serialize an instruction to sbytes *)
let sbytes_of_ins (op, args:ins) : sbyte list =
  let check = function
    | Imm (Lbl _) | Ind1 (Lbl _) | Ind3 (Lbl _, _) -> 
      invalid_arg "sbytes_of_ins: tried to serialize a label!"
    | o -> ()
  in
  List.iter check args;
  [InsB0 (op, args); InsFrag; InsFrag; InsFrag;
   InsFrag; InsFrag; InsFrag; InsFrag]

(* Serialize a data element to sbytes *)
let sbytes_of_data : data -> sbyte list = function
  | Quad (Lit i) -> sbytes_of_int64 i
  | Asciz s -> sbytes_of_string s
  | Quad (Lbl _) -> invalid_arg "sbytes_of_data: tried to serialize a label!"


(* It might be useful to toggle printing of intermediate states of your 
   simulator. Our implementation uses this mutable flag to turn on/off
   printing.  For instance, you might write something like:

     [if !debug_simulator then print_endline @@ string_of_ins u; ...]

*)
let debug_simulator = ref false

(* Interpret a condition code with respect to the given flags. *)
let interp_cnd {fo; fs; fz} : cnd -> bool = fun x -> 
  match x with
    | Eq    -> fz
    | Neq   -> not fz
    | Gt    -> not (fs <> fo || fz)
    | Ge    -> fs == fo
    | Lt    -> fs <> fo
    | Le    -> fs <> fo || fz

(* Maps an X86lite address into Some OCaml array index,
   or None if the address is not within the legal address space. *)
let map_addr (addr:quad) : int option =
  if mem_bot <= addr && addr < mem_top
  then Option.some @@ Int64.to_int @@ Int64.sub addr mem_bot
  else None


exception No_intstr of sbyte
exception Is_label of lbl
exception Imm_Not_writeable of imm
exception Reg_Read_Error of reg
exception NoIndirect

let read_mem (m:mach) (addr:quad) : sbyte list =
  match map_addr addr with
    | Some a  ->  let line = Array.make 8 InsFrag in
                  let _ = Array.blit m.mem a line 0 8 in
                  Array.to_list line
    | None    -> raise X86lite_segfault

let read_reg (m:mach) (reg:reg) : int64 = m.regs.( rind reg ) 

let write_reg (m:mach) (reg:reg) (value: int64): unit = m.regs.( rind reg ) <- value 

let extract_lit : imm -> int64= function
  | Lit q -> q
  | Lbl l -> raise @@ Is_label l

let write_mem (m:mach) (addr:quad) (value: int64) : unit =
  let to_write = Array.of_list @@ sbytes_of_int64 value in
  match map_addr addr with
    | Some a  -> Array.blit to_write 0 m.mem a 8
    | None    -> raise X86lite_segfault


(* Returns the address or offset reffered to by the opperand *)
let read (m:mach) (operand:operand): int64 = 
  let read_reg (reg:reg) : int64 = read_reg m reg in
  let read_mem (addr:quad) = read_mem m addr in
  let mem_to_int64 (addr: quad) = int64_of_sbytes @@ read_mem addr in
  match operand with 
    Imm i                 -> extract_lit i
    | Reg r               -> read_reg r
    | Ind1 i              -> mem_to_int64 @@ extract_lit i
    | Ind2 r              -> mem_to_int64 @@ read_reg r
    | Ind3 (i, r)         -> mem_to_int64 (Int64.add (extract_lit i) @@ read_reg r)

let resolve_ind m :  operand -> int64 = function
  | Imm _ | Reg _       -> raise NoIndirect
  | Ind1 i              -> read m @@ Ind1 i
  | Ind2 r              -> read m @@ Ind2 r
  | Ind3 (i, r)         -> Int64.add (extract_lit i) (read_reg m r)

let write (m:mach) (operand: operand) (value: int64) =
  let write_reg (reg:reg) (value:int64) : unit  = write_reg m reg value in
  let write_mem (addr:quad) (value:int64) : unit  = write_mem m addr value in
  match operand with 
  Imm i                 -> raise @@ Imm_Not_writeable i
  | Reg r               -> write_reg r value
  | Ind1 i              -> write_mem (resolve_ind m @@ Ind1 i) value
  | Ind2 r              -> write_mem (resolve_ind m @@ Ind2 r) value
  | Ind3 (i, r)         -> write_mem (resolve_ind m @@ Ind3 (i, r)) value

(* Simulates one step of the machine:
    - fetch the instruction at %rip
    - compute the source and/or destination information from the operands
    - simulate the instruction semantics
    - update the registers and/or memory appropriately
    - set the condition flags
*)
let step (m:mach) : unit =
  (*prepare helper functions by overriding*)
  let read_reg (reg:reg) : int64                = read_reg m reg in
  let write_reg (reg:reg) (value:int64) : unit  = write_reg m reg value in
  let read_mem (addr:quad) : sbyte list         = read_mem m addr in 
  let write_mem (addr:quad) (value:int64) : unit  = write_mem m addr value in
  let read (operand:operand) : int64            = read m operand in
  let write (operand:operand) (value:int64) : unit = write m operand value in 

  let {flags = flags; regs = regs; mem = mem} = m in
  let ins_addr = read_reg Rip in

  let instruction : sbyte = List.hd @@ read_mem ins_addr in
  let (opcode, opndList) = 
    match instruction with
      InsB0 instr     -> instr
      | x     -> raise @@ No_intstr x
  in

  let next: unit = regs.(rind Rip) <- Int64.add ins_addr 8L in

  let pop (dest:operand) = 
    let sp_val = read_reg Rsp in
    let readable_sp_val = Imm (Lit sp_val) in
    let new_sp_val = Int64.add sp_val 8L in
    write dest @@ read readable_sp_val;
    write_reg Rsp new_sp_val
  in
  let push (src:operand) =
    let new_sp_val = Int64.sub (read_reg Rsp) 8L in
    let v = read src in
    write_reg Rsp new_sp_val;
    write_mem new_sp_val v
  in
  let setCC { value : int64; overflow : bool }: unit = 
    failwith ("not implemented")
  in
  let jump (operand:operand) : unit = write_reg Rip @@ read operand in
  let frst_opnd = List.hd opndList in
  let scnd_opnd = List.nth opndList 1 in
  match opcode with 
  | Retq    -> 
      pop (Reg Rip);
      next
  | Pushq   ->  
      push frst_opnd;
      next
  | Popq    ->  
      pop frst_opnd;
      next
  | Jmp     ->  jump frst_opnd
  | Callq   ->  
      let dest = read frst_opnd in
        push (Reg Rip);
        write_reg Rip dest
  | Incq    ->  
      let src_val = read frst_opnd in
      let incremented: t = succ src_val in
      write frst_opnd @@ incremented.value;
      next
  | Decq    ->  
      let src_val = read frst_opnd in
      let decremented: t = pred src_val in
      write frst_opnd @@ decremented.value;
      next
  | Negq    ->  
      let src_val = read frst_opnd in
      let negated: t = Int64_overflow.neg src_val in
      write frst_opnd @@ negated.value;
      next
  | Notq    ->  
      let src_val = read frst_opnd in
      write frst_opnd @@ Int64.lognot src_val ;
      next
  | J cc    ->  
      if interp_cnd flags cc 
      then jump frst_opnd
      else next
  | Set cc  ->  
      if interp_cnd flags cc 
      then write frst_opnd 1L
      else write frst_opnd 0L;
      next
  | Movq  ->
      write scnd_opnd @@ read frst_opnd;
      next
  | Leaq  ->  
      write scnd_opnd @@ resolve_ind m frst_opnd
  | Shlq    ->  
      let src_val = read scnd_opnd in
      let amnt = Int64.to_int @@ read frst_opnd in
      write scnd_opnd @@ Int64.shift_left src_val amnt;
      next
  | Sarq    ->  
      let src_val = read scnd_opnd in
      let amnt = Int64.to_int @@ read frst_opnd in
      write scnd_opnd @@ Int64.shift_right src_val amnt;
      next
  | Shrq    ->  
      let src_val = read scnd_opnd in
      let amnt = Int64.to_int @@ read frst_opnd in
      write scnd_opnd @@ Int64.shift_right_logical src_val amnt;
      next
  | Addq  -> 
      let v1 = read frst_opnd in
      let v2 = read scnd_opnd in
      let sum: t = add v1 v2 in
      write scnd_opnd sum.value
  | Subq  -> 
      let v1 = read frst_opnd in
      let v2 = read scnd_opnd in
      let diff: t = sub v2 v1 in
      write scnd_opnd diff.value
  | Imulq ->
      let v1 = read frst_opnd in
      let v2 = read scnd_opnd in
      let mult: t = mul v1 v2 in
      write scnd_opnd mult.value
  | Xorq  -> 
      let v1 = read frst_opnd in
      let v2 = read scnd_opnd in
      let xor = Int64.logxor v1 v2 in
      write scnd_opnd xor
  | Orq   -> 
      let v1 = read frst_opnd in
      let v2 = read scnd_opnd in
      let res = Int64.logor v1 v2 in
      write scnd_opnd res
  | Andq  -> 
      let v1 = read frst_opnd in
      let v2 = read scnd_opnd in
      let res = Int64.logand v1 v2 in
      write scnd_opnd res
  | Cmpq  -> 
      let v1 = read frst_opnd in
      let v2 = read scnd_opnd in
      let diff: t = sub v2 v1 in
      setCC diff




  (*    
  match opndList with 
    | [] -> (
      match opcode with
        | Retq -> pop Rip;
                  next
        | x    -> raise @@ No_intstr (InsB0 (x, []))
    )
    | [operand] -> (
      match opcode with 
        | Pushq   ->  
            push operand;
            next
        | Popq    ->  
            pop operand;
            next
        | Jmp     ->  jump
        | Callq   ->  
            let dest = read operand in
              push Rip;
              write Rip dest
        | Incq    ->  
            let src_val = read operand in
            let incremented: t = inc src_val
            write operand @@ incremented.value;
            next
        | Decq    ->  
            let src_val = read operand in
            let decremented: t = pred src_val
            write operand @@ decremented.value;
            next
        | Negq    ->  
            let src_val = read operand in
            let negated: t = neg src_val in
            write operand @@ negated.value;
            next
        | Notq    ->  
            let src_val = read operand in
            write operand @@ Int64.lognot src_val ;
            next
        | Shlq    ->  
            let src_val = read operand in
            write operand @@ Int64.shift_left src_val ;
            next
        | Sarq    ->  
            let src_val = read operand in
            write operand @@ Int64.shift_right src_val ;
            next
        | Shrq    ->  
            let src_val = read operand in
            write operand @@ Int64.shift_right_logical src_val ;
            next
        | J cc    ->  
            if interp_cnd flags cc 
            then jump operand
            else next
        | Set cc  ->  
            if interp_cnd flags cc 
            then write operand 1L
            else write operand 0L
            next
        | x       ->  raise @@ No_intstr (InsB0 (x, []))
    )
    | [frst_opnd, scnd_opnd] -> (
      let both_ind =
        match frst_opnd with 
          Ind1 _ -> ( 
            match scnd_opnd with 
                  Ind1 _           -> true
                | Ind3 _ | Ind2 _  -> false
            )
        | Ind2 _ -> ( 
          match scnd_opnd with 
                Ind2 _           -> true
              | Ind1 _ | Ind3 _  -> false
          )
        | Ind3 _   -> ( 
          match scnd_opnd with 
                Ind3 _          -> true
              | Ind1 _ | Ind2 _ -> false
        )
      in
      if both_ind 
        then raise @@ No_intstr (InsB0 (x, [])) 
        else
          match opcode with 
            | Movq  ->
                write scnd_opnd @@ read frst_opnd
                next
            | Leaq  ->  
                write scnd_opnd frst_opnd
            | Addq  -> 
                let v1 = read frst_opnd in
                let v2 = read scnd_opnd in
                let sum: t = add v1 v2 in
                write scnd_opnd sum.value
            | Subq  -> 
                let v1 = read frst_opnd in
                let v2 = read scnd_opnd in
                let diff: t = sub v2 v1 in
                write scnd_opnd diff.value
            | Imulq ->
                let v1 = read frst_opnd in
                let v2 = read scnd_opnd in
                let mult: t = mul v1 v2 in
                write scnd_opnd mult.value
            | Xorq  -> 
                let v1 = read frst_opnd in
                let v2 = read scnd_opnd in
                let xor = Int64.logxor v1 v2 in
                write scnd_opnd xor
            | Orq   -> 
                let v1 = read frst_opnd in
                let v2 = read scnd_opnd in
                let or = Int64.logor v1 v2 in
                write scnd_opnd or
            | Andq  -> 
                let v1 = read frst_opnd in
                let v2 = read scnd_opnd in
                let and = Int64.logand v1 v2 in
                write scnd_opnd and
            | Cmpq  -> 
                let v1 = read frst_opnd in
                let v2 = read scnd_opnd in
                let diff: t = sub v2 v1 in
                setCC 
            | x    -> raise @@ No_intstr (InsB0 (x, []))
    )
  match opcode with
    | Movq -> 
        let [ind; dest] = opndList in
        write_mem dest @@ read_mem src
        next
    | Leaq -> 
        let [ind; dest] = opndList in
        let addr = dest in
        write_mem dest @@ addr

    | Incq | Decq | Negq | Notq ->
    failwith ("Incq | Decq | Negq | Notq not implemented")
    | Addq | Subq | Imulq | Xorq | Orq | Andq ->
    failwith ("Addq | Subq | Imulq | Xorq | Orq | Andq not implemented")
    | Shlq | Sarq | Shrq  ->
    failwith ("Shlq | Sarq | Shrq not implemented")
    | Jmp -> failwith ("Jmp not implemented")
    | J cc ->failwith (" J not implemented")
    | Cmpq ->failwith (" Cmpq not implemented")
    | Set cc -> failwith (" Set not implemented")
    | Callq | Retq -> 
    failwith ("Callq | Retq not implemented")*)

(* Runs the machine until the rip register reaches a designated
   memory address. Returns the contents of %rax when the 
   machine halts. *)
let run (m:mach) : int64 = 
  while m.regs.(rind Rip) <> exit_addr do step m done;
  m.regs.(rind Rax)

(* assembling and linking --------------------------------------------------- *)

(* A representation of the executable *)
type exec = { entry    : quad              (* address of the entry point *)
            ; text_pos : quad              (* starting address of the code *)
            ; data_pos : quad              (* starting address of the data *)
            ; text_seg : sbyte list        (* contents of the text segment *)
            ; data_seg : sbyte list        (* contents of the data segment *)
            }

(* Assemble should raise this when a label is used but not defined *)
exception Undefined_sym of lbl

(* Assemble should raise this when a label is defined more than once *)
exception Redefined_sym of lbl

(* Convert an X86 program into an object file:
   - separate the text and data segments
   - compute the size of each segment
      Note: the size of an Asciz string section is (1 + the string length)
            due to the null terminator

   - resolve the labels to concrete addresses and 'patch' the instructions to 
     replace Lbl values with the corresponding Imm values.

   - the text segment starts at the lowest address
   - the data segment starts after the text segment

  HINT: List.fold_left and List.fold_right are your friends.
 *)
let assemble (p:prog) : exec =
failwith "assemble unimplemented"

(* Convert an object file into an executable machine state. 
    - allocate the mem array
    - set up the memory state by writing the symbolic bytes to the 
      appropriate locations 
    - create the inital register state
      - initialize rip to the entry point address
      - initializes rsp to the last word in memory 
      - the other registers are initialized to 0
    - the condition code flags start as 'false'

  Hint: The Array.make, Array.blit, and Array.of_list library functions 
  may be of use.
*)
let load {entry; text_pos; data_pos; text_seg; data_seg} : mach = 
failwith "load unimplemented"
