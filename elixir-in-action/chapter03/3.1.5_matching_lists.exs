"
MATCHING LISTS

List matching works similarly to tuples.
This example decomposes a three-element list:

  iex(1)> [first, second, third] = [1, 2, 3]
  [1, 2, 3]
  iex(2)> first
  1
  iex(3)> second
  2
  iex(4)> third
  3

The previously mentioned pattern techniques also work:

  iex(1)> [1, second, third] = [1, 2, 3]    # The first element must be 1
  iex(2)> [first, first, first] = [1, 1, 1] # All elements must have the same value
  iex(3)> [first, second, _] = [1, 2, 3]    # You don't care about the third element, but it has to be there
  iex(4)> [^first, second, _] = [1, 2, 3]   # The first element must have the same value as the variable 'first'
"
|> IO.puts()
