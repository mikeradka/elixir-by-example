"
SUMMARY

  - Elixir code is divided into modules and functions.
  - Elixir is a dynamic language. The type of a variable is determined
    by the value it holds.
  - Data is immutable - it can't be modified. A function can return the
    modified version of the input that resides in another memory location.
    The modified version shares as much memory as possible with the original
    data.
  - The most important primitive data types are numbers, atoms, and binaries.
  - There is no Boolean type. Instead, the atoms 'true' and 'false' are used.
  - There is no nullability. The atom 'nil' can be used for this purpose.
  - There is no string type. Instead, you can use either binaries (recommended)
    or lists (when needed).
  - The built-in complex types are tuples, lists, and maps. Tuples are used
    to group a small, fixed-size number of fields. Lists are used to manage
    variable-size collections. A map is a key/value data structure.
  - Range, Keyword Lists, MapSet, Date, Time, NaiveDateTime, and DateTime are
    abstractions built on top of the existing built-in types.
  - Functions are first-class citizens (can be assigned to variables)
  - Module names are atoms (or aliases) that correspond to '.beam' files on
    the disk.
  - There are multiple ways of starting programs: iex, elixir, and the mix tool.
"
|> IO.puts()
