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
  def sum(a, b \\ 0) do    # a default value is defined for arg b
    a + b
  end
end

defmodule MyModule do
  def fun(a, b \\ 1, c, d \\ 2) do  # set defaults for multiple args
    a + b + c + d
  end
end

# iex(5)> MyModule.fun(1,1,1,1)
# 4
# iex(6)> MyModule.fun(1,1,1)
# 5
