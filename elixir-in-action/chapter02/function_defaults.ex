# Elixir allows you to specify defaults for
# arguments by using the \\ operator followed
# by the argument's default value

defmodule Calc do
  def sum(a, b \\ 0) do
    a + b
  end
end
