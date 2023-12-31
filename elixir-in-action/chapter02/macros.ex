"
MACROS

Compared to Erlang, macros are probably one of the most important features
of Elixir. Macros can perform powerful code transformations in compile
time. Macros reduce boilerplate and provide elegant, mini-DSL constricts.

Macros are a somewhat advanced, complex subject that should be used sparingly.
But it is good to have a general idea of how they work because many Elixir
features are powered by macros.

A macro consists of Elixir code that can change the semantics of the input
code. Macros are always called at compile time. They receive the parsed
representation of the Elixir code, and can return an alternative version
of that code.

  unless some_expression do
    block_1
  else
    block_2
  end

'unless' is not a special keyword. It is a macro (an Elixir function) that
transforms the input code into something like this:

  if some_expression do
    block_2
  else
    block_1
  end

This type of transformation is not possible with C-style macros, because the
code of the expression can be arbitrarily complex and nested in multiple
parenthesis. But in Elixir macros (inspired by Lisp), you already work on a
parsed source representation. So you'll have access to the expression and
both blocks in separate variables.

Many parts of Elixir are written with macros, uncluding the 'unless' and 'if'
constructs. Also 'defmodule' and def' are written using macros. Other
languages typically use keywords for these features. In Elixir, these features
are built on top of a much smaller language core.

Main takeaway: macros are compile-code transformers. Macros run at compile
time to produce alternative code.
"
|> IO.puts()
