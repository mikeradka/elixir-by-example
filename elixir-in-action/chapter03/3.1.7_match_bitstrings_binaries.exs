"
MATCHING BITSTRINGS AND BINARIES

A bitstring is a chunk of bits, and a binary is a special case of a bit-string
that is always aligned to the byte size.

To match a binary, you use a syntax similar to creating one:

  iex(1)> binary = <<1, 2, 3>>
  <<1, 2, 3>>
  iex(2)> <<b1, b2, b3>> = binary   # A binary match
  <<1, 2, 3>>
  iex(3)> b1
  1
  iex(4)> b2
  2
  iex(5)> b3
  3
"
|> IO.puts()
