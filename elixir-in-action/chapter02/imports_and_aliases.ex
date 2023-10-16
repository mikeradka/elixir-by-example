# Imports and aliases
# Calling functions from another module can sometimes
# be cumbersome because you need to reference the
# module name. If your module often calls functions from
# another module, you can import that other module into
# your own. Importing a module allows you to call its
# public functions without prefixing them with the
# module name:

defmodule MyModule do
  import IO

  def my_function() do
    puts "Calling imported function"
  end
end

# > iex imports_and_aliases.ex
# Erlang/OTP 26 [erts-14.0.2] [source] [64-bit] [smp:16:16] [ds:16:16:10] [async-threads:1] [jit:ns] [dtrace]
#
# Interactive Elixir (1.15.7) - press Ctrl+C to exit (type h() ENTER for help)
# iex(1)> MyModule.my_function()
# Calling imported function
# :ok
