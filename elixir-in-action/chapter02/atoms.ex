# Atoms are literal named constants. They're similar
# to symbols in Ruby or enumerations in C/C++. Atom
# constants start with a colong character, followed
# by a combination of alphanumerics and/or
# underscore characters
#
# :an_atom
# :another_atom
# :"an atom with spaces"
#
# An atom consists of two parts: text and the value.
# The atom text is whatever goes after the colon.
# At runtime, this text is kept in the atom table.
# The value is the data that goes into the variable,
# and it's merely a reference to the atom table.
#
# Atoms are best used for named constants. They're
# efficient both memory and performance-wise.
# When you say:
#
# variable = :some_atom
#
# the variable doesn't contain the entire text, but
# only a reference to the atom table. Therefore, memory
# consumption is low, the comparisons are fast, and
# the code is still readable.
variable = :some_atom
string = "variable = :some_atom"
pad = String.pad_leading(": ", 7)
IO.puts(string <> pad <> to_string(variable))

# ALIASES
# You can omit the beginning colon and start with an
# uppercase character:
# iex(1)> AnAtom
# AnAtom
# iex(2)> is_atom(AnAtom)
# true
variable = AnAtom
string = "variable = AnAtom"
pad = String.pad_leading(": ", 11)
IO.puts(string <> pad <> to_string(variable))

# Remember that aliases can also be used to give alternate
# names to modules
#
# iex(3)> alias IO, as: MyIO
#
# iex(4)> MyIO.puts("Hello!")
# Hello!”
#
# When you write alias IO, as: MyIO, you instruct the elixir
# compiler to transform MyIO into IO. Resolving this further,
# the final result emitted in the generated binary is :Elixir.IO.
# Therefore, with an alias set up, the following also holds:
#
# iex(5)> MyIO == Elixir.IO
# true
#
# Aliases support the proper resolution of modules.
#
# ATOMS AS BOOLEANS
# Elixir doesn't have a dedicated Boolean type. Instead, the
# atoms :true and :false are used. As syntactic sugar, Elixir
# allows you to reference these atoms without the starting
# colon character:
#
# iex(1)> :true == true
# true
# iex(2)> true
# true
true_atom = :true == true
true_atom_str = ":true == true"
pad = String.pad_leading(": ", 15)
IO.puts(true_atom_str <> pad <> to_string(true_atom))

# A boolean is just an atom that has a value of true or false
# The term Boolean is still used in Elixir to denote an atom
# that has a value of either :true or :false. The standard
# logical operators work with Boolean atoms:
# iex(1)> true and false
# false
# iex(2)> false or true
# true
# iex(3)> not false
# true
# iex(4)> not :an_atom_other_than_true_or_false
# ** (ArgumentError) argument error
#     :erlang.not(:an_atom_other_than_true_or_false)
#     iex:4: (file)
#
# AND Boolean operator example
andd = true and false
andd_str = "true and false"
pad = String.pad_leading(": ", 14)
IO.puts(andd_str <> pad <> to_string(andd))

# OR Boolean operator example
orr = false or true
orr_str = "false or true"
pad = String.pad_leading(": ", 15)
IO.puts(orr_str <> pad <> to_string(orr))

# NOT Boolean operator example
nott = not false
nott_str = "not false"
pad = String.pad_leading(": ", 19)
IO.puts(nott_str <> pad <> to_string(nott))

# NIL AND TRUTHY VALUES
# Another special atom is :nil, which works somewhat
# similarly to null from other languages. You can
# reference nil without a colon:
#
# iex(1)> nil == :nil
# true
nill  = nil == :nil
nill_str = "nil == :nil"
pad = String.pad_leading(": ", 17)
IO.puts(nill_str <> pad <> to_string(nill))

# The atom nil plays a role in Elixir's additional support
# for truthness. The atoms nil and false are treated as
# falsy values, whereas everything else is treated as a
# truthy value.
#
# This property can be used with Elixir's short-circuit
# operators ||, &&, and !. The operator || returns the
# first expression that isn't falsy:
#
# iex(1)> nil || false
# false
# iex(2)> nil || false || 5
# 5
# iex(3)> nil || false || 5 || true
# 5
# iex(4)> nil || false || true
# true

# || short-circuit operator example
isnot_falsy = nil || false || 5 || true
isnot_falsy_str = "nil || false || 5 || true"
IO.puts(isnot_falsy_str <> " : " <> to_string(isnot_falsy))

# Because nil and false are falsy expressions, the number
# 5 is returned. Subsequent expressions won't be evaluated
# at all. If all expressions evaluate to a falsy value, the
# result of the last expression is returned:
#
# iex(5)> nil || false || :true == false || nil
# nil
#
# The operator && returns the second expression, but only if
# the first expression is truthy. Otherwise, it returns the
# first expression without evaluating the second one:
#
# iex(1)> true && 5
# 5
# iex(2)> false && 5
# false
# iex(3)> nil && 5
# nil
# iex(4)> :true == false && 5
# false

# Short-circuiting can be used for elegant operation chaining.
# For example, if you need to fetch a value from a cache, a
# local disk, or a remote database, you could do this:
#
# read_cached || read_from_disk || read_from_database
#
# Similarly, you can use the && operator to ensure that
# certain conditions are met:
#
# database_value = connection_established? && read_data
#
# Short-circuit operators make it possible to write concise code.
