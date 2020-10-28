(* ll ir compilation -------------------------------------------------------- *)

open Ll
open X86

(* Overview ----------------------------------------------------------------- *)

(* We suggest that you spend some time understanding this entire file and
   how it fits with the compiler pipeline before making changes.  The suggested
   plan for implementing the compiler is provided on the project web page.
*)


(* helpers ------------------------------------------------------------------ *)

(* Map LL comparison operations to X86 condition codes *)
let compile_cnd = function
  | Ll.Eq  -> X86.Eq
  | Ll.Ne  -> X86.Neq
  | Ll.Slt -> X86.Lt
  | Ll.Sle -> X86.Le
  | Ll.Sgt -> X86.Gt
  | Ll.Sge -> X86.Ge



(* locals and layout -------------------------------------------------------- *)

(* One key problem in compiling the LLVM IR is how to map its local
   identifiers to X86 abstractions.  For the best performance, one
   would want to use an X86 register for each LLVM %uid.  However,
   since there are an unlimited number of %uids and only 16 registers,
   doing so effectively is quite difficult.  We will see later in the
   course how _register allocation_ algorithms can do a good job at
   this.

   A simpler, but less performant, implementation is to map each %uid
   in the LLVM source to a _stack slot_ (i.e. a region of memory in
   the stack).  Since LLVMlite, unlike real LLVM, permits %uid locals
   to store only 64-bit data, each stack slot is an 8-byte value.

   [ NOTE: For compiling LLVMlite, even i1 data values should be
   represented as a 8-byte quad. This greatly simplifies code
   generation. ]

   We call the datastructure that maps each %uid to its stack slot a
   'stack layout'.  A stack layout maps a uid to an X86 operand for
   accessing its contents.  For this compilation strategy, the operand
   is always an offset from %rbp (in bytes) that represents a storage slot in
   the stack.
*)

type layout = (uid * X86.operand) list

(* A context contains the global type declarations (needed for getelementptr
   calculations) and a stack layout. *)
type ctxt = { tdecls : (tid * ty) list
            ; layout : layout
            }

(* useful for looking up items in tdecls or layouts *)
let lookup m x = List.assoc x m


(* compiling operands  ------------------------------------------------------ *)

(* LLVM IR instructions support several kinds of operands.

   LL local %uids live in stack slots, whereas global ids live at
   global addresses that must be computed from a label.  Constants are
   immediately available, and the operand Null is the 64-bit 0 value.

     NOTE: two important facts about global identifiers:

     (1) You should use (Platform.mangle gid) to obtain a string
     suitable for naming a global label on your platform (OS X expects
     "_main" while linux expects "main").

     (2) 64-bit assembly labels are not allowed as immediate operands.
     That is, the X86 code: movq _gid %rax which looks like it should
     put the address denoted by _gid into %rax is not allowed.
     Instead, you need to compute an %rip-relative address using the
     leaq instruction:   leaq _gid(%rip).

   One strategy for compiling instruction operands is to use a
   designated register (or registers) for holding the values being
   manipulated by the LLVM IR instruction. You might find it useful to
   implement the following helper function, whose job is to generate
   the X86 instruction that moves an LLVM operand into a designated
   destination (usually a register).

   Notes:
   Adds the source location to the operand specified.
*)
let compile_operand (ctxt:ctxt) (dest:X86.operand) : Ll.operand -> ins =
  let { tdecls = tdecls; layout = layout } = ctxt in
  function 
    | Null    -> (Movq, [Imm (Lit 0L); dest])
    | Const i -> (Movq, [Imm (Lit i); dest])
    (* Not sure whether the gid compilation is correct! *)
    | Gid gid -> (Leaq, [Ind3 (Lbl (Platform.mangle gid), Rip); dest])    
    | Id uid  ->  (Leaq, [lookup layout uid; dest])

let compile_read_operand (ctxt:ctxt) (dest:X86.operand) : Ll.operand -> ins list =
  let interm_reg = Reg R12 in
  fun operand -> match operand with
    | Null | Const _    -> [compile_operand ctxt dest operand]
    | Gid o | Id o  -> [compile_operand ctxt interm_reg operand; Movq, [Ind2 R12; Reg R13]; Movq, [Reg R13; dest]]

(* compiling call  ---------------------------------------------------------- *)

(* You will probably find it helpful to implement a helper function that
   generates code for the LLVM IR call instruction.

   The code you generate should follow the x64 System V AMD64 ABI
   calling conventions, which places the first six 64-bit (or smaller)
   values in registers and pushes the rest onto the stack.  Note that,
   since all LLVM IR operands are 64-bit values, the first six
   operands will always be placed in registers.  (See the notes about
   compiling fdecl below.)

   [ NOTE: It is the caller's responsibility to clean up arguments
   pushed onto the stack, so you must free the stack space after the
   call returns. ]

   [ NOTE: Don't forget to preserve caller-save registers (only if
   needed). ]
*)
let compile_call (ctxt:ctxt) (opcode:opcode) = 
  (*
    rdi, rsi, rdx, rcx, r09, r08 are the the first 6 arguments
    other arguments placed on stack
   cleanup stack saved arguments
  
  match opcode with
    | Call*)
  failwith "unimplemented compile_call"



(* compiling getelementptr (gep)  ------------------------------------------- *)

(* The getelementptr instruction computes an address by indexing into
   a datastructure, following a path of offsets.  It computes the
   address based on the size of the data, which is dictated by the
   data's type.

   To compile getelementptr, you must generate x86 code that performs
   the appropriate arithmetic calculations.
*)

(* [size_ty] maps an LLVMlite type to a size in bytes.
    (needed for getelementptr)

   - the size of a struct is the sum of the sizes of each component
   - the size of an array of t's with n elements is n * the size of t
   - all pointers, I1, and I64 are 8 bytes
   - the size of a named type is the size of its definition

   - Void, i8, and functions have undefined sizes according to LLVMlite.
     Your function should simply return 0 in those cases
*)
let rec size_ty (tdecls:(tid * ty) list) (t:Ll.ty) : int =
  match t with 
    | Void  | I8 | Fun _  -> 0
    | I1 | I64 | Ptr _    -> 8
    | Struct ty_list      -> List.fold_left (fun b ty -> size_ty tdecls ty + b) 0 ty_list
    | Array (n, ty)       -> n * size_ty tdecls ty
    | Namedt tid          -> size_ty tdecls @@ lookup tdecls tid




(* Generates code that computes a pointer value.

   1. op must be of pointer type: t*

   2. the value of op is the base address of the calculation

   3. the first index in the path is treated as the index into an array
     of elements of type t located at the base address

   4. subsequent indices are interpreted according to the type t:

     - if t is a struct, the index must be a constant n and it
       picks out the n'th element of the struct. [ NOTE: the offset
       within the struct of the n'th element is determined by the
       sizes of the types of the previous elements ]

     - if t is an array, the index can be any operand, and its
       value determines the offset within the array.

     - if t is any other type, the path is invalid

   5. if the index is valid, the remainder of the path is computed as
      in (4), but relative to the type f the sub-element picked out
      by the path so far
*)
exception GEP_NO_PNTR
exception GEP_INVALID_PATH_TYPE of Ll.ty
exception GEP_STRUCT_NEEDS_CONST_INDEX
let compile_gep (ctxt:ctxt) (op : Ll.ty * Ll.operand) (path: Ll.operand list) : ins list =
  let { tdecls = tdecls; layout = layout } = ctxt in
  let op_type, _ = op in
  let operand = match op_type with
    | Ptr ty    ->  let _, oprnd = op in oprnd
    | _         ->  raise GEP_NO_PNTR
  in
  (*interm_reg1 always holds the final value of one path step*)
  let interm_reg1 = Reg R12 in
  let interm_reg2 = Reg R13 in
  let type_size (t:Ll.ty) = size_ty tdecls t in
  let compile_rd_opnd = compile_read_operand ctxt in
  
  (*interm_reg1 holds the base address*)
  let base_addr = compile_rd_opnd interm_reg1 operand in

  let rec compile_traverse_path (ty: Ll.ty) (rem_path: Ll.operand list) (insns: ins list) = 
    match rem_path with
      | []                -> insns
      | opnd :: next_path -> (
        let curr_type_size = type_size ty in
        let compile_index = compile_rd_opnd interm_reg2 opnd in
        let rec get_next_type t = 
          if List.length path > 1 
          then 
            match t with
              | Void | I8 | I1 
              | Fun _ | I64 -> t
              | Ptr ty        -> get_next_type ty
              | Struct ty_list      -> (
                match opnd with
                  | Const i   -> List.nth ty_list (Int64.to_int i)
                  | _         -> raise GEP_STRUCT_NEEDS_CONST_INDEX
              )
              | Array (n, typ)       -> typ
              | Namedt tid          -> get_next_type @@ lookup tdecls tid
          else ty

        in
        let new_insns = insns
          @ compile_index 
          @ [ Imulq, [Imm (Lit (Int64.of_int curr_type_size)); interm_reg2]
            ; Addq, [interm_reg2; interm_reg1]
            ]
        in 
        let next_type = get_next_type ty in
        compile_traverse_path next_type next_path new_insns
      )
  in
  let path_traversal = compile_traverse_path op_type path [] in
  base_addr @ path_traversal




(* compiling instructions  -------------------------------------------------- *)

(* The result of compiling a single LLVM instruction might be many x86
   instructions.  We have not determined the structure of this code
   for you. Some of the instructions require only a couple of assembly
   instructions, while others require more.  We have suggested that
   you need at least compile_operand, compile_call, and compile_gep
   helpers; you may introduce more as you see fit.

   Here are a few notes:

   - Icmp:  the Setb instruction may be of use.  Depending on how you
     compile Cbr, you may want to ensure that the value produced by
     Icmp is exactly 0 or 1.

   - Load & Store: these need to dereference the pointers. Const and
     Null operands aren't valid pointers.  Don't forget to
     Platform.mangle the global identifier.

   - Alloca: needs to return a pointer into the stack

   - Bitcast: does nothing interesting at the assembly level
*)
let compile_insn (ctxt:ctxt) ((uid:uid), (i:Ll.insn)) : X86.ins list =
  let { tdecls = tdecls; layout = layout } = ctxt in
  let compile_rd_opnd = compile_read_operand ctxt in
  let res_loc = lookup layout uid in
  let interm_res_reg = Reg R12 in
  let res_to_dest = Movq, [interm_res_reg; res_loc] in
  match i with 
  | Binop (bop, ty, operand1, operand2) -> (
      let get_frst_oprnd = compile_rd_opnd (Reg R13) operand1 in
      let get_scnd_oprnd = compile_rd_opnd interm_res_reg operand2 in
      let get_opnds = get_frst_oprnd @ get_scnd_oprnd in
      let get_shft_opnds = get_frst_oprnd @ (compile_rd_opnd (Reg Rcx) operand2) in
      match bop with
          | Add   ->  get_opnds @ [ Addq, [Reg R13; interm_res_reg]; res_to_dest]
          | Sub   ->  get_opnds @ [ Subq, [Reg R12; Reg R13]; Movq, [Reg R13; res_loc]]
          | Mul   ->  get_opnds @ [ Imulq, [Reg R13; interm_res_reg]; res_to_dest]
          | Shl   ->  get_shft_opnds @ [ Shlq, [Reg Rcx; Reg R13]; Movq, [Reg R13; res_loc]]
          | Lshr  ->  get_shft_opnds @ [ Shrq, [Reg Rcx; Reg R13]; Movq, [Reg R13; res_loc]]
          | Ashr  ->  get_shft_opnds @ [ Sarq, [Reg Rcx; Reg R13]; Movq, [Reg R13; res_loc]]
          | And   ->  get_opnds @ [ Andq, [Reg R13; interm_res_reg]; res_to_dest]
          | Or    ->  get_opnds @ [ Orq, [Reg R13; interm_res_reg]; res_to_dest]
          | Xor   ->  get_opnds @ [ Xorq, [Reg R13; interm_res_reg]; res_to_dest]
  )
  | Icmp (cnd, ty, operand1, operand2) -> (
      let x84Cnd = compile_cnd cnd in
      [Set x84Cnd, [res_loc]]
  )
  | Load (ty, operand)  -> compile_rd_opnd res_loc operand
  | Store (ty, operand1, operand2) -> (
      compile_rd_opnd interm_res_reg operand1
      @ [ compile_operand ctxt (Reg R13) operand2
        ; Movq, [interm_res_reg; Ind2 R13]];
  )
  | Alloca ty -> [](*
      [ Subq, [ Imm( Lit (Int64.of_int @@ size_ty tdecls ty)); Reg Rsp]
        ; Movq, [ Reg Rsp; res_loc]
      ]
  *)
  | Gep (ty, operand, path) ->  (compile_gep ctxt (ty, operand) path) @ [res_to_dest]
  | Bitcast (ty1, operand, ty2) -> []
  (*| Call ty compile_call
  | Call of ty * operand * (ty * operand) list
  
  *)
  | _ -> failwith "Instruction not implemented"



(* compiling terminators  --------------------------------------------------- *)

(* prefix the function name [fn] to a label to ensure that the X86 labels are 
   globally unique . *)
let mk_lbl (fn:string) (l:string) = fn ^ "." ^ l

(* Compile block terminators is not too difficult:

   - Ret should properly exit the function: freeing stack space,
     restoring the value of %rbp, and putting the return value (if
     any) in %rax.

   - Br should jump

   - Cbr branch should treat its operand as a boolean conditional

   [fn] - the name of the function containing this terminator
*)
let compile_terminator (fn:string) (ctxt:ctxt) (t:Ll.terminator) : ins list =
  let intermediate_reg = Reg R12 in
  let {layout = layout} = ctxt in
  let n_stack_slots = List.length layout in
  let space_to_allocate_op = Imm (Lit (Int64.of_int @@ n_stack_slots*8))  in
    match t with
    | Ret (_, Some o) -> (compile_read_operand ctxt (Reg Rax) o ) 
                        @ [ Addq, [space_to_allocate_op; Reg Rsp]
                          ; Popq, [Reg Rbp]
                          ; Retq, []]
    | Ret (_, None)   -> [  (*TODO: What happens with void function returns*)
                            Addq, [space_to_allocate_op; Reg Rsp]
                          ; Popq, [Reg Rbp]
                          ; Retq, []
                        ]
    | Br l            -> [ Jmp, [Imm (Lbl (mk_lbl fn l))]]
    | Cbr (o,l1,l2)   -> let comp_bool_op_val = compile_read_operand ctxt intermediate_reg o in
                          comp_bool_op_val @
                          [ Subq, [Imm (Lit 1L); intermediate_reg]
                          ; J Eq, [Imm (Lbl (mk_lbl fn l1))]
                          ; Jmp, [Imm (Lbl (mk_lbl fn l2))]
                          ]


(* compiling blocks --------------------------------------------------------- *)

(* We have left this helper function here for you to complete. 
   [fn] - the name of the function containing this block
   [ctxt] - the current context
   [blk]  - LLVM IR code for the block
*)
let compile_block (fn:string) (ctxt:ctxt) (blk:Ll.block) : ins list =
  let { insns = insns; term = (termLbl, term) } = blk in 
  let insns_asm = List.concat_map (compile_insn ctxt) insns in
  let term_asm = compile_terminator fn ctxt term in
  insns_asm @ term_asm

let compile_lbl_block fn lbl ctxt blk : elem =
  Asm.text (mk_lbl fn lbl) (compile_block fn ctxt blk)



(* compile_fdecl ------------------------------------------------------------ *)


(* This helper function computes the location of the nth incoming
   function argument: either in a register or relative to %rbp,
   according to the calling conventions.  You might find it useful for
   compile_fdecl.

   [ NOTE: the first six arguments are numbered 0 .. 5 ]
*)
let arg_loc (n : int) : operand =
  match n with
    | 0   -> Reg Rdi
    | 1   -> Reg Rsi
    | 2   -> Reg Rdx
    | 3   -> Reg Rcx
    | 4   -> Reg R09
    | 5   -> Reg R08
    | m   -> Ind3 (Lit (Int64.of_int @@ (n-6)*8), Rbp)


(* We suggest that you create a helper function that computes the
   stack layout for a given function declaration.

   - each function argument should be copied into a stack slot
   - in this (inefficient) compilation strategy, each local id
     is also stored as a stack slot.
   - see the discussion about locals

*)
let stack_layout (args : uid list) ((block, lbled_blocks):cfg) : layout =
  let generate_offset_op i = Ind3 (Lit (Int64.of_int @@ i*(-8)), Rbp) in
  let param_to_stack_f (i:int) (param:uid) = 
    let dest = generate_offset_op (i+1) in
    (param, dest)
  in
  let sieve_uid_definitions = function
    | (_, Store _ ) | (_, Call _) -> false
    | _                      -> true
  in
  let extract_insns (lbl, b) = 
      let { insns = b_insns; term = _ } = b in
      b_insns
  in
  (*let insns_to_layout (init_offset:int) : (Ll.uid * Ll.insn) -> (int * (Ll.uid * Ll.insn)) list -> (int * (Ll.uid * Ll.insn)) list = 
    fun (u, ins) b -> 
      let base_offset = function 
          | []          -> init_offset 
          | (o, _)::xs  -> o
      in
      let alloc_size = function 
          | Alloca ty -> (size_ty ty) / 8
          | _         -> 1
      in
      let new_offset = base_offset b + alloc_size ins in
      (new_offset, (u, generate_offset_op new_offset)) :: b
  in*)
  let insn_to_layout (offset:int) : int -> (Ll.uid * Ll.insn) -> (Ll.uid * X86.operand)= 
    fun (i:int) (u, _) -> (u, generate_offset_op @@ offset + i) 
  in
  let arg_locs = List.mapi param_to_stack_f args in
  let n_args = List.length arg_locs in
  (*extract one list with all the uids used in the cfg*)
  let { insns = entry_ins_list; term = _ } = block in
  let just_insns : (Ll.uid * Ll.insn) list = entry_ins_list @ (List.concat_map extract_insns lbled_blocks) in
  let uid_insn : (Ll.uid * Ll.insn) list = List.filter sieve_uid_definitions just_insns in
  let locally_defined_uids : layout = List.mapi (insn_to_layout (n_args+1)) uid_insn in
  (*let (_, locally_defined_uids ) = List.split @@ List.fold_left (insns_to_layout n_args+1) [] uid_insn in*)
  let layout = arg_locs @ locally_defined_uids in
  layout

(*returns the asm that saves the arguments on the stack together with the corresponding stack layout*)
let args_to_stack f_param : ins list = 
  let param_to_stack_f (i:int) (param:uid) = 
    let dest = Ind3 (Lit (Int64.of_int @@ (i+1)*(-8)), Rbp) in
    Movq, [arg_loc i; dest]
  in
  List.mapi param_to_stack_f f_param

(* The code for the entry-point of a function must do several things:

   - since our simple compiler maps local %uids to stack slots,
     compiling the control-flow-graph body of an fdecl requires us to
     compute the layout (see the discussion of locals and layout)

   - the function code should also comply with the calling
     conventions, typically by moving arguments out of the parameter
     registers (or stack slots) into local storage space.  For our
     simple compilation strategy, that local storage space should be
     in the stack. (So the function parameters can also be accounted
     for in the layout.)

   - the function entry code should allocate the stack storage needed
     to hold all of the local stack slots.
*)
let compile_fdecl (tdecls:(tid * ty) list) (name:string) ({ f_ty; f_param; f_cfg }:fdecl) : prog =
  (*allocate stack space for the entire function*)
  (*place all arguments in stack*)  
  let layout = stack_layout f_param f_cfg in
  let put_args_on_stack = args_to_stack f_param in
  let ctxt : ctxt = { tdecls = tdecls; layout = layout} in
  let space_to_allocate = List.length layout in 
  let space_to_allocate_op = Imm (Lit (Int64.of_int @@ space_to_allocate*8)) in
  let (entryBlock, blockList) = f_cfg in
  let { insns = entry_ins_list; term = (entryTermLbl, entryTerm) } = entryBlock in 
  
  let entryBlockAsm : asm = 
    let insList = [ Pushq, [Reg Rbp] 
                  ; Movq, [Reg Rsp; Reg Rbp]
                  ; Subq, [space_to_allocate_op; Reg Rsp]
                  ] 
                  @ put_args_on_stack 
                  @ List.concat_map (compile_insn ctxt) entry_ins_list
                  @ compile_terminator name ctxt entryTerm in
    Text insList
  in
  let block_to_asm (lbl, block) = compile_lbl_block name lbl ctxt block in
  let cfg_asm : X86.prog = List.map block_to_asm blockList in
  
  (*let epilogue = compile_terminator name ctxt in*)

  (*compile instructions*)
  (*put together the pieces of the function*)
  let entryAsm : X86.elem = { lbl = name; global= true; asm = entryBlockAsm } in
  (*return the compiled function*)
  entryAsm :: cfg_asm


(* compile_gdecl ------------------------------------------------------------ *)
(* Compile a global value into an X86 global data declaration and map
   a global uid to its associated X86 label.
*)
let rec compile_ginit : ginit -> X86.data list = function
  | GNull     -> [Quad (Lit 0L)]
  | GGid gid  -> [Quad (Lbl (Platform.mangle gid))]
  | GInt c    -> [Quad (Lit c)]
  | GString s -> [Asciz s]
  | GArray gs | GStruct gs -> List.map compile_gdecl gs |> List.flatten
  | GBitcast (t1,g,t2) -> compile_ginit g

and compile_gdecl (_, g) = compile_ginit g


(* compile_prog ------------------------------------------------------------- *)
let compile_prog {tdecls; gdecls; fdecls} : X86.prog =
  let g = fun (lbl, gdecl) -> Asm.data (Platform.mangle lbl) (compile_gdecl gdecl) in
  let f = fun (name, fdecl) -> compile_fdecl tdecls name fdecl in
  (List.map g gdecls) @ (List.map f fdecls |> List.flatten)
