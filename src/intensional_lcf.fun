functor IntensionalLcf (Lcf : LCF) : INTENSIONAL_LCF =
struct
  open Lcf

  structure RoseTree = RoseTree
    (type elem = Lcf.goal * tactic option)

  structure Zipper = Zipper (RoseTree)
  type world = Zipper.location

  fun refine ((tree, path), tac) =
    let
      open RoseTree
      val NODE ((goal, _), _) = out tree
      val (subgoals, _) = tac goal
      val subtrees = List.map (fn gl => into (NODE ((gl, NONE), []))) subgoals
    in
      (into (NODE ((goal, SOME tac), subtrees)), path)
    end
end

