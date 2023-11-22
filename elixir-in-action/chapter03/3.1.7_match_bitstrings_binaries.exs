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

This example matches on a 3-byte binary and extracts individual bytes
to separate variables.

The next example takes the binary apart by taking its first byte into one
variable and the rest of the binary into another:

  iex(2)> <<b1, rest :: binary>> = binary
  <<1, 2, 3>>
  iex(3)> b1
  1
  iex(4)> rest
  <<2, 3>>

'rest::binary' states that you expect an arbitrary-sized binary. You can
even extract separate bits or groups of bits. The next example splits a
single byte into two 4-bit values:

  iex(8)> <<a :: 4, b :: 4>> = <<155>>
  <<155>>
  iex(9)> b
  11
  iex(10)> a
  9

Pattern 'a::4' states that you expect a four-bit value. In the example, you
put the first four bits into the variable 'a' and the other four bits into
variable 'b'. Because the number 155 is in binary represented as 10011011,
you get values of 9 (1001) binary, and 11 (1011 binary).

Matching bitstrings and binaries is very useful when you're trying to parse
packed binary content that comes from a file, an external device, or a
network. In such situations, you can use binary matching to extract separate
bits and bytes elegantly.
"
|> IO.puts()
