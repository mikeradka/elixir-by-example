defmodule Print do
  @moduledoc "Implements basic printing functions"

  import IO

  @doc "Prints the expression input and output with some padding"
  def print_expression(input, delim, output) do
    puts(input <> delim <> to_string(output))
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
pad = String.pad_leading(" : ", 0)
Print.print_expression(expr_str, pad, prime_numbers_insp)

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
Print.print_expression(expr_str, pad, expr)

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
pad = String.pad_leading(" : ", 6)
Print.print_expression(expr_str, pad, expr)

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
pad = String.pad_leading(" : ", 13)
Print.print_expression(expr_str, pad, expr)

expr = 4 in prime_numbers
expr_str = "4 in prime_numbers"
pad = String.pad_leading(" : ", 13)
Print.print_expression(expr_str, pad, expr)

# To manipulate lists, you can use functions from the List
# module. For example, List.replace_at/3 modifies the
# element at a certain position:
