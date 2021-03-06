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

let typ_of_fun (args_ty, ret_ty) = TRef (RFun (args_ty, ret_ty))

let field_to_pair {fieldName = fieldName; ftyp = ftyp} = (fieldName, ftyp)

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
          let in_list1 field = List.mem field field_list1 in
          List.for_all in_list1 field_list2
          )
        | _ -> false
      )
  | (RArray ty1, RArray ty2)  -> ty1 = ty2
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
  | _ -> false

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

let match_len list_a list_b l = 
  if (List.length list_a) = (List.length list_b) then ()
  else type_error l "have different amount of vars"

let rec typecheck_exp (c : Tctxt.t) (e : Ast.exp node) : Ast.ty =
  let check_ty ty = typecheck_ty e c ty in
  
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
  | CStruct (sname, inits) -> (
    (* structS{t1x1;..;tnxn} in H *)
    let fields = match lookup_struct_option sname c with
    | None -> type_error e ("struct not in context " ^ sname)
    | Some fields -> fields
    in
    (* fields may be permuted undernew -> sorting *)
    let field_names, field_tys = List.split @@ List.sort compare (List.map field_to_pair fields) in
    let init_names, init_exps = List.split @@ List.sort compare inits in
    (* check identifier equality *)
    if field_names <> init_names then type_error e ("struct init names not matching " ^ sname) else
    (* H;G;L |- expi:t'i *) (* H |- t'i <= ti *)
    List.iter2 (subtypecheck_exp_ty c) init_exps field_tys;
    TRef (RStruct sname)
  )
  | Proj (strct, fname) -> (
    (* H;G;L |- exp:S *)
    let id = match typecheck_exp c strct  with
    | TRef (RStruct id) -> id
    | _ -> type_error e "not a struct type"
    in
    (* struct S{fields} in H *) (* t x in fields *)
    match lookup_field_option id fname c with
    | None -> type_error e ("field " ^ fname ^ " not in struct " ^ id)
    | Some field_ty -> field_ty
  )
  | Call (func, args_exp) -> (
    (* H;G;L |- exp:(t1, .. ,tn) -> t *)
    let args_ty, ty = match typecheck_exp c func with
    | TRef (RFun (args_ty, RetVal ty)) -> args_ty, ty
    | _ -> type_error e "not a function type"
    in
    (* H;G;L |- exp_i:t_i *) (* H |- t′_i <= t_i *)
    match_len args_exp args_ty e;
    List.iter2 (subtypecheck_exp_ty c) args_exp args_ty;
    ty
  )
  | Bop (op, exp1, exp2) -> (
    match op with
    | Eq | Neq -> (
      (* H;G;L |- exp1:t1 *)
      let t1 = typecheck_exp c exp1 in
      (* H;G;L |- exp2:t2 *)
      let t2 = typecheck_exp c exp2 in
      (* H |- t1 <= t2 *)
      subtypecheck_ty_ty c t1 t2 e;
      (* H |- t2 <= t1 *)
      subtypecheck_ty_ty c t2 t1 e;
      TBool
    )
    | op -> (
      (* |- bop:(t1,t2) -> t*)
      let in1_ty, in2_ty, out_ty = typ_of_binop op in
      (* H;G;L |- exp1:t1 *)
      typecheck_exp_ty c exp1 in1_ty;
      (* H;G;L |- exp2:t2 *)
      typecheck_exp_ty c exp2 in2_ty;
      out_ty
    )
  )
  | Uop (op, exp) -> (
    (* |- uop:(t) -> t *)
    let in_ty, out_ty = typ_of_unop op in
    (* H;G;L |- exp:t *)
    typecheck_exp_ty c exp in_ty;
    (* H;G;L |- uop exp:t *)
    out_ty
  )

and typecheck_exp_ty c e ty =
  let exp_ty = typecheck_exp c e in 
  if  exp_ty = ty then ()
  else type_error e ("expected: " ^ (string_of_ty exp_ty) ^ " but got: " ^ (string_of_ty ty))

and subtypecheck_exp_ty c e ty = 
  let exp_ty = typecheck_exp c e in 
  (* is it ok not to remove G and L? *)
  if (subtype c exp_ty ty) then ()
  else type_error e ("expected: " ^ (string_of_ty exp_ty) ^ " but got: " ^ (string_of_ty ty))

and subtypecheck_ty_ty c t1 t2 (l : 'a node) =
  if (subtype c t1 t2) then ()
  else type_error l ("expected: " ^ (string_of_ty t1) ^ " but got: " ^ (string_of_ty t2))

and typecheck_exp_arr c arr =
  match typecheck_exp c arr with
  | TRef (RArray t) -> t
  | t -> type_error arr ("expected array type but got: " ^ string_of_ty t)

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
    (* H;G;L |- lhs:t *)
    let lhs_ty = typecheck_exp tc lhs in
    begin (* lhs grammar check *)
      match lhs.elt with
        | Index _ | Proj _ -> ()
        | Id id -> (
          match (lookup_local_option id tc), lhs_ty with
          (* lhs:t in L *)
          | (Some _), _ -> ()
          | None , (TRef (RFun _)) -> type_error lhs ("Can't assign to global function " ^ (string_of_exp lhs))
          (* lhs not a function id *)
          | _ -> ()
        )
        | _ -> type_error lhs ("Expression not assignable" ^ (string_of_exp lhs))
    end;
    (* H;G;L |- exp:t' *)
    let exp_ty = typecheck_exp tc exp in
    (* H |- t' <= t *)
    if (subtype tc exp_ty lhs_ty) then tc, false
    else type_error s ("can't assign exp of type " ^ (string_of_ty exp_ty) ^ " to variable of type " ^ (string_of_ty lhs_ty))
  )
  | Decl vdecl -> (typecheck_decl tc vdecl), false
  | Ret exp_opt -> (
    match exp_opt, to_ret with
    | None, RetVoid -> tc, true
    | Some exp, RetVal rt -> 
      if subtype tc (typecheck_exp tc exp) rt then tc, true
      else type_error s "returned of wrong type"
    | _ -> type_error s "returned of wrong type"
  )
  | SCall (f, arg_exps) -> (
    let fty = typecheck_exp tc f in
    let arg_tys = match fty with
    | TRef (RFun (args, RetVoid)) -> args
    | _ -> type_error s "not a void function"
    in 
    match_len arg_exps arg_tys s;
    List.iter2 (subtypecheck_exp_ty tc) arg_exps arg_tys;
    tc, false
  )
  | If (test, then_stmts, else_stmts) -> (
    typecheck_exp_ty tc test TBool;
    let r1 = typecheck_block tc to_ret then_stmts in
    let r2 = typecheck_block tc to_ret else_stmts in
    tc, r1 && r2
  )
  | Cast (rty, id, exp, then_stmts, else_stmts) -> (
    let rty' = match typecheck_exp tc exp with
    | TNullRef r -> r
    | _ -> type_error s "not a possible null reference type"
    in 
    subtypecheck_ty_ty tc (TRef rty') (TRef rty) exp;
    let r1 = typecheck_block (add_local tc id (TRef rty)) to_ret then_stmts in
    let r2 = typecheck_block tc to_ret else_stmts in
    tc, r1 && r2
  )
  | For (vdecls, test_opt, post_opt, body) -> (
    (* can't reuse while, because of L_2 ! *)
    (* H;G;L_1 |- vdecls => L_2 *)
    let tc' = typecheck_vdecls tc vdecls in
    (* H;G;L_2 |- exp : bool *)
    let test = match test_opt with | Some t -> t | None -> no_loc (CBool true) in
    typecheck_exp_ty tc' test TBool;
    (* H;G;L_2;rt |- stmt => L_3, false *)
    begin
      match post_opt with
      | Some stmt -> (
        match typecheck_stmt tc' stmt to_ret with
        | _, false -> ()
        | _, true -> type_error s "post statement of for shouldn't return"
      )
      | None -> ()
    end;
    (* H;G;L_2;rt |- block;r *)
    let _ = typecheck_block tc' to_ret body in
    tc, false

  )
  | While (test, body) -> (
    typecheck_exp_ty tc test TBool;
    let _ = typecheck_block tc to_ret body in
    tc, false;
  )

and typecheck_block tc rt stmt_nodes : bool = 

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
      (* REMOVE: will be done later: typecheck_tdecl tc id fs n; *)
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
  (* can we assume that builtins are well-typed? *)
  let fnames, ftys = List.split builtins in
  let fun_tys = List.map typ_of_fun ftys in
  let tc' = List.fold_left2 add_global tc fnames fun_tys in
  let typecheck_decl tc d = 
    match d with
    | Gvdecl _ | Gtdecl _ -> tc
    | Gfdecl n -> (
      (* REMOVE: will be done later: typecheck_fdecl tc n.elt n; *)
      let {frtyp = frtyp; fname = fname; args = args} = n.elt in
      match lookup_global_option fname tc with
      | Some _ -> type_error n ("Function redefined: " ^ fname)
      | None -> add_global tc fname (typecheck_ftyp tc n)
    )
  in List.fold_left typecheck_decl tc' p

let create_global_ctxt (tc:Tctxt.t) (p:Ast.prog) : Tctxt.t =
  let typecheck_decl tc d = 
    match d with
    | Gtdecl _ | Gfdecl _ -> tc
    | Gvdecl n -> (
      (* TODO: typecheck gexp? *)
      let rec contains_gid exp_node = match exp_node.elt with
      | CNull _ | CBool _ | CInt _ | CStr _ -> ()
      | Id id -> (
        let is_id : decl -> bool = function
        | Gtdecl _ | Gfdecl _ -> false
        | Gvdecl {elt = {name = name}} -> name = id
        in
        if List.exists is_id p then type_error exp_node "gexp can't contains global variables"
        else ()
      )
      | CArr (_, exps) -> List.iter contains_gid exps
      | CStruct (_, fields) -> List.iter contains_gid (snd (List.split fields))
      | _ -> type_error exp_node "this is not a gexp"
      in 
      let {name = name; init = init} = n.elt in
      match lookup_global_option name tc with
      | Some _ -> type_error n ("Variable redefined: " ^ name)
      | None ->  contains_gid init; add_global tc name (typecheck_exp tc init)
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
