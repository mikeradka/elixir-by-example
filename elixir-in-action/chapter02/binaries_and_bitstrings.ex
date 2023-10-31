# BINARIES AND BITSTRINGS
#
# A binary is a chunk of bytes. You can create binaries by
# enclosing the byte sequence between << and >> operators.
# The following snipped creates a 3-byte binary:
#
# iex(1)> <<1, 2, 3>>
# <<1, 2, 3>>
#
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
