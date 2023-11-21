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

This feature is useful when you call a function that returns a tuple and
you want to bind individual elements of that tuple to separate variables.
For example, the Erlange function ':calendar.local_time/0' returns a tuple
of the current date and time:

  iex(1)> {date, time} = :calendar.local_time()
  {{2023, 11, 20}, {21, 3, 56}}

You now have separate variables for the date and time:

  iex(2)> date
  {2023, 11, 20}
  iex(3)> time
  {21, 3, 56}
"
|> IO.puts()
