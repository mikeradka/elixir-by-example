# same name functions, different arities, default params
# a lower-arity function is implemented in terms of
# a higher-arity one. This pattern is pretty infrequent, however.

defmodule Calculator do
  def sum(a) do # Calculator.sum/1 deletgates to Calculator.sum/2
    sum(a, 0)
  end

  def sum(a, b) do  # Calculator.sum/2 contains the implementation
    a + b
  end
end
