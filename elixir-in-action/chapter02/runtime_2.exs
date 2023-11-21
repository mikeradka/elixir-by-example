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

The 'elixir' command can be used to run a single Elixir source file.
"
|> IO.puts()
