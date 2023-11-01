defmodule Print do
  @moduledoc "Implements basic printing functions"

  import IO

  @doc "Prints the expression input and output with some padding"
  def print_expression(input, output, padding) do
    pad = String.pad_leading(" : ", padding)
    puts(input <> pad <> to_string(output))
  end
end

# BINARIES AND BITSTRINGS
#
# A binary is a chunk of bytes. You can create binaries by
# enclosing the byte sequence between << and >> operators.
# The following snipped creates a 3-byte binary:
#
# iex(1)> <<1, 2, 3>>
# <<1, 2, 3>>

expr = <<1, 2, 3>>
expr_str = "<<1, 2, 3>>"
expr = inspect(expr)
Print.print_expression(expr_str, expr, 0)

# Each number represents the value of the corresponding byte.
# If you provide a byte value bigger than 255, it's truncated
# to the byte size:
#
# iex(2)> <<256>>
# <<0>>
# iex(3)> <<257>>
# <<1>>
# iex(4)> <<512>>
# <<0>>

expr = <<255>>
expr_str = "<<255>>"
expr = inspect(expr)
Print.print_expression(expr_str, expr, 7)

expr = <<256>>
expr_str = "<<256>>"
expr = inspect(expr)
Print.print_expression(expr_str, expr, 7)

expr = <<257>>
expr_str = "<<257>>"
expr = inspect(expr)
Print.print_expression(expr_str, expr, 7)

expr = <<512>>
expr_str = "<<512>>"
expr = inspect(expr)
Print.print_expression(expr_str, expr, 7)
