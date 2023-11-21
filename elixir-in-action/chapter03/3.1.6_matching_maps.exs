"
MATCHING MAPS

To match a map, you can use the following syntax:

  iex(1)> %{name: name, age: age} = %{name: \"Bob\", age: 25}
  %{name: \"Bob\", age: 25}
  iex(2)> name
  \"Bob\"
  iex(3)> age
  25

When matching a map, the left-side pattern does not need to contain all of
the keys from the right-side term:

  iex(4)> %{age: age} = %{name: \"Bob\", age: 25}
  %{name: \"Bob\", age: 25}
  iex(5)> age
  25

Since maps are frequently used to represent structured data, the partial
matching works with maps. You are often interested in only some of a map's
fields. In the previous snippet, for instance, you only want to extract the
'age' field, and ignore everything else. Partial matching allows this to be.

However, a match WILL fail if the pattern contains a key that is NOT in the
matched term:

  iex(6)> %{works_at: works_at} = %{name: \"Bob\", age: 25}
  ** (MatchError) no match of right hand side value: %{name: \"Bob\", age: 25}
"
|> IO.puts()
