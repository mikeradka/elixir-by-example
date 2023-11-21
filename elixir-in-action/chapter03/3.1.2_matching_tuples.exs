"
MATCHING TUPLES

The following example demonstrates basic pattern matching of tuples:

  iex(1)> {name, age} = {\"Bob\", 25}
  {\"Bob\", 25}

This expression assumes that the right-side term is a tuple of two elements.
When the expression is evaluated, the variables 'name' and 'age' are bound
to the corresponding elements of the tuple. To verify they are bound:

  iex(2)> name
  \"Bob\"
  iex(3)> age
  25
"
|> IO.puts()
