functor EphemeralLcf (Lcf : LCF) : EPHEMERAL_LCF =
struct
  open Lcf
  structure IntensionalLcf = IntensionalLcf (Lcf)
  structure Z = IntensionalLcf.Zipper
  exception InvalidMovement = Z.InvalidMovement

  type session = IntensionalLcf.world ref

  fun update f session =
    session := f (! session)

  val new = ref o IntensionalLcf.init

  val left = update Z.left
  val right = update Z.right
  val up = update Z.up
  val down = update Z.down

  fun refine (session, tac) =
    session := (IntensionalLcf.refine (! session, tac))
end
