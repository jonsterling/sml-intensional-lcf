functor IntensionalLcf (Lcf : LCF) :
sig
  structure Zipper : ZIPPER
  include INTENSIONAL_LCF
    where type world = Zipper.location
  val kreitz : world -> tactic
end =
struct
  open Lcf

  structure Fan = Fan
    (type elem = Lcf.goal * tactic option)

  structure Zipper = FanZipper (Fan)
  type world = Zipper.location

  fun init goal = Zipper.init (Fan.into (Fan.NODE ((goal, NONE), [])))

  fun refine ((tree, path), tac) =
    let
      open Fan
      val NODE ((goal, _), _) = out tree
      val (subgoals, _) = tac goal
      val subtrees = List.map (fn gl => into (NODE ((gl, NONE), []))) subgoals
    in
      (into (NODE ((goal, SOME tac), subtrees)), path)
    end

  exception IncompleteProofTree

  local
    structure Tacticals = Tacticals (Lcf)
    open Tacticals Fan
    infix THENL

    fun go (NODE ((goal, NONE), _)) = raise IncompleteProofTree
      | go (NODE ((goal, SOME tac), subtrees)) =
        tac THENL List.map (go o out) subtrees
  in
    fun kreitz (tree, _) = go (out tree)
  end
end
