signature INTENSIONAL_LCF =
sig
  include LCF

  type world

  datatype status =
      EVIDENT
    | UNKNOWN

  val describe : world -> {status : status, goal : goal}
  val refine : world * tactic -> world
end
