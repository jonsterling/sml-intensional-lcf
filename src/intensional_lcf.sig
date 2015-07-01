signature INTENSIONAL_LCF =
sig
  include LCF

  type world

  datatype status =
      EVIDENT
    | UNKNOWN

  val refine : world * tactic -> world
end
