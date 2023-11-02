defmodule Print do
  @moduledoc "Implements basic printing functions"

  import IO

  @doc "Prints the expression input and output with some padding"
  def print_expression(input, output, padding) do
    pad = String.pad_leading(" : ", padding)
    puts(input <> pad <> to_string(output))
  end
end

# FIRST-CLASS FUNCTIONS
# In Elixir, a function is a first-class citizen, which means
# it can be assigned to a variable. Here, assigning a function
# to a variable doesn't mean calling the function and storing
# its result to a variable. Instead, the function definition
# itself is assigned, and you can use the variable to call
# the function.
#
# As an example, to create a function, you can use the fn construct:
#
# # iex(1)> square = fn x ->
# ...(1)>  x * x
# ...(1)> end
# #Function<42.125776118/1 in :erl_eval.expr/6>
#
