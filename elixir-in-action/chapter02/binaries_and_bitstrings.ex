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

# You can specify the size of each value and thus tell the
# compiler how many bits to use for that particular value:
#
# iex(1)> <<257::16>>
# <<1, 1>>
#
# This expression places the number 257 into 16 bits of
# consecutive memory space. The output indicates that you
# use 2 bytes, both having a value of 1. This is due to the
# binary representation of 257, which in 16-bit form is
# written 00000001 00000001.
#
# The size specifier is in bits and need not be a multiplier
# of 8. The following snippet creates a binary by combining
# two 4-bit values:
#
# iex(5)> <<1::4, 15::4>>
# <<31>>
#
# The resulting value has 1 byte and is represented in the
# output using the normalized form 31 (0001 1111)
#
# If the total size of all values isn't a multiple of 8, the
# binary is called a bitstring - a sequence of bits
#
# iex(9)> <<1::1, 0::1, 1::1>>
# <<5::size(3)>>
#
# You can also concatenate two binaries or bitstrings with
# the operator <>:
#
# iex(10)> <<1, 2>> <> <<3, 4>>
# <<1, 2, 3, 4>>
#
# There's much more that can be done with binaries, but
# the most important thing is that they're consecutive
# sequences of bytes. Binaries play an important role in
# support for strings.
