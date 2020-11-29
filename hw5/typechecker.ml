open Ast
open Astlib
open Tctxt

(* Error Reporting ---------------------------------------------------------- *)
(* NOTE: Use type_error to report error messages for ill-typed programs. *)

exception TypeError of string

let type_error (l : 'a node) err = 
  let (_, (s, e), _) = l.loc in
  raise (TypeError (Printf.sprintf "[%d, %d] %s" s e err))


(* initial context: G0 ------------------------------------------------------ *)
(* The Oat types of the Oat built-in functions *)
let builtins =
  [ "array_of_string",  ([TRef RString],  RetVal (TRef(RArray TInt)))
  ; "string_of_array",  ([TRef(RArray TInt)], RetVal (TRef RString))
  ; "length_of_string", ([TRef RString],  RetVal TInt)
  ; "string_of_int",    ([TInt], RetVal (TRef RString))
  ; "string_cat",       ([TRef RString; TRef RString], RetVal (TRef RString))
  ; "print_string",     ([TRef RString],  RetVoid)
  ; "print_int",        ([TInt], RetVoid)
  ; "print_bool",       ([TBool], RetVoid)
  ]

(* binary operation types --------------------------------------------------- *)
let typ_of_binop : Ast.binop -> Ast.ty * Ast.ty * Ast.ty = function
  | Add | Mul | Sub | Shl | Shr | Sar | IAnd | IOr -> (TInt, TInt, TInt)
  | Lt | Lte | Gt | Gte -> (TInt, TInt, TBool)
  | And | Or -> (TBool, TBool, TBool)
  | Eq | Neq -> failwith "typ_of_binop called on polymorphic == or !="

(* unary operation types ---------------------------------------------------- *)
let typ_of_unop : Ast.unop -> Ast.ty * Ast.ty = function
  | Neg | Bitnot -> (TInt, TInt)
  | Lognot       -> (TBool, TBool)

(* subtyping ---------------------------------------------------------------- *)
(* Decides whether H |- t1 <: t2 
    - assumes that H contains the declarations of all the possible struct types

    - you will want to introduce addition (possibly mutually recursive) 
      helper functions to implement the different judgments of the subtyping
      relation. We have included a template for subtype_ref to get you started.
      (Don't forget about OCaml's 'and' keyword.)
*)
let rec subtype (c : Tctxt.t) (t1 : Ast.ty) (t2 : Ast.ty) : bool =
  match (t1, t2) with
  | (TBool, TBool) -> true
  | (TInt, TInt) -> true
  | (TRef rty1, TRef rty2) 
  | (TNullRef rty1, TNullRef rty2)
  | (TRef rty1, TNullRef rty2) 
      -> subtype_ref c rty1 rty2
  | _ -> false

(* Decides whether H |-r ref1 <: ref2 *)
and subtype_ref (c : Tctxt.t) (t1 : Ast.rty) (t2 : Ast.rty) : bool =
  match (t1, t2) with
    | (RString, RString) -> true
    | (RStruct struct_id1, RStruct struct_id2) -> (
      match (lookup_struct_option struct_id1 c, lookup_struct_option struct_id2 c) with
        | (Some field_list1, Some field_list2) -> (
            let contained b field = 
              let found = match lookup_field_option struct_id1 field.fieldName c with 
                  | Some _ -> true
                  | None   -> false
              in
              b && found
            in
            (* Checks whether the names of the structure struct_id2 are all contained inside the structure s1 *)
            let subtype_condition = List.fold_left contained true field_list2 in
            
            if subtype_condition 
            then (*
                  TODO: Is this step even necessary?

                  let struct1_ok = typecheck_tdecl c struct_id1 field_list1 (no_loc t1) in
                  let struct2_ok = typecheck_tdecl c struct_id2 field_list2 (no_loc t2) in
                  struct1_ok && struct2_ok 
                  *)
                  true
            else false
          )
        | _ -> false
      )
  | (RArray ty1, RArray ty2)  -> true
  | (RFun (ty_list1, ret_ty1), RFun (ty_list2, ret_ty2)) -> 
    (* For argument subtype check the args of the second list must be subtypes 
        of the corresponding args of the first list
    *)
    let args_ok = List.fold_left2 (fun b t' t -> b && (subtype c t' t)) true ty_list2 ty_list1 in
    let rt_ok = subtype_ret c ret_ty1 ret_ty2 in
    args_ok && rt_ok
  | _ -> false

and subtype_ret (c : Tctxt.t) (t1 : Ast.ret_ty) (t2 : Ast.ret_ty) : bool =
  match (t1, t2) with
  | (RetVoid, RetVoid) -> true
  | (RetVal ty1, RetVal ty2) -> subtype c ty1 ty2

(* well-formed types -------------------------------------------------------- *)
(* Implement a (set of) functions that check that types are well formed according
   to the H |- t and related inference rules

    - the function should succeed by returning () if the type is well-formed
      according to the rules

    - the function should fail using the "type_error" helper function if the 
      type is 

    - l is just an ast node that provides source location information for
      generating error messages (it's only needed for the type_error generation)

    - tc contains the structure definition context
 *)
let rec typecheck_ty (l : 'a Ast.node) (tc : Tctxt.t) (t : Ast.ty) : unit =
  match t with
  | TBool -> ()
  | TInt -> ()
  | TRef rty | TNullRef rty -> typecheck_rty l tc rty

and typecheck_rty (l : 'a Ast.node) (tc : Tctxt.t) (t : Ast.rty) : unit = 
  match t with
  | RString -> ()
  | RStruct id -> (
      match lookup_struct_option id tc with 
        | Some fl -> ()
        | None    -> type_error l "structure not in context."

      (* typecheck_tdecl tc id field_list l *)
  )
  | RArray ty -> typecheck_ty l tc ty
  | RFun (ty_list, ret_ty) ->
      List.fold_left (fun b ty -> typecheck_ty l tc ty) () ty_list;
      typecheck_ret_ty l tc ret_ty

and typecheck_ret_ty (l : 'a Ast.node) (tc : Tctxt.t) (t : Ast.ret_ty) : unit = 
  match t with
  | RetVoid -> ()
  | RetVal ty -> typecheck_ty l tc ty
  | _ -> type_error l "wrong return type."


(* typechecking expressions ------------------------------------------------- *)
(* Typechecks an expression in the typing context c, returns the type of the
   expression.  This function should implement the inference rules given in the
   oad.pdf specification.  There, they are written:

       H; G; L |- exp : t

   See tctxt.ml for the implementation of the context c, which represents the
   four typing contexts: H - for structure definitions G - for global
   identifiers L - for local identifiers

   Returns the (most precise) type for the expression, if it is type correct
   according to the inference rules.

   Uses the type_error function to indicate a (useful!) error message if the
   expression is not type correct.  The exact wording of the error message is
   not important, but the fact that the error is raised, is important.  (Our
   tests also do not check the location information associated with the error.)

   Notes: - Structure values permit the programmer to write the fields in any
   order (compared with the structure definition).  This means that, given the
   declaration struct T { a:int; b:int; c:int } The expression new T {b=3; c=4;
   a=1} is well typed.  (You should sort the fields to compare them.)

*)

let not_in_local id c n = 
  match lookup_local_option id c with
  | None -> ()
  | Some _ -> type_error n ("Id already in local context: " ^ id)

let rec typecheck_exp (c : Tctxt.t) (e : Ast.exp node) : Ast.ty =
  let check_ty ty = typecheck_ty e c ty in
  let typecheck_exp_ty c e ty =
    let exp_ty = typecheck_exp c e in 
    if  exp_ty = ty then ()
    else type_error e ("expected: " ^ (string_of_ty exp_ty) ^ " but got: " ^ (string_of_ty ty))
  in let subtypecheck_exp_ty c e ty = 
    let exp_ty = typecheck_exp c e in 
    (* is it ok not to remove G and L? *)
    if (subtype c exp_ty ty) then ()
    else type_error e ("expected: " ^ (string_of_ty exp_ty) ^ " but got: " ^ (string_of_ty ty))
  in let typecheck_exp_arr c arr =
    match typecheck_exp c arr with
    | TRef (RArray t) -> t
    | t -> type_error arr ("expected array type but got: " ^ string_of_ty t)
  in
  match e.elt with
  | CNull rty -> check_ty (TRef rty); TNullRef rty
  | CBool _ -> TBool
  | CInt _ -> TInt
  | CStr _ -> TRef RString
  | Id id -> (
    (* auto checks local first, then global *)
    match lookup_option id c with
    | Some ty -> ty
    | None -> type_error e ("Id not in Context: " ^ id)
  )
  | CArr (ty, exps) -> (
    check_ty ty;
    List.iter (fun exp -> subtypecheck_exp_ty c exp ty) exps;
    TRef (RArray ty)
  )
  | NewArr (ty, len, i, init) -> (
    check_ty ty;
    typecheck_exp_ty c len TInt;
    not_in_local i c e;
    subtypecheck_exp_ty (add_local c i TInt) init ty;
    TRef (RArray ty)
  )
  | Index (arr, ind) -> (
    typecheck_exp_ty c ind TInt;
    typecheck_exp_arr c arr
  )
  | Length arr -> (
    ignore (typecheck_exp_arr c arr);
    TInt
  )
  | _ -> failwith "todo: implement typecheck_exp"

(* statements --------------------------------------------------------------- *)

(* Typecheck a statement 
   This function should implement the statment typechecking rules from oat.pdf.  

   Inputs:
    - tc: the type context
    - s: the statement node
    - to_ret: the desired return type (from the function declaration)

   Returns:
     - the new type context (which includes newly declared variables in scope
       after this statement
     - A boolean indicating the return behavior of a statement:
        false:  might not return
        true: definitely returns 

        in the branching statements, both branches must definitely return

        Intuitively: if one of the two branches of a conditional does not 
        contain a return statement, then the entier conditional statement might 
        not return.
  
        looping constructs never definitely return 

   Uses the type_error function to indicate a (useful!) error message if the
   statement is not type correct.  The exact wording of the error message is
   not important, but the fact that the error is raised, is important.  (Our
   tests also do not check the location information associated with the error.)

   - You will probably find it convenient to add a helper function that implements the 
     block typecheck rules.
*)

let typecheck_decl c vdecl =
  let id, exp_node = vdecl in
  let ty = typecheck_exp c exp_node in
  not_in_local id c exp_node;
  add_local c id ty

let typecheck_vdecls c vdecls = 
  List.fold_left typecheck_decl c vdecls

let rec typecheck_stmt (tc : Tctxt.t) (s:Ast.stmt node) (to_ret:ret_ty) : Tctxt.t * bool =
  match s.elt with
  | Assn (lhs, exp) -> (
    (* TODO: probably wrong *)
    let lhs_test = function
      | Id _ | Index _ | Proj _ -> ()
      | _ -> type_error lhs ("Expression not assignable" ^ (string_of_exp lhs))
    in let global_fun_test = function
      | TRef (RFun _) -> type_error lhs ("Can't assign to global function " ^ (string_of_exp lhs))
      | _ -> ()
    in
    lhs_test lhs.elt;
    let lhs_ty = typecheck_exp tc lhs in
    global_fun_test lhs_ty;
    let exp_ty = typecheck_exp tc exp in
    if (subtype tc exp_ty lhs_ty) then tc, false
    else type_error s ("can't assign exp of type " ^ (string_of_ty exp_ty) ^ " to variable of type " ^ (string_of_ty lhs_ty))
  )
  | Decl vdecl -> (typecheck_decl tc vdecl), false
  | Ret exp_opt -> failwith "todo: implement typecheck_stmt Ret"
  | SCall (f, args) -> failwith "todo: implement typecheck_stmt SCall"
  | If (test, then_stmts, else_stmts) -> failwith "todo: implement typecheck_stmt If"
  | Cast (rty, id, exp, then_stmts, else_stmts) -> failwith "todo: implement typecheck_stmt Cast"
  | For (vdecls, test_opt, post_opt, body) -> failwith "todo: implement typecheck_stmt For"
  | While (test, body) -> failwith "todo: implement typecheck_stmt While"

let typecheck_block tc rt stmt_nodes : bool = 

  let rec typecheck_stmts tc stmts to_ret = match stmts with
  | [] -> tc, false
  | s :: [] -> typecheck_stmt tc s to_ret
  | s :: n :: tl -> (
    let tc' , returns = typecheck_stmt tc s to_ret in
    if returns
    then type_error n "statement unreachable"
    else typecheck_stmts tc' (n::tl) to_ret
  )
  in
  snd @@ typecheck_stmts tc stmt_nodes rt

(* struct type declarations ------------------------------------------------- *)
(* Here is an example of how to implement the TYP_TDECLOK rule, which is 
   is needed elswhere in the type system.
 *)

(* Helper function to look for duplicate field names *)
let rec check_dups fs =
  match fs with
  | [] -> false
  | h :: t -> (List.exists (fun x -> x.fieldName = h.fieldName) t) || check_dups t

let typecheck_tdecl (tc : Tctxt.t) id fs  (l : 'a Ast.node) : unit =
  if check_dups fs
  then type_error l ("Repeated fields in " ^ id) 
  else List.iter (fun f -> typecheck_ty l tc f.ftyp) fs

(* function declarations ---------------------------------------------------- *)
(* typecheck a function declaration 
    - extends the local context with the types of the formal parameters to the 
      function
    - typechecks the body of the function (passing in the expected return type
    - checks that the function actually returns
*)

let rec check_dups_id = function
  | [] -> false
  | h :: t -> (List.mem h t) || check_dups_id t

let typecheck_fdecl (tc : Tctxt.t) (f : Ast.fdecl) (l : 'a Ast.node) : unit =
  let {frtyp = frtyp; fname = fname; args = args; body = body} = f in
  let args_ty, args_name = List.split args in
  if check_dups_id args_name
  then type_error l ("Repeated argument in " ^ fname)
  else (
    let tc' = List.fold_left2 add_local tc args_name args_ty in
    if typecheck_block tc' frtyp body
    then ()
    else type_error l ("Function is not guaranteed to return: " ^ fname)
  )

(* creating the typchecking context ----------------------------------------- *)

(* The following functions correspond to the
   judgments that create the global typechecking context.

   create_struct_ctxt: - adds all the struct types to the struct 'S'
   context (checking to see that there are no duplicate fields

     H |-s prog ==> H'


   create_function_ctxt: - adds the the function identifiers and their
   types to the 'F' context (ensuring that there are no redeclared
   function identifiers)

     H ; G1 |-f prog ==> G2


   create_global_ctxt: - typechecks the global initializers and adds
   their identifiers to the 'G' global context

     H ; G1 |-g prog ==> G2    


   NOTE: global initializers may mention function identifiers as
   constants, but can't mention other global values *)

let create_struct_ctxt (p:Ast.prog) : Tctxt.t =
  let typecheck_decl tc d = 
    match d with
    | Gvdecl _ | Gfdecl _ -> tc
    | Gtdecl n -> (
      let {elt = (id, fs)} = n in
      typecheck_tdecl tc id fs n;
      match lookup_struct_option id tc with
      | Some _ -> type_error n ("Struct redefined: " ^ id)
      | None -> add_struct tc id fs
    )
  in List.fold_left typecheck_decl empty p

let typecheck_ftyp tc fdecl_node = 
  let {frtyp = frtyp; fname = fname; args = args} = fdecl_node.elt in
  let args_ty, _ = List.split args in
  typecheck_ret_ty fdecl_node tc frtyp;
  List.iter (typecheck_ty fdecl_node tc) args_ty;
  TRef (RFun (args_ty, frtyp))

let create_function_ctxt (tc:Tctxt.t) (p:Ast.prog) : Tctxt.t =
  let typecheck_decl tc d = 
    match d with
    | Gvdecl _ | Gtdecl _ -> tc
    | Gfdecl n -> (
      typecheck_fdecl tc n.elt n;
      let {frtyp = frtyp; fname = fname; args = args} = n.elt in
      match lookup_global_option fname tc with
      | Some _ -> type_error n ("Function redefined: " ^ fname)
      | None -> add_global tc fname (typecheck_ftyp tc n)
    )
  in List.fold_left typecheck_decl tc p

let create_global_ctxt (tc:Tctxt.t) (p:Ast.prog) : Tctxt.t =
  let typecheck_decl tc d = 
    match d with
    | Gtdecl _ | Gfdecl _ -> tc
    | Gvdecl n -> (
      (* TODO: typecheck gexp? *)
      let {name = name; init = init} = n.elt in
      match lookup_global_option name tc with
      | Some _ -> type_error n ("Variable redefined: " ^ name)
      | None ->  add_global tc name (typecheck_exp tc init)
    )
  in List.fold_left typecheck_decl tc p


(* This function implements the |- prog and the H ; G |- prog 
   rules of the oat.pdf specification.   
*)
let typecheck_program (p:Ast.prog) : unit =
  let sc = create_struct_ctxt p in
  let fc = create_function_ctxt sc p in
  let tc = create_global_ctxt fc p in
  List.iter (fun p ->
    match p with
    | Gfdecl ({elt=f} as l) -> typecheck_fdecl tc f l
    | Gtdecl ({elt=(id, fs)} as l) -> typecheck_tdecl tc id fs l 
    | _ -> ()) p
