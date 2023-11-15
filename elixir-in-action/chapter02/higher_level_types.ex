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

"
---
KEYWORD LISTS

A keyword list is a special case of a list where each element
is a two-element tuple. The first element is an atom. The 2nd
element can be of any type. For example:

  iex(1)> days = [{:monday, 1}, {:tuesday, 2}, {:wednesday, 3}]
  [monday: 1, tuesday: 2, wednesday: 3]

There is a slightly more elegant syntax to define a keyword list:

  iex(2)> days = [monday: 1, tuesday: 2, wednesday: 3]
  [monday: 1, tuesday: 2, wednesday: 3]

Either way, a keyword list is a list of pairs.

Keyword lists are often used for small-size key/value structures,
where keys are atoms. Many useful functions are available in the
Keyword module (https://hexdocs.pm/elixir/Keyword.html).

For example, you can use Keyword.get/2 to fetch the value for a key:

  iex(3)> Keyword.get(days, :monday)
  1
  iex(4)> Keyword.get(days, :noday)
  nil

Just like with maps, you can use the [] operator to fetch a value:

  iex(5)> days[:tuesday]
  2

Keep in mind that because you're dealing with a list, the complexity
of a lookup operation is O(n) which is expensive.
"
|> IO.puts()
