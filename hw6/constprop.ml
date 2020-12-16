open Ll
open Datastructures

(* The lattice of symbolic constants ---------------------------------------- *)
module SymConst =
  struct
    type t = NonConst           (* Uid may take on multiple values at runtime *)
           | Const of int64     (* Uid will always evaluate to const i64 or i1 *)
           | UndefConst         (* Uid is not defined at the point *)

    let compare s t =
      match (s, t) with
      | (Const i, Const j) -> Int64.compare i j
      | (NonConst, NonConst) | (UndefConst, UndefConst) -> 0
      | (NonConst, _) | (_, UndefConst) -> 1
      | (UndefConst, _) | (_, NonConst) -> -1

    let to_string : t -> string = function
      | NonConst -> "NonConst"
      | Const i -> Printf.sprintf "Const (%LdL)" i
      | UndefConst -> "UndefConst"

    
  end

(* The analysis computes, at each program point, which UIDs in scope will evaluate 
   to integer constants *)
type fact = SymConst.t UidM.t



(* flow function across Ll instructions ------------------------------------- *)
(* - Uid of a binop or icmp with const arguments is constant-out
   - Uid of a binop or icmp with an UndefConst argument is UndefConst-out
   - Uid of a binop or icmp with an NonConst argument is NonConst-out
   - Uid of stores and void calls are UndefConst-out
   - Uid of all other instructions are NonConst-out
 *)
let insn_flow (u,i:uid * insn) (d:fact) : fact =
  let get_symConst : (SymConst.t option) -> SymConst.t = function
  | Some symConst -> symConst
  | None -> NonConst
  in
  let op_flow static_op : (Ll.operand * Ll.operand) -> fact = function
      | Id uid1, Id uid2 -> (
          let symConst1_opt, symConst2_opt = UidM.find_opt uid1 d, UidM.find_opt uid2 d in
          let symConst1, symConst2 = get_symConst symConst1_opt, get_symConst symConst2_opt in

          match (symConst1, symConst2) with
          | Const i, Const j -> UidM.add u (SymConst.Const (static_op i j)) d
          | NonConst, _ | _, NonConst -> UidM.add u SymConst.NonConst d 
          | UndefConst, _ | _, UndefConst -> UidM.add u SymConst.UndefConst d
        )
      | Id uid, Const j -> (
        let symConst_opt = UidM.find_opt uid d in
        let symConst = get_symConst symConst_opt in
        match symConst with
          | Const i -> UidM.add u (SymConst.Const (static_op i j)) d
          | NonConst -> UidM.add u SymConst.NonConst d 
          | UndefConst -> UidM.add u SymConst.UndefConst d
      )
      | Const i, Id uid -> (
        let symConst_opt = UidM.find_opt uid d in
        let symConst = get_symConst symConst_opt in
        match symConst with
          | Const j -> UidM.add u (SymConst.Const (static_op i j)) d
          | NonConst -> UidM.add u SymConst.NonConst d 
          | UndefConst -> UidM.add u SymConst.UndefConst d
      )
      | Const i, Const j -> UidM.add u (SymConst.Const (static_op i j)) d
      | _ -> UidM.add u SymConst.NonConst d
  in
  match i with
  | Binop (bop, ty, operand1, operand2) -> (
      let static_binop i j = 
        match bop with 
        | Add -> Int64.add i j
        | Sub -> Int64.sub i j
        | Mul -> Int64.mul i j
        | Shl -> Int64.shift_left i (Int64.to_int j)
        | Lshr -> Int64.shift_right_logical i (Int64.to_int j)
        | Ashr -> Int64.shift_right i (Int64.to_int j)
        | And -> Int64.logand i j
        | Or -> Int64.logor i j
        | Xor -> Int64.logxor i j
      in
      op_flow static_binop (operand1, operand2)
  )
  | Icmp (cnd, ty, operand1, operand2) -> (
    let static_icmp i j = 
      match cnd with 
      | Eq -> if Int64.equal i j then 1L else 0L
      | Ne -> if Int64.equal i j then 0L else 1L
      | Slt -> if Int64.compare i j = -1 then 1L else 0L
      | Sle -> if Int64.compare i j < 1 then 1L else 0L
      | Sgt -> if Int64.compare i j = 1 then 1L else 0L
      | Sge -> if Int64.compare i j > -1 then 1L else 0L
    in
    op_flow static_icmp (operand1, operand2)
  )
  | Store _ 
  | Call (Void, _, _) -> UidM.add u SymConst.UndefConst d 
  | _ -> UidM.add u SymConst.NonConst d 

(* The flow function across terminators is trivial: they never change const info *)
let terminator_flow (t:terminator) (d:fact) : fact = d

let join_facts (d1: fact) (d2: fact) : fact = 
  let f (key: uid) (s1: SymConst.t option) (s2: SymConst.t option) = 
    let f' k (v1:SymConst.t) (v2:SymConst.t) : SymConst.t option = 
      match (v1, v2) with 
      | Const i, Const j -> if i = j then Some (Const i) else Some UndefConst
      | NonConst, _ | _, NonConst -> Some NonConst
      | UndefConst, _ | _, UndefConst -> Some UndefConst
    in
    match (s1, s2) with
    | None, None            -> None 
    | None, (Some v)  
    | (Some v), None        -> Some v
    | (Some v1), (Some v2)  -> f' key v1 v2
  in
  UidM.merge f d1 d2 

(* module for instantiating the generic framework --------------------------- *)
module Fact =
  struct
    type t = fact
    let forwards = true

    let insn_flow = insn_flow
    let terminator_flow = terminator_flow
    
    let normalize : fact -> fact = 
      UidM.filter (fun _ v -> v != SymConst.UndefConst)

    let compare (d:fact) (e:fact) : int  = 
      UidM.compare SymConst.compare (normalize d) (normalize e)

    let to_string : fact -> string =
      UidM.to_string (fun _ v -> SymConst.to_string v)

    (* The constprop analysis should take the meet over predecessors to compute the
       flow into a node. You may find the UidM.merge function useful *)
    let combine (ds:fact list) : fact = 
      List.fold_left join_facts UidM.empty ds
  end

(* instantiate the general framework ---------------------------------------- *)
module Graph = Cfg.AsGraph (Fact)
module Solver = Solver.Make (Fact) (Graph)

(* expose a top-level analysis operation ------------------------------------ *)
let analyze (g:Cfg.t) : Graph.t =
  (* the analysis starts with every node set to bottom (the map of every uid 
     in the function to UndefConst *)
  let init l = UidM.empty in

  (* the flow into the entry node should indicate that any parameter to the
     function is not a constant *)
  let cp_in = List.fold_right 
    (fun (u,_) d -> UidM.add u SymConst.NonConst d)
    g.Cfg.args UidM.empty 
  in
  let fg = Graph.of_cfg init cp_in g in
  
  (* print_endline @@ Graph.to_string fg; *)
  Solver.solve fg


(* run constant propagation on a cfg given analysis results ----------------- *)
(* HINT: your cp_block implementation will probably rely on several helper 
   functions.                                                                 *)
let run (cg:Graph.t) (cfg:Cfg.t) : Cfg.t =
  let open SymConst in
  

  let cp_block (l:Ll.lbl) (cfg:Cfg.t) : Cfg.t =
    let b : Ll.block = Cfg.block cfg l in
    let cb : uid -> Fact.t = Graph.uid_out cg l in
    let extract_uid = function
        | Id uid -> Some uid 
        | _ -> None
    in
    let replace_opnd uid d opnd: Ll.operand = 
      let uid_opt = extract_uid opnd in
      match uid_opt with 
      | Some uid -> ( 
          match UidM.find_opt uid d with
          | Some (Const i) -> Ll.Const i
          | _ -> opnd 
      )
      | None -> opnd
    in
    let { insns = insns; term = term} = b in

    let replace_term (uid, term) = 
      let f = cb uid in
      let replace_opnd = replace_opnd uid f in
      let upd_term = match term with 
        | Ret (ty, operand_opt) -> (
          match operand_opt with
          | Some opnd -> Ret (ty, Some (replace_opnd opnd))
          | None -> Ret (ty, operand_opt)
        )
        | Cbr (operand, lbl1, lbl2) ->
            Cbr (replace_opnd operand, lbl1, lbl2)
        | t -> t
      in
      uid, upd_term
    in
    let replace_insn (uid, insn) = 
      let f = cb uid in
      let replace_opnd = replace_opnd uid f in
      let upd_insn = match insn with
      | Binop (bop, ty, operand1, operand2) ->
          Binop (bop, ty, replace_opnd operand1, replace_opnd operand2)
      | Icmp (cnd, ty, operand1, operand2)  -> 
          Icmp (cnd, ty, replace_opnd operand1, replace_opnd operand2)
      | Store (ty, operand1, operand2) ->
          Store (ty, replace_opnd operand1, replace_opnd operand2)
      | Load (ty, operand) ->
          Load (ty, replace_opnd operand)
      | Call (ty, operand, opnd_list) ->
          let repaced_args = List.map (fun (ty, opnd) -> ty, replace_opnd opnd) opnd_list in
          Call (ty, replace_opnd operand, repaced_args)
      | Bitcast (ty, operand, ty2) ->
          Bitcast (ty, replace_opnd operand, ty2)
      | Gep (ty, operand, opnd_list) ->
          let repaced_args = List.map replace_opnd opnd_list in
          Gep (ty, replace_opnd operand, repaced_args)
      | i -> i
      in
      uid, upd_insn
    in
    let new_insns = List.map replace_insn insns in
    let new_term = replace_term term in
    let new_block = {insns = new_insns; term = new_term} in
    let new_blocks = LblM.update (fun _ -> new_block) l cfg.blocks in
    { blocks = new_blocks
    ; preds = cfg.preds
    ; ret_ty = cfg.ret_ty
    ; args = cfg.args
    }  

  in

  LblS.fold cp_block (Cfg.nodes cfg) cfg
