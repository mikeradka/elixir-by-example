# Type specifications (typespecs) are another important
# feature based on attributes. This feature allows you
# to provide type information for your functions, which
# can later be analyzed with a static analysis tool
# called dialyzer (http://erlang.org/doc/man/dialyzer.html)
#
# Extend the Circle module to include typespecs:

defmodule Circle do
  @moduledoc "Implements basic circle functions"
  @pi 3.14159

  @doc "Computes the area of a circle"
  @spec area(number) :: number  # Type specification for area/1
  def area(r), do: r * r * @pi

  @doc "Computes the circumference of a circle"
  @spec circumference(number) :: number # Type specification for circumference/1
  def circumference(r), do: 2 * r * @pi
end

# Here, the @spec attribute indicates that both functions
# accept and return a number.
#
# Typespecs provide a way of compensating for the lack of
# static type system. This can be useful in conjunction
# with the dializer tool to perform static analysis of
# your programs.
#
# Typespecs allow you to better document your functions.
#
# In this example:
#
# @spec insert_at(list(), integer(), any()) :: list()
#
# the insert_at function accepts a list, an integer,
# and an argument of any type. It outputs a list.
#
#
# You should seriously consider using typespecs for
# complex systems. You can find a detailed reference
# here: https://hexdocs.pm/elixir/typespecs.html
