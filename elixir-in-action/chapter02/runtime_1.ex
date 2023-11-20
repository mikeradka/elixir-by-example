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
"
|>IO.puts()
