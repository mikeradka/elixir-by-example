defmodule MyModule do
  def run do
    IO.puts("Called MyModule.run")
  end
end

MyModule.run    # Code outside of a module is executed immediately
