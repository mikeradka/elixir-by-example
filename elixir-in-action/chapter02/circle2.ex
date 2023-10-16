# The important thing about the @pi constant is
# that it exists only during the compilation of
# the module, when the references to it are inlined.

# Also, an attribute can be 'registered', which means
# it will be stored in the generated binary and can be
# accessed at runtime. Elixir registers some module
# attributes by default. For example, the attributes
# @module-doc and @doc can be used to provide documentation
# for modules and functions

defmodule Circle do
  @moduledoc "Implements basic circle functions"
  @pi 3.14159

  @doc "Computes the area of a circle"
  def area(r), do: r*r*@pi

  @doc "Computes the circumference of a circle"
  def circumference(r), do: 2*r*@pi
end

# To try this, you need to generate a compiled file
# Do this by running 'elixirc circle2.ex'
# This will generate the file 'Elixir.Circle.beam'.

# > iex                (base)
# Erlang/OTP 26 [erts-14.0.2] [source] [64-bit] [smp:16:16] [ds:16:16:10] [async-threads:1] [jit:ns] [dtrace]
#
# Interactive Elixir (1.15.7) - press Ctrl+C to exit (type h() ENTER for help)
# iex(1)> Code.fetch_docs(Circle)
# {:docs_v1, 13, :elixir, "text/markdown",
#  %{"en" => "Implements basic circle functions"}, %{},
#  [
#    {{:function, :area, 1}, 16, ["area(r)"],
#     %{"en" => "Computes the area of a circle"}, %{}},
#    {{:function, :circumference, 1}, 19, ["circumference(r)"],
#     %{"en" => "Computes the circumference of a circle"}, %{}}
#  ]}
#
# More interesingly, you can use the 'h' help feature
# to see the module's documentation
#
#
# iex(2)> h Circle
#
#                                    Circle
#
# Implements basic circle functions
#
# iex(3)> h Circle.area
#
#                                 def area(r)
#
# Computes the area of a circle
#
# iex(4)> h Circle.circumference
#
#
# You can also use the 'ex_doc' tool (https://github.com/elixir-lang/ex_doc)
# to generate HTML documentation for your project. This is the way
# Elixir documentation is produced.
#
# The underlying point is that registered attributes can be used
# to attach meta information to a module, which can then be used by
# other Elixir (and Erlang) tools.
