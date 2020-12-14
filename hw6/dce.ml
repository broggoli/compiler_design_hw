(** Dead Code Elimination  *)
open Ll
open Datastructures


(* expose a top-level analysis operation ------------------------------------ *)
(* TASK: This function should optimize a block by removing dead instructions
   - lb: a function from uids to the live-OUT set at the 
     corresponding program point
   - ab: the alias map flowing IN to each program point in the block
   - b: the current ll block

   Note: 
     Call instructions are never considered to be dead (they might produce
     side effects)

     Store instructions are not dead if the pointer written to is live _or_
     the pointer written to may be aliased.

     Other instructions are dead if the value they compute is not live.

   Hint: Consider using List.filter
 *)
let dce_block (lb:uid -> Liveness.Fact.t) 
              (ab:uid -> Alias.fact)
              (b:Ll.block) : Ll.block =
  
  let { insns = uid_insn_list; term = uid_terminator } = b in
  let filter_f (uid, insn) = 
    match insn with 
    | Binop _
    | Alloca _
    | Load _
    | Icmp _
    | Bitcast _
    | Gep _ -> (
      let live_out = lb uid in
      match UidS.find_opt uid live_out with
      | Some x -> true
      | _ -> false
    )
    | Store (_, _, Id dest) -> (
        let alias_in = ab uid in
        let dest_aliased = match UidM.find_opt dest alias_in with
          | Some x -> Alias.SymPtr.MayAlias = x
          | _ -> false
        in
        let live_out_info = lb uid in
        let live_out = match UidS.find_opt dest live_out_info with
          | Some x -> true
          | _ -> false
        in
        dest_aliased || live_out
      )
    | _ -> true 
  in 
  let elim = List.filter filter_f uid_insn_list in
  { insns = elim; term = uid_terminator }

let run (lg:Liveness.Graph.t) (ag:Alias.Graph.t) (cfg:Cfg.t) : Cfg.t =

  LblS.fold (fun l cfg ->
    let b = Cfg.block cfg l in

    (* compute liveness at each program point for the block *)
    let lb = Liveness.Graph.uid_out lg l in

    (* compute aliases at each program point for the block *)
    let ab = Alias.Graph.uid_in ag l in 

    (* compute optimized block *)
    let b' = dce_block lb ab b in
    Cfg.add_block l b' cfg
  ) (Cfg.nodes cfg) cfg

