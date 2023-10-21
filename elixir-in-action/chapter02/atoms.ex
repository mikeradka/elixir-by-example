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
IO.puts(string <> " : " <> to_string(variable))

# ALIASES
# You can omit the beginning colon and start with an
# uppercase character:
# iex(1)> AnAtom
# AnAtom
# iex(2)> is_atom(AnAtom)
# true
variable = AnAtom
string = "variable = AnAtom"
pad = String.pad_leading(": ", 7)
IO.puts(string <> pad <> to_string(variable))
