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

Matching lists is more often done by relying on their recursive nature. Remember,
each non-empty list is a recurisve structure that can be expressed in the form
of [head | tail]. You can use pattern matching to put each of these two
elements into separate variables:

  iex(1)> [head | tail] = [1, 2, 3]
  [1, 2, 3]
  iex(2)> head
  1
  iex(3)> tail
  [2, 3]

If you need only one element of the [head, tail]  pair, you can use the anonymous
variable. Here is an inefficient way of calculating the smallest element in
the list:

  iex(4)> [min | _] = Enum.sort([3,2,1])
  [1, 2, 3]
  iex(5)> min
  1

First you sort the list, and then with the pattern [min | _] you take only the
head of the sorted list. Note that this could also be dnoe with the hd function:

  iex(7)> hd(Enum.sort([3,2,1]))
  1

The latter solution is more elegant, but the former solution '[min | _]' is more
useful when pattern-matching function arguments. This will be demonstrated in
section 3.2.
"
|> IO.puts()
