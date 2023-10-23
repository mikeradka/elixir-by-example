# IMMUTABILITY
# Elixir data can't be mutated. Every function returns the new,
# modified version into another variable or rebinds it to the
# same symbolic name.
#
# In any case, the result resides in another
# memory location. The modification of the input will result in
# some data copying, but generally most of the memory will be
# shared between the old and the new version.
