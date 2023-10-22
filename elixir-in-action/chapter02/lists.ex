# LISTS
# Lists in Erlang are used to manage dynamic, variable
# sized collections of data. The syntax deceptively
# resembles arrays from other languagese:
#
# iex(1)> prime_numbers = [2, 3, 5, 7]
# [2, 3, 5, 7]
prime_numbers = [2, 3, 5, 7]
expr_str = "prime_numbers = [2, 3, 5, 7]"
prime_numbers_insp = inspect(prime_numbers)
pad = String.pad_leading(" : ", 0)
IO.puts(expr_str <> pad <> to_string(prime_numbers_insp))

# Lists may look like arrays, but they work like singly linked
# lists. To do something with the list, you have to traverse it.
# Therefore, most of the operations on lists have an O(n)
# complexity, including the Kernel.length/1 funtion, which
# iterates through the entire list to calculate its length:
# iex(2)> length(prime_numbers)
# 4
expr_str = "length(prime_numbers)"
expr = length(prime_numbers)
pad = String.pad_leading(" : ", 10)
IO.puts(expr_str <> pad <> to_string(expr))

# List utility functions
# There are many operations you can do with lists. For a
# detailed reference, see the docs for the List module:
# https://hexdocs.pm/elixir/List.html and the Enum module:
# https://hexdocs.pm/elixir/Enum.html
