signature EPHEMERAL_LCF =
sig
  include LCF

  exception InvalidMovement

  type session
  val new : goal -> session

  val left : session -> unit
  val right : session -> unit
  val up : session -> unit
  val down : session -> unit

  val refine : session * tactic -> unit
  val compile : session -> tactic
end
