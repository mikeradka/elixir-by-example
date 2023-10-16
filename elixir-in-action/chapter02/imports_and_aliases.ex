# Imports and aliases
# Calling functions from another module can sometimes
# be cumbersome because you need to reference the
# module name. If your module often calls functions from
# another module, you can import that other module into
# your own. Importing a module allows you to call its
# public functions without prefixing them with the
# module name:

defmodule MyModule do
  import IO   # imports the IO module

  def my_function() do
    puts "Calling imported function"  # you can use puts instead of IO. puts
  end
end

# > iex imports_and_aliases.ex
# Erlang/OTP 26 [erts-14.0.2] [source] [64-bit] [smp:16:16] [ds:16:16:10] [async-threads:1] [jit:ns] [dtrace]
#
# Interactive Elixir (1.15.7) - press Ctrl+C to exit (type h() ENTER for help)
# iex(1)> MyModule.my_function()
# Calling imported function
# :ok

# Another construct, 'alias', makes it possible to reference
# a module under a different name:

defmodule AnotherModule do
  alias IO, as: MyIO  # creates an alias for IO

  def another_function do
    MyIO.puts("Calling imported function.") # calls a function using the alias
  end
end

# > iex imports_and_aliases.ex                 (base)
# Erlang/OTP 26 [erts-14.0.2] [source] [64-bit] [smp:16:16] [ds:16:16:10] [async-threads:1] [jit:ns] [dtrace]
#
# Interactive Elixir (1.15.7) - press Ctrl+C to exit (type h() ENTER for help)
# iex(1)> AnotherModule.another_function()
# Calling imported function.
# :ok

# Aliases can be useful if a module has a long name.
# Aliases can help you reduce some noise, especially if you
# call functions from a long-named module many times.
