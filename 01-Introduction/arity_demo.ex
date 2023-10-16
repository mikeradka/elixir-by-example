# this module demonstrates arity
# arity is the number of arguments a function recieves
# In elixir, functions are uniquely identified by their
# containing module, their name, and their arity
# Two functions can have the same name, but have a
# different arity, making them two different functions

defmodule Rectangle do
  def area(a), do: area(a, a)

  def area(a, b), do: a * b # same name, but different function
end
