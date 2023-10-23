defmodule Print do
  @moduledoc "Implements basic printing functions"

  import IO

  @doc "Prints the expression input and output with some padding"
  def print_expression(input, output, padding) do
    pad = String.pad_leading(" : ", padding)
    puts(input <> pad <> to_string(output))
  end
end

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
Print.print_expression(expr_str, prime_numbers_insp, 28)

# Lists may look like arrays, but they work like singly linked
# lists. To do something with the list, you have to traverse it.
# Therefore, most of the operations on lists have an O(n)
# complexity, including the Kernel.length/1 funtion, which
# iterates through the entire list to calculate its length:
# iex(2)> length(prime_numbers)
# 4
expr_str = "length(prime_numbers)"
expr = length(prime_numbers)
Print.print_expression(expr_str, expr, 35)

# List utility functions
# There are many operations you can do with lists. For a
# detailed reference, see the docs for the List module:
# https://hexdocs.pm/elixir/List.html and the Enum module:
# https://hexdocs.pm/elixir/Enum.html
#
# To get an element of a list, you can use the Enum.at/2
# function:
#
# iex(3)> Enum.at(prime_numbers, 3)
# 7
expr_str = "Enum.at(prime_numbers, 3)"
expr = Enum.at(prime_numbers, 3)
Print.print_expression(expr_str, expr, 31)

# Enum.at is another O(n) operation: it iterates from the
# beginning of the list to the desired element. Lists are
# never a good fit when direct access is called for. For
# direct access, tuples, maps, or a higher-level data
# structure is appropriate.
#
# You can check whether a list contains a particular element
# with the help of the in operator:
#
# iex(4)> 5 in prime_numbers
# true
# iex(5)> 4 in prime_numbers
# false
expr = 5 in prime_numbers
expr_str = "5 in prime_numbers"
Print.print_expression(expr_str, expr, 38)

expr = 4 in prime_numbers
expr_str = "4 in prime_numbers"
Print.print_expression(expr_str, expr, 38)

# To manipulate lists, you can use functions from the List
# module. For example, List.replace_at/3 modifies the
# element at a certain position:
#
# iex(6)> List.replace_at(prime_numbers, 0, 11)
# [11, 3, 5, 7]
#
# As was the case with tuples, the modifier doesn't mutate the
# variable, but returns the modified version of it, which you
# need to store to another variable:
#
# iex(7)> new_primes = List.replace_at(prime_numbers, 0, 11)
# [11, 3, 5, 7]
#
# Or you can rebind to the same one:
#
# iex(8)> prime_numbers = List.replace_at(prime_numbers, 0, 11)
# [11, 3, 5, 7]
prime_numbers = List.replace_at(prime_numbers, 0, 11)
expr = inspect(prime_numbers)
expr_str = "prime_numbers = List.replace_at(prime_numbers, 0, 11)"
Print.print_expression(expr_str, expr, 0)

# You can insert a new element at the specified position with the
# List.insert_at function:
#
# iex(9)> List.insert_at(prime_numbers, 3, 13)
# [11, 3, 5, 13, 7]
#
# To append to the end, you can use a negative value for the insert
# position:
#
# iex(10)> List.insert_at(prime_numbers, -1, 13)
# [11, 3, 5, 7, 13]
#
# The value of -1 indicates that the element should be appended to
# the end of the list.
inserted = List.insert_at(prime_numbers, 3, 13)
inserted_str = "List.insert_at(prime_numbers, 3, 13)"
expr = inspect(inserted)
Print.print_expression(inserted_str, expr, 20)

appended = List.insert_at(prime_numbers, -1, 13)
appended_str = "List.insert_at(prime_numbers, -1, 13)"
expr = inspect(appended)
Print.print_expression(appended_str, expr, 19)

# List most list operations, modifying an arbitrary element has a
# complexity of 0(n). In particuilar, appending to the end is expensive
# because it always takes n steps, n being the length of the list. In
# addition, the dedicated operator ++ is available. It concatenates
# two lists:
#
# iex(12)> [1, 2, 3] ++ [4, 5]
# [1, 2, 3, 4, 5]
concatenated = [1, 2, 3] ++ [4, 5]
expr = inspect(concatenated)
expr_str = "[1, 2, 3] ++ [4, 5]"
Print.print_expression(expr_str, expr, 37)

# Because the complexity is 0(n), n being the length of the left list
# (the one being appended to). In general, you should avoid adding
# elements to the end of a list. Lists are most efficient when new
# elements are pushed to the top, or popped from it. To understand
# why, let's look at the recursive nature of lists.
#
# RECURSIVE LIST DEFINITION
#
# Think of lists as recursive structures. A list can be represented
# by a pair (head, tail), where head is the first element of the list
# and tail 'points' to the (head, tail) pair of the remaining
# elements. In Elixir, there's a special syntax to support recursive
# list definition:
#
# a_list = [head | tail]
#
# head can be any type of data, whereas tail is itself a list. If tail
# is an empty list, it indicates the end of the entire list.
#
# iex(1)> [1 | []]
# [1]
# iex(2)> [1 | [2 | []]]
# [1, 2]
# iex(3)> [1 | [2]]
# [1, 2]
# iex(4)> [1 | [2, 3, 4]]
# [1, 2, 3, 4]
a_list = [1 | []]
expr_str = "a_list = [1 | []]"
expr = inspect(a_list)
Print.print_expression(expr_str, expr, 39)

a_list = [1 | [2 | []]]
expr_str = "a_list = [1 | [2 | []]]"
expr = inspect(a_list)
Print.print_expression(expr_str, expr, 33)

a_list = [1 | [2]]
expr_str = "a_list = [1 | [2]]"
expr = inspect(a_list)
Print.print_expression(expr_str, expr, 38)

a_list = [1 | [2, 3, 4]]
expr_str = "a_list = [1 | [2, 3, 4]]"
expr = inspect(a_list)
Print.print_expression(expr_str, expr, 32)
#
# This illustrates that a list is a pair with two values: a head and a
# tail, the tail being itself a list.
# The following is a snipped of a canonical recursive definition
# of a list:
# iex(12)> [1 | [2 | [ 3 | [4 | []]]]]
# [1, 2, 3, 4]

canonical_list = [1 | [2 | [ 3 | [4 | []]]]]
expr_str = "canonical_list = [1 | [2 | [ 3 | [4 | []]]]]"
expr = inspect(canonical_list)
Print.print_expression(expr_str, expr, 12)

# Nobody writes constructs like this in practice, but it is important
# to understand that lists are recursive structures of head/tail pairs.
#
# To get the head of the list, you can use the hd function
# To get the tail of the list, you can use the tl function
# iex(1)> hd([1, 2, 3, 4])
# 1
# iex(2)> tl([1, 2, 3, 4])
# [2, 3, 4]

head = hd(a_list)
expr_str = "hd(a_list)"
Print.print_expression(expr_str, head, 46)

tail = tl(a_list)
expr = inspect(tail)
expr_str = "tl(a_list)"
Print.print_expression(expr_str, expr, 46)

# Both the hd and tl operations are 0(1), because they amount to
# reading one or the other value from the (head, tail) pair.
