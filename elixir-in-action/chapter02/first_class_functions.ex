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
# The variable square now contains a function that computes
# the square of a number. Because the function isn't bound to
# a global name, it's also called an anonymous function or
# a lambda.
#
# Notice that the list of arguments isn't enclose in parenthesis.
# You CAN technically use parenthesis here, but the prevalent
# convention enforced by the Elixir formatter is to omit the
# parenthesis. This may seem inconsistent, but there is a good
# reason for this which will be discussed in Chapter 3.
#
# You can call this function by specifying the variable name
# followed by a dot (.) and the arguments:
#
# iex(2)> square.(5)
# 25

square = fn x ->
  x * x
end

expr_str = "
square = fn x ->
  x * x           : square.(5) = " <> to_string(square.(5)) <> "
end
"
IO.puts(expr_str)
