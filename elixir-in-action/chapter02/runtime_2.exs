"
STARTING THE RUNTIME

There are multiple ways to start BEAM. IEX (interactive Elixir) is one of
them, but there are others.

  1. iex
  2. 'elixir <script.ex/exs>
  3. The Mix Tool

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

If you don't want the BEAM instance to terminate, you can provide the
'--no-halt' parameter:

  $ elixir --no-halt simple_script.exs
  Called MyModule.run
  (BEAM stays open...)

'--no-halt' is most often useful if your main code (outside a module) starts
concurrent tasks that perform all the work. In this situation, your main call
finishes as soon as the concurrent tasks are started, and BEAM is immediately
terminated, and no work is done. Providing the '--no-halt' option keeps the
entire system alive and running.

THE MIX TOOL

The mix tool is used to manage projects that are made up of multiple source
files. Mix is your best option when you need to build a production-ready
system.

To create a new mix project, you can call 'mix new project_name' from the
command line:

  $ mix new my_project

This creates a new folder named my_project containing a couple of subfolders
and files. You can change to the my_project folder and compile the entire
project.

  $ cd my_project
  $ mix compile
"
|> IO.puts()
