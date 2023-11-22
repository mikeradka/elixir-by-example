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

MATCHING BINARY STRINGS

In Elixir, strings are binaries, so you can use binary matches to extract
individual bits and bytes from a string:

  iex(1)> <<b1, b2, b3>> = \"ABC\"
  \"ABC\"
  iex(2)> b1
  65
  iex(3)> b2
  66
  iex(4)> b3
  67

The variables 'b1', 'b2', and 'b3' hold corresponding bytes from the string
you matched on (ABC). This is not very useful, especially if you are dealing
with Unicode strings. Extracting individual characters is better done using
functions from the 'String' module.

A more useful pattern is to match the beginning of the string:

iex(1)> command = \"ping www.example.com\"
\"ping www.example.com\"
iex(2)> \"ping \" <> url = command    # Matching the string
\"ping www.example.com\"
iex(3)> url
\"www.example.com\"

In the above example, you construct a string that holds a 'ping' command.
When you write '\"ping \" <> url = command', you state the expectation that
a command variable is a binary string starting with 'ping'. If it matches,
the rest of the string is bound to the variable 'url'.

If it does not match, you receive an error:

  iex(4)> \"sping \" <> url = command
  ** (MatchError) no match of right hand side value: \"ping www.example.com\"
"
|> IO.puts()
