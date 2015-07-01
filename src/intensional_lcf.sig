signature INTENSIONAL_LCF =
sig
  include LCF

  type world
  val refine : world * tactic -> world
  val kreitz : world -> tactic
end
