

def hello := "world"


structure Constraint where
  lhs : α
  rhs : α

structure EP (α : Type u) where
  handle : Nat
  predicate : String
  a : list α
  s : list α 
  c : String

structure MRS (α : Type u) where
  gt : Var
  index : Var
  r : list EP
  i : list Constraint
  c : list Constraint

