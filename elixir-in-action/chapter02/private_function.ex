# A public function is defined using the def macro
# A private function is defined using the defp macro
# A public function is 'exported': it can be called by
# anyone else. A private function can only be used inside
# the module it's defined in.

defmodule TestPrivate do
  def double(a) do  # public function
    sum(a, a)       # calls the private function
  end

  defp sum(a, b) do # private function
    a + b
  end
end

# the function 'double' is exported and can be
# called from outside. Internally, it relies on
# the private function 'sum' to do its work.
#
# > iex private_function.ex
# Erlang/OTP 26 [erts-14.0.2] [source] [64-bit] [smp:16:16] [ds:16:16:10] [async-threads:1] [jit:ns] [dtrace]
#
# Interactive Elixir (1.15.7) - press Ctrl+C to exit (type h() ENTER for help)
# iex(1)> TestPrivate.double(3)
# 6
# iex(2)> TestPrivate.sum(3, 4)
# ** (UndefinedFunctionError) function TestPrivate.sum/2 is undefined or private
#     TestPrivate.sum(3, 4)
#     iex:2: (file)
#
#
# The 'sum' function cannot be invoked outside the module.
