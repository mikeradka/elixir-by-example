"
HIGHER-LEVEL TYPES

Because Elixir code runs on BEAM, its type system is heavily
influenced by Erlang's foundations. But on top of the basic
foundational Erlang types, Elixir provides some higher-level
abstractions.

The ones most frequently used are:
  - Range
  - Keyword
  - MapSet
  - Date
  - Time
  - NaiveDateTime
  - DateTime
"
|> IO.puts()

"
---
RANGE

A range is an abstraction that can represent a range of numbers.
Elixir has a special syntax to define ranges:

  iex(1)> range = 1..2
  1..2
  iex(2)> 2 in range
  true
  iex(3)> -1 in range
  false

Ranges are enumerable, so functions from the Enum module can
work with them. For example, to iterate through the range:

  iex(4)> Enum.each(range, &IO.puts/1)
  1
  2
  :ok

A range is not a special type. It is represented as a map that
contains range boundaries. So, the memory footprint of a range
is very small. A million-number range is just a small map.
"
|> IO.puts()
