defmodule Print do
  @moduledoc "Implements basic printing functions"

  import IO

  @doc "Prints the expression input and output with some padding"
  def print_expression(input, output, padding) do
    pad = String.pad_leading(" : ", padding)
    puts(input <> pad <> to_string(output))
  end
end

# STRINGS
#
# Elixir doesn't have a dedicated string type.
# Instead, strings are represented by using either a binary
# or a list type.
#
# BINARY STRINGS
#
# The most common way to use strings is to specify them with
# the familiar double-quotes syntax:
#
# iex(1)> "This is a string"
# "This is a string"

expr = "This is a string"
expr_str = ~s("This is a string")
Print.print_expression(expr_str, expr, 12)

# The result is printed as a string, but underneath it's a
# binary - nothing more than a ceonsecutive sequence of bytes.
#
# Elixir provides support for embedded string expressions. You
# can use #{} to place an Elixir expression in a string constant.
# The expression is immediately evaluated, and its string
# representation is placed at the corresponding location in
# the string:
#
# iex(4)> "Embedded expression: #{3 + 0.14}"
# "Embedded expression: 3.14"

expr = "Embedded expression: #{3 + 0.14}"
expr_str = ~s("Embedded expression: #{3 + 0.14}")
Print.print_expression(expr_str, expr, 0)
