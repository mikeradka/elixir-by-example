defmodule Print do
  @moduledoc "Implements basic printing functions"

  import IO

  @doc "Prints the expression input and output with some padding"
  def print_expression(input, output, padding) do
    pad = String.pad_leading(" : ", padding)
    puts(input <> pad <> to_string(output))
  end
end

# IMMUTABILITY
# Elixir data can't be mutated. Every function returns the new,
# modified version into another variable or rebinds it to the
# same symbolic name.
#
# In any case, the result resides in another
# memory location. The modification of the input will result in
# some data copying, but generally most of the memory will be
# shared between the old and the new version.
#
# MODIFYING TUPLES
# A modified tuple is always a complete, shallow copy of the old
# version
# iex(1)> a = "a"
# "a"
# iex(2)> b = "b"
# "b"
# iex(3)> c = "c"
# "c"
# iex(4)> b2 = "b2"
# "b2"
# iex(5)> a_tuple = {a, b, c}
# {"a", "b", "c"}
# iex(6)> new_tuple = put_elem(a_tuple, 1, b2)
# {"a", "b2", "c"}
#
# The variable new_tuple contains a shallow copy of a_tuple,
# differing only in the second element.
# Both tuples reference variables a and c, and whatever is in
# those variables is shared (and not duplicated) between both
# tuples. new_tuple is a shallow copy of the original a_tuple.

a = "a"
b = "b"
c = "c"
b2 = "b2"

a_tuple = {a, b, c}
expr_str = "a_tuple = {a, b, c}"
expr = inspect(a_tuple)
Print.print_expression(expr_str, expr, 20)

new_tuple = put_elem(a_tuple, 1, b2)
expr_str = "new_tuple = put_elem(a_tuple, 1, b2)"
expr = inspect(new_tuple)
Print.print_expression(expr_str, expr, 1)

# If you rebind a_tuple, the variable references another memory
# location. The old location of a_tuple isn't accessible and is
# available for garbage collection. The same holds for the
# variable b references by the old version of the tuple.

a_tuple = put_elem(a_tuple, 1, b2)
expr_str = "a_tuple = put_elem(a_tuple, 1, b2)"
expr = inspect(a_tuple)
Print.print_expression(expr_str, expr, 5)

# Keep in mind that tuples are always copied, by the copying is
# shallow. Lists, however, have different properties.
#
# MODIFYING LISTS
# When you modify the nth element of a list, the new version will
# contain shallow copies of the first n-1 elements, followed by
# the modified element. After that, the tails are completely
# shared.
# This is why adding elements to the end of a list is expensive.
# To append a new element at the tail, you have to iterate and
# shallow copy the entire list.
