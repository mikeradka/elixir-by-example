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
  {{2023, 11, 20}, {21, 7, 44}}

You now have separate variables for the date and time:

  iex(2)> date
  {2023, 11, 20}
  iex(3)> time
  {21, 7, 44}

Since date and time are also tuples, you can further decompose them into
variables:

  iex(4)> {year, month, day} = date
  {2023, 11, 20}
  iex(5)> year
  2023
  iex(6)> month
  11
  iex(7)> day
  20

  iex(8)> {hour, minute, second} = time
  {21, 7, 44}
  iex(9)> hour
  21
  iex(10)> minute
  7
  iex(11)> second
  44

If the right side does not correspond to the pattern, the match will fail
and an error is raised:

  iex(1)> {name, age} = \"can't match\"
  ** (MatchError) no match of right hand side value: \"can't match\"

Matching is not confined to destructuring tuple elements to individual
variables. Even constants are allowed on the left side of the match
expression.
"
|> IO.puts()
