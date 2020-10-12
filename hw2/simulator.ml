(* X86lite Simulator *)

(* See the documentation in the X86lite specification, available on the 
   course web pages, for a detailed explanation of the instruction
   semantics.
*)

open X86

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

(* types that can be mapped to sbyte representation*)
type writeable =  Quad of quad
                | Str of string
                | Ins of ins
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
    | i -> loop (Byte s.[i]::acc) (pred i)
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


(* Returns the address or offset reffered to by the opperand *)
let read (m:mach) (operand:operand): int64 = 
  let read_reg (reg:reg) : int64 = m.regs.( rind reg ) in
  let read_mem (m:mach) (addr:quad) : sbyte list =
    match map_addr addr with
      | Some a  ->  let line = Array.make 8 InsFrag in
                    let _ = Array.blit m.mem a line 0 8 in
                    Array.to_list line
      | None    -> raise X86lite_segfault
  in

  let extract_lit (i:imm) l = (match i with
    | Lit q -> f
    | Lbl l -> raise @@ Is_label l
  ) in
  match operand with 
   Imm i                -> (match i with 
                            | Lit q -> q
                            | Lbl l -> raise @@ Is_label l
                          )
  | Reg r               -> read_reg r
  | Ind1 i              -> extract_lit i @@ int64_of_sbytes @@ read_mem m q
  | Ind2 r              -> int64_of_sbytes @@ read_mem @@ read_reg r
  | Ind3 (i, r)         -> extract_lit i @@ int64_of_sbytes @@ read_mem (Int64.add q @@ read_reg r)

let write (m:mach) (operand: operand) (value: writeable) =
  let write_reg (reg:reg) (value:int64): unit = m.regs.( rind reg ) <- value in
  let write_mem (m:mach) (addr:quad) (value:writeable) : unit =
    let sbyte_represent = 
      match value with 
        | Quad q  -> sbytes_of_int64 q
        | Str s   -> sbytes_of_string
        | Ins i   -> sbytes_of_ins (fst i, i)
    in
    let to_write = Array.of_list sbytes_represent in
    match map_addr addr with
      | Some a  -> Array.blit to_write m.mem a 8
      | None    -> raise X86lite_segfault
  in
  match operand with 
   Imm i                -> raise @@ Imm_Not_writeable i
  | Reg r               -> write_reg r value
  | Ind1 i              -> write_mem (read m i) value
  | Ind2 r              -> write_mem (read m r) value
  | Ind3 (i, r)         -> write_mem (Int64.add (read m i) (read m r)) value

exception No_intstr of sbyte
exception Is_label of lbl
exception Imm_Not_writeable of imm

(* Simulates one step of the machine:
    - fetch the instruction at %rip
    - compute the source and/or destination information from the operands
    - simulate the instruction semantics
    - update the registers and/or memory appropriately
    - set the condition flags
*)
let step (m:mach) : unit =
  let {flags = flags; regs = regs; mem = mem} = m in
  let ins_addr = read Rip in

  let instruction : ins = read (Imm (Lit ins_addr)) in
  let (opcode, opndList) = 
    match instruction with
      InsB0 instr     -> instr
      | x     -> raise @@ No_intstr x
  in

  let next: unit = regs.(rind Rip) <- Int64.add ins_addr 8L in

  let pop (dest:operand) = 
    let sp_val = read Rsp in
    let new_sp_val = Int64.add sp 8L in
    let _ = write (Ind (read dest)) (read sp_val) in
    let _ = write Rsp new_sp_val
  in
  let push (src:operand) =
    let new_sp_val = Int64.sub (read Rsp) 8L in
    let _ = write Rsp new_sp_val in
    let v = List.hd (sbytes_of_int64 @@ read src) in
    let _ = write new_sp_val v
  in
  match opndList with 
    | [] -> (
      match opcode with
        | Retq -> pop Rip;
                  next
        | x    -> raise @@ No_intstr (InsB0 (x, []))
    )
    | [operand] -> (
      match opcode with 
        | Pushq -> push operand;
                  next
        | Popq -> pop operand
        | Jmp -> write Rip @@ read operand
        | Callq -> let _ = push Rip in
                          write Rip @@ read operand
        | x    -> raise @@ No_intstr (InsB0 (x, []))
    )
  (*match opcode with
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
