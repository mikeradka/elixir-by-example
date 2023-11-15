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

Keyword lists are most often useful for allowing clients to pass an
arbitrary number of optional arguments. For example, the result of
the function IO.inspect can be controlled by providing additional
options through a keyword list:

  iex(1)> IO.inspect([100, 200, 300])             # Default behavior
  [100, 200, 300]
  iex(2)> IO.inspect([100, 200, 300], [width: 3]) # Passes additional options
  [100,
   200,
   300]

In fact, this pattern is so frequent that Elixir allows you to omit
the square brackets if the last argument is a keyword list:

  iex(1)> IO.inspect([100, 200, 300], width: 3, limit: 1)
  [100,
   ...]

In this example you're still sending two arguments to IO.inspect/2:
a number and a two-element keyword list. But this demonstrates how
to simulate optional arguments. You can accept a keyword list as
the last argument of your function, and make that argument default
to an empty list:

  def my_fun(arg1, arg2, opts \\ []) do
    ...
  end

Your clients can then pass options via the last argument. It is
up to you to check the contents in the opts argument and perform
some conditional logic depending on what the caller sent you.

You may wonder if it's better to use maps instead of keywords for
optional arguments. A keyword list can contain multiple values
for the same key. You can also control the ordering of keyword
list elements, which is not possible with maps. Finally, many
functions in the standard libraries of Elixir and Erlang take
their options as keyword lists. It's best to stick to the existing
convention and accept optional parameneters via keyword lists.
"
|> IO.puts()

"
---
MAPSET

A MapSet is the implementation of a set - a store of unique
values, where a value can be of any type.

  iex(1)> days = MapSet.new([:monday, :tuesday, :wednesday]) # Creates a MapSet instance
  MapSet.new([:monday, :tuesday, :wednesday])
  iex(2)> MapSet.member?(days, :monday)                      # Verifies element's presence
  true
  iex(3)> MapSet.member?(days, :noday)                       # Verifies non-existing element
  false
  iex(4)> days = MapSet.put(days, :thursday)                 # Puts a new element to the MapSet
  MapSet.new([:monday, :thursday, :tuesday, :wednesday])

As shown, you can manipulate the set using the function from
the MapSet module (https://hexdocs.pm/elixir/MapSet.html).

A MapSet is also enumerable, so you can pass functions from
the Enum module:

  iex(5)> Enum.each(days, &IO.puts/1)
  monday
  thursday
  tuesday
  wednesday

As shown above, MapSet doesn't preserve the ordering of the items.
"
|> IO.puts()

"
---
TIMES AND DATES

Elixir has a few modules for date and time types:
  - Date
  - Time
  - DateTime
  - NaiveDateTime

A date can be created with the ~D sigil:

  iex(1)> date = ~D[2018-01-31]
  ~D[2018-01-31]

Once the date is created, you can retrieve its individual fields:

  iex(3)> date.year
  2018
  iex(4)> date.month
  1
  iex(5)> date.day
  31

You can represent a time with the ~T sigil:

  iex(2)> time.hour
  11
  iex(3)> time.minute
  59
  iex(4)> time.microsecond
  {70, 5}
  iex(5)> time.second
  12
"
|> IO.puts()
