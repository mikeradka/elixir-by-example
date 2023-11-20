"
UNDERSTANDING THE RUNTIME

The Elixir runtime is a BEAM instance. Once the compiling is done and the
system is started, Erlang takes control. It is important to be familiar
with some details of the virtual machine so you can understand how your
systems work.
"
|> IO.puts()

"
MODULES AND FUNCTIONS IN THE RUNTIME

Regardless of how you start the runtime, as OS process for the BEAM instance
is started, and everything runs inside that process. Thos holds true even
when you're using the iex shell. If you need to find the BEAM process, you
can look it up under the name 'beam'.

Once the system is started, you run some code, usually by calling functions
from modules. The runtime accesses the code by the VM keeping track of all
modules that are loaded in memory. When you call a function from a module,
BEAM first checks whether the module is loaded. If it is, the code of the
corresponding function is executed. Otherwise the VM tries to find the
compiled module file - the bytecode - on the disk, loads it, and executes
the function.

A compiled module file has the extension '.beam'. The name of the file
corresponds to the module name.

When you compile the source containing the 'Geometry' module, the file
generated on the disk is named 'Geometry.beam', regardless of the name of
the input source file. If multiple modules are defined in a single source
file, the compiler will produce multiple .beam files that correspond to
those modules (try running elixirc on some_modules.ex)

In the runtime, module names are aliases - and aliases are atoms. The first
time you call the function of a module, BEAM tries to find the corresponding
file on disk. The VM looks for the file in the current folder, and then in
the code paths.

When you start BEAM with Elixir tools, such as iex, some code paths are
predefined for you. You can add other code paths by using the -pa switch:

  $ iex -pa my/code/path -pa another/code/path

You can check which code paths are used at runtime by calling the Erlang
function :code.get_path

  iex(1)> :code.get_path
  [~c\"/usr/local/Cellar/elixir/1.15.7/bin/../lib/elixir/ebin\",
   ~c\"/usr/local/Cellar/elixir/1.15.7/bin/../lib/mix/ebin\",
   ~c\"/usr/local/Cellar/elixir/1.15.7/bin/../lib/logger/ebin\",
  ...

If the module is already loaded, the runtime does not search for it on the
disk. This can be used when starting the shell, to auto-load modules:

  $ iex my_source.ex

This command compiles the source file and immediately loads all generated
modules. In this case, .beam files are not saved to disk. The iex tool
performs an in-memory compilation.

You can of course also define modules in the shell:

  iex(1)> defmodule MyModule do     # In-memory bytecode generation and loading of a module
    ...(1)>   def my_fun, do: :ok   # In-memory bytecode generation and loading of a module
    ...(1)> end
    iex(2)> MyModule.my_fun
    :ok

In this case, the bytecode also is not saved to the disk since it is loaded
in memory.

PURE ERLANG MODULES

Remember, to call a pure, non-Elixir Erlang module, you do so like this:

  :code.get_path    # Calls the get_path function of the pure Erlang :code module

In Erlang, modules also correspond to atoms. Somewhere on the disk is a file
named 'code.beam' that contains the compiled code for the ':code' module.
Erlang uses simple filenames, which is the reason for this call syntax. But
the rules are the same as with Elixir modules. Elixir modules are nothing
more than Erlang modules with fancier names, such as 'Elixir.MyModule'.

You can create modules with simple names in Elixir, although this is not recommended:

  defmodule :my_module do
    ...
  end

Compiling the source file that contains such a definition will generate
'my_module.beam' on the disk.

The important thing to remember is that at runtime, module names are atoms.
And somewhere on the disk is an 'xyz.beam' file, where 'xyz' is the expanded
form of an alias, such as 'Elixir.MyModule when the modules is named MyModule.
"
|>IO.puts()
