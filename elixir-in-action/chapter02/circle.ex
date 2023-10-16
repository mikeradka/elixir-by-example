# The purpose of module attributes is twofold:
# they can be used as compile-time constants,
# and you can register any attribute, which can
# then be queried in runtime.
#
# The following module provides basic
# functions for working with circles:

defmodule Circle do
  @pi 3.14159 # defines a module attribute

  def area(r), do: r*r*@pi  # uses a module attribute
  def circumference(r), do: 2*r*@pi
end

# > iex circle.ex      (base)
# Erlang/OTP 26 [erts-14.0.2] [source] [64-bit] [smp:16:16] [ds:16:16:10] [async-threads:1] [jit:ns] [dtrace]
#
# Interactive Elixir (1.15.7) - press Ctrl+C to exit (type h() ENTER for help)
# iex(1)> Circle.area(1)
# 3.14159
# iex(2)> Circle.circumference(1)
# 6.28318

# The important thing about the @pi constant is
# that it exists only during the compilation of
# the module, when the references to it are inlined.

# Also, an attribute can be 'registered', which means
# it will be stored in the generated binary and can be
# accessed at runtime. Elixir registers some module
# attributes by default. For example, the attributes
# @module-doc and @doc can be used to provide documentation
# for modules and functions
