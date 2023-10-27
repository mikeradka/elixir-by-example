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
Print.print_expression(expr_str, expr, 24)

new_tuple = put_elem(a_tuple, 1, b2)
expr_str = "new_tuple = put_elem(a_tuple, 1, b2)"
expr = inspect(new_tuple)
Print.print_expression(expr_str, expr, 7)

# If you rebind a_tuple, the variable references another memory
# location. The old location of a_tuple isn't accessible and is
# available for garbage collection. The same holds for the
# variable b references by the old version of the tuple.

a_tuple = put_elem(a_tuple, 1, b2)
expr_str = "a_tuple = put_elem(a_tuple, 1, b2)"
expr = inspect(a_tuple)
Print.print_expression(expr_str, expr, 9)

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
# In contrast, pushing an element to the top of a list doesn't
# copy anything, which makes it the least expensive operation.
# In this case, the new list's tail IS the previous list. This
# is often used in Elixir programs when iteratively building
# lists. In such cases, it's best to push consecutive elements
# to the top.
#
# iex(7)> a_list = [a, b, c, d, e]
# ["a", "b", "c", "d", "e"]
# iex(8)> new_list = List.insert_at(a_list, 2, c2) # inserting/appending to the tail is expensive
# ["a", "b", "c2", "c", "d", "e"]
# iex(9)> new_list = [c2 | a_list]
# ["c2", "a", "b", "c", "d", "e"]  # pushing to the head of a list is way more efficient
# iex(10)> hd(a_list)
# "a"
# iex(11)> tl(a_list)
# ["b", "c", "d", "e"]
# iex(12)> hd(new_list) # remember, a list's head is a single element
# "c2"
# iex(13)> tl(new_list)     # a list's tail is itself a list
# ["a", "b", "c", "d", "e"]

d = "d"
e = "e"
c2 = "c2"

a_list = [a, b, c, d, e]
expr_str = "a_list = [a, b, c, d, e]"
expr = inspect(a_list)
Print.print_expression(expr_str, expr, 19)

new_list = List.insert_at(a_list, 2, c2)
expr_str = "new_list = List.insert_at(a_list, 2, c2)"
expr = inspect(new_list)
Print.print_expression(expr_str, expr, 1)

new_list = [c2 | a_list]
expr_str = "new_list = [c2 | a_list]"
expr = inspect(new_list)
Print.print_expression(expr_str, expr, 19)

expr_str = "hd(new_list)"
expr = hd(new_list)
Print.print_expression(expr_str, expr, 31)

expr = tl(new_list)
expr_str = "tl(new_list)"
expr = inspect(expr)
Print.print_expression(expr_str, expr, 31)
