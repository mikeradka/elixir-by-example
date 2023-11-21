"
STARTING THE RUNTIME

There are multiple ways to start BEAM. IEX (interactive Elixir) is one of
them, but there are others.

INTERACTIVE SHELL

When you start the iex shell, the BEAM instance is started underneath, and
the Elixir shell takes takes control. The shell takes input, interprets it,
and prints the result.

It is important to be aware that the input is interpreted - that means it
won't be as performant as the compiled code. Usually this is fine, because
you use the shell only to experiment with the Elixir language. You should
not try to measure performance directly from iex.

Modules, on the other hand, are ALWAYS compiled. Even if you define a module
in the shell, it will be compiled and loaded in memory, so there is no
performance hit.

RUNNING SCRIPTS

The 'elixir' command can be used to run a single Elixir source file. Here
is the basic syntax:

  $ elixir my_source.ex

When you start this, the following actions take place:
  - The BEAM instance is started.
  - The file my_source.ex is compiled in memory.
  - The resulting modules are loaded to the VM.
  - No .beam file is generated on the disk.
  - Whatever code resides outside of a module is interpreted.
  - Once everything is finished, BEAM is stopped.

Check out 'simple_script.exs' for an example:

  defmodule MyModule do
    def run do
      IO.puts(\"Called MyModule.run\")
    end
  end

  MyModule.run    # Code outside of a module is executed immediately

You can run this script from the command line:

  $ elixir simple_script.exs

This first call does the in-memory compilation of the 'MyModule' module, and
then calls 'MyModule.run'. After the call to 'MyModule.run' finishes, the
BEAM instance is stopped.
"
|> IO.puts()
