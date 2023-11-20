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
"
|>IO.puts()
