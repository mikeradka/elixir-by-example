# simple example of a module
# a module is a collection of functions
# to call a function of a module you use "ModuleName.function_name(args)"
# you can test this by running
# iex geometry.ex
# iex(1)> Geometry.rectangle_area(6, 7)
# 42

defmodule Geometry do   # starts a module definition
  def rectangle_area(a, b) do # starts a function definition
    a * b   # the function's expression
  end  # ends the function definition
end   # ends the module definition
