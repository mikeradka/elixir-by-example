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
#
# A map with some values can be created this way:
#
# iex(1)> squares = %{1 => 1, 2 => 4, 3 => 9}
# %{1 => 1, 2 => 4, 3 => 9}
#
# You can also prepopulate a map with the Map.new/1 function.
# The function takes an enumerable where each element is a
# tuple of size two (a pair):
# iex(1)> squares = Map.new([{1, 1}, {2, 4}, {3, 9}])
# %{1 => 1, 2 => 4, 3 => 9}
#
# To fetch a value at the given key, you can use the following:
#
# iex(2)> squares[2]
# 4
# iex(3)> squares[4]
# nil
#
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
