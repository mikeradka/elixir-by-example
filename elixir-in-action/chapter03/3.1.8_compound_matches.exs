"
COMPOUND MATCHES

Already mentioned, but to emphasize the point - patterns can be arbitarily
nested, as in the following example:

  iex(1)> [_, {name, _}, _] = [{\"Bob\", 25}, {\"Alice\", 30}, {\"John\", 35}]
  [{\"Bob\", 25}, {\"Alice\", 30}, {\"John\", 35}]
  iex(2)> name
  \"Alice\"

In the above example, the term being matched is a list of 3 elements. Each
element is a tuple representing a person, consisting of 2 fields: a person's
name and age. The match extracts the name of the second person in the list.

MATCH CHAINING
"
|> IO.puts()
