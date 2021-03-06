(** Alias Analysis *)

open Ll
open Datastructures

(* The lattice of abstract pointers ----------------------------------------- *)
module SymPtr =
  struct
    type t = MayAlias           (* uid names a pointer that may be aliased *)
           | Unique             (* uid is the unique name for a pointer *)
           | UndefAlias         (* uid is not in scope or not a pointer *)

    let compare : t -> t -> int = Pervasives.compare

    let to_string = function
      | MayAlias -> "MayAlias"
      | Unique -> "Unique"
      | UndefAlias -> "UndefAlias"

  end

(* The analysis computes, at each program point, which UIDs in scope are a unique name
   for a stack slot and which may have aliases *)
type fact = SymPtr.t UidM.t

(* flow function across Ll instructions ------------------------------------- *)
(* TASK: complete the flow function for alias analysis. 

   - After an alloca, the defined UID is the unique name for a stack slot
   - A pointer returned by a load, call, bitcast, or GEP may be aliased
   - A pointer passed as an argument to a call, bitcast, GEP, or store
     may be aliased
   - Other instructions do not define pointers

 *)
let insn_flow ((u,i):uid * insn) (d:fact) : fact =

  let res = match i with 
  (* After an alloca, the defined UID is the unique name for a stack slot *)
  | Alloca _ ->  UidM.add u SymPtr.Unique d

  | Bitcast (from_ty, opnd, to_ty) -> (
    match (from_ty, opnd, to_ty) with
    | (Ptr _, Id uid, ret_ty) -> 
        let ret_ptr = match ret_ty with Ptr _ -> true | _ -> false in 
        let res = UidM.update_or SymPtr.UndefAlias (fun x -> SymPtr.MayAlias) uid d in
        if ret_ptr 
        then UidM.add u SymPtr.MayAlias res
        else res
    | _ -> d
  )
  | Store (Ptr _, Id uid, _) -> 
      let res = UidM.update_or SymPtr.UndefAlias (fun _ -> SymPtr.MayAlias) uid d in
      res
  (* A pointer returned by a load, call, bitcast, or GEP may be aliased *)
  | Load (Ptr (Ptr _), _) -> UidM.add u SymPtr.MayAlias d
  | Call  (Ptr _, _, opnd_list) -> ( 
      let aux (f:fact) (ty, uid) = 
        match (ty, uid) with 
        | Ptr _, Id id -> UidM.update_or SymPtr.UndefAlias (fun _ -> SymPtr.MayAlias) id f
        | _   -> f
      in
      List.fold_left aux (UidM.add u SymPtr.MayAlias d) opnd_list
    )
  | Gep (Ptr _, opnd, _) -> (
        let res = match opnd with
          | Id uid -> UidM.update_or SymPtr.UndefAlias (fun _ -> SymPtr.MayAlias) uid d
          | _ -> d
        in
        UidM.add u SymPtr.MayAlias res
  )
  | _ -> d
  in
  res


(* The flow function across terminators is trivial: they never change alias info *)
let terminator_flow t (d:fact) : fact = d

let join_facts (d1: fact) (d2: fact) : fact = 
  let f (key: uid) (s1: SymPtr.t option) (s2: SymPtr.t option) = 
    let f' k (v1 : SymPtr.t) (v2 : SymPtr.t): SymPtr.t = 
      match (v1, v2) with 
      | MayAlias, Unique
      | Unique, MayAlias -> MayAlias
      | Unique, UndefAlias 
      | UndefAlias, Unique -> Unique
      | UndefAlias, MayAlias
      | MayAlias, UndefAlias -> MayAlias
      | n, _ -> n
    in
    match (s1, s2) with
    | None, None -> None
    | (Some v), None | None, (Some v) -> Some v
    | (Some v1), (Some v2) -> Some (f' key v1 v2)
  in
  UidM.merge f d1 d2 

(* module for instantiating the generic framework --------------------------- *)
module Fact =
  struct
    type t = fact
    let forwards = true

    let insn_flow = insn_flow
    let terminator_flow = terminator_flow
    
    (* UndefAlias is logically the same as not having a mapping in the fact. To
       compare dataflow facts, we first remove all of these *)
    let normalize : fact -> fact = 
      UidM.filter (fun _ v -> v != SymPtr.UndefAlias)

    let compare (d:fact) (e:fact) : int = 
      UidM.compare SymPtr.compare (normalize d) (normalize e)

    let to_string : fact -> string =
      UidM.to_string (fun _ v -> SymPtr.to_string v)

    (* TASK: complete the "combine" operation for alias analysis.

       The alias analysis should take the join over predecessors to compute the
       flow into a node. You may find the UidM.merge function useful.

       It may be useful to define a helper function that knows how to take the
       join of two SymPtr.t facts.
    *)
    let combine (ds:fact list) : fact =
      List.fold_left join_facts UidM.empty ds
  end

(* instantiate the general framework ---------------------------------------- *)
module Graph = Cfg.AsGraph (Fact)
module Solver = Solver.Make (Fact) (Graph)

(* expose a top-level analysis operation ------------------------------------ *)
let analyze (g:Cfg.t) : Graph.t =
  (* the analysis starts with every node set to bottom (the map of every uid 
     in the function to UndefAlias *)
  let init l = UidM.empty in

  (* the flow into the entry node should indicate that any pointer parameter 
     to the function may be aliased *)
  let alias_in = 
    List.fold_right 
      (fun (u,t) -> match t with
                    | Ptr _ -> UidM.add u SymPtr.MayAlias
                    | _ -> fun m -> m) 
      g.Cfg.args UidM.empty 
  in
  let fg = Graph.of_cfg init alias_in g in
  Solver.solve fg

