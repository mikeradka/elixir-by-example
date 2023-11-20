# An example to illustrate how multiple modules in the same source file
# are compiled using elixirc

defmodule Geometry do
  def rectangle_area(a, b) do
    a * b
  end
end

defmodule Print do
  def print_hello() do
    IO.puts("Hello!")
  end
end
