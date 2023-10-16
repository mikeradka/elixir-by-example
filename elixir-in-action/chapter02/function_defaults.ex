# Elixir allows you to specify defaults for
# arguments by using the \\ operator followed
# by the argument's default value
#
# > iex function_defaults.ex
#
# Erlang/OTP 26 [erts-14.0.2] [source] [64-bit] [smp:16:16] [ds:16:16:10] [async-threads:1] [jit:ns] [dtrace]
#
# Interactive Elixir (1.15.6) - press Ctrl+C to exit (type h() ENTER for help)
# iex(1)> Calc.sum(5)
# 5
# iex(2)> Calc.sum(5,3)
# 8

defmodule Calc do
  def sum(a, b \\ 0) do
    a + b
  end
end
