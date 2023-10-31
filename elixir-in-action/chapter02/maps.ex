defmodule Print do
  @moduledoc "Implements basic printing functions"

  import IO

  @doc "Prints the expression input and output with some padding"
  def print_expression(input, output, padding) do
    pad = String.pad_leading(" : ", padding)
    puts(input <> pad <> to_string(output))
  end
end

# MAPS
# A map is a key/value store, where keys and values can be any
# term. Maps have dual usage in Elixir.
# 1. They're used to power dynamically sized key/value structures
# 2. They're used to manage simple records - a couple of well-defined named fields bundled together.
#
# DYNAMICALLY SIZED MAPS
# An empty map can be created with the %{} construct:
#
# iex(1)> empty_map = %{}
# %{}

empty_map = %{}
expr_str = "empty_map = %{}"
expr = inspect(empty_map)
Print.print_expression(expr_str, expr, 31)

# A map with some values can be created this way:
#
# iex(1)> squares = %{1 => 1, 2 => 4, 3 => 9}
# %{1 => 1, 2 => 4, 3 => 9}

squares = %{1 => 1, 2 => 4, 3 => 9}
expr_str = "squares = %{1 => 1, 2 => 4, 3 => 9}"
expr = inspect(squares)
Print.print_expression(expr_str, expr, 11)

# You can also prepopulate a map with the Map.new/1 function.
# The function takes an enumerable where each element is a
# tuple of size two (a pair):
# iex(1)> squares = Map.new([{1, 1}, {2, 4}, {3, 9}])
# %{1 => 1, 2 => 4, 3 => 9}

squares = Map.new([{1, 1}, {2, 4}, {3, 9}])
expr_str = "squares = Map.new([{1, 1}, {2, 4}, {3, 9}])"
expr = inspect(squares)
Print.print_expression(expr_str, expr, 0)

# To fetch a value at the given key, you can use the following:
#
# iex(2)> squares[2]
# 4
# iex(3)> squares[4]
# nil

expr = squares[2]
expr_str = "squares[2]"
Print.print_expression(expr_str, expr, 36)

expr = squares[4]
expr_str = "squares[4]"
expr = inspect(expr)
Print.print_expression(expr_str, expr, 36)

# In the second expression, squares[4], you get a nil because
# no value is associated with the given key.
#
# A similar result can be obtained with Map.get/3. On the surface,
# this function behaves like []. But Map.get/3 allows you to
# specify the default value, which is returned if the key isn't
# found. If this default isn't provided, nil will be returned:
#
# iex(4)> Map.get(squares, 2)
# 4
# iex(5)> Map.get(squares, 4)
# nil
# iex(6)> Map.get(squares, 4, :not_found)
# :not_found

expr = Map.get(squares, 2)
expr_str = "Map.get(squares, 2)"
Print.print_expression(expr_str, expr, 27)

expr = Map.get(squares, 4)
expr_str = "Map.get(squares, 4)"
expr = inspect(expr)
Print.print_expression(expr_str, expr, 27)

expr = Map.get(squares, 4, :not_found)
expr_str = "Map.get(squares, 4, :not_found)"
Print.print_expression(expr_str, expr, 15)

# Notice that in the last expression you don't precisely
# know whether there's no value under the given key, or
# if the value is :not_found. If you want to precisely
# distinguish between these cases, you can use Map.fetch/2:
#
# iex(2)> Map.fetch(squares, 2)
# {:ok, 4}
# iex(3)> Map.fetch(squares, 4)
# :error

expr = Map.fetch(squares, 2)
expr_str = "Map.fetch(squares, 2)"
expr = inspect(expr)
Print.print_expression(expr_str, expr, 25)

expr = Map.fetch(squares, 4)
expr_str = "Map.fetch(squares, 4)"
expr = inspect(expr)
Print.print_expression(expr_str, expr, 25)

# As you can see, in the successful case you'll get a value
# in the shape of {:ok, value}. This format makes it possible
# to precisely detect the case when the key isn't present.
#
# Sometimes you want to proceed only if the key is in the
# map, and raise an exception otherwise. This can be done
# with the Map.fetch!/2 function:
#
# iex(4)> Map.fetch!(squares, 2)
# 4
# iex(5)> Map.fetch!(squares, 4)
# ** (KeyError) key 4 not found in: %{1 => 1, 2 => 4, 3 => 9}
#     (stdlib 5.0.2) :maps.get(4, %{1 => 1, 2 => 4, 3 => 9})
#     iex:5: (file)
#
# To store a new element to the map, you can use Map.put/3:
#
# iex(7)> squares = Map.put(squares, 4, 16)
# %{1 => 1, 2 => 4, 3 => 9, 4 => 16}
# iex(8)> squares[4]
# 16
#
# There are a bunch of other helpful functions in the Map
# module, such as Map.update/4 or Map.delete/2. You can look
# into the official documentation at https://hexdocs.pm/elixir/Map.html
# In addition, a map is enumerable, which means that all the
# functions from the Enum module work with maps.
#
# STRUCTURED DATA
#
#
