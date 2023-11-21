"
VARIABLES IN PATTERNS

Whenever a variable name exists in the left-side pattern, it always matches
the corresponding right-side term. In addition, the variable is bound to
the term it matches.

Sometimes, we aren't interested in a value from the right-side term, but
still need to match on it.

For example, let's say you want to get the current time of day. You can use
the Erlang function ':calendar.local_time/0', which returns a tuple of
{date, time}. But you are not interested in a date, so you do not want to
store it in a separate variable.

For this, you can use the 'anonymous variable', '_':

  iex(6)> {_, time} = :calendar.local_time()
  {{2023, 11, 21}, {17, 3, 0}}
  iex(7)> time
  {17, 3, 0}

With matching, the anonymous variable works just like a named variable. It
matches any right-side term. But the value of the term is not bound to any
variable.

You can also add a descriptive name after the underscore character for an
anonymous variable:

  iex(9)> {_date, time} = :calendar.local_time()

The '_date' is regarded as an anonymous variable because its name begins with
an underscore. You could technicallyt still use that variable in the rest of
the program, but the compiler would throw a warning:

  iex(11)> _date
  warning: the underscored variable \"_date\" is used after being set. A leading underscore indicates that the value of the variable should be ignored.

Along with anonymous variables, patterns can be arbitrarily nested. So taking
this example further, if you only want to retrieve the current hour of the
day:

  iex(1)> :calendar.local_time()
  {{2023, 11, 21}, {17, 16, 31}}
  iex(2)> {_, {hour, _, _}} = :calendar.local_time()
  {{2023, 11, 21}, {17, 16, 54}}
  iex(3)> hour
  17

A variable can be referenced multiple times in the same pattern.
In the following expressions, you expect an RGB triplet with the
same number for each component:

  iex(4)> {amount, amount, amount} = {127, 127, 127}  # Matches a tuple with 3 identical elements
  {127, 127, 127}

  iex(5)> {amount, amount, amount} = {127, 127, 1}    # Fails because the tuple elements aren't identical
  ** (MatchError) no match of right hand side value: {127, 127, 1}

Occasionally, you will need to match against the contents of the variable. For
this purpose, the 'pin operator', '^' is provided.

  iex(1)> expected_name = \"Bob\" # matches anything and binds to the variable 'expected_name'
  \"Bob\"
  iex(2)> {^expected_name, _} = {\"Bob\", 25}  # matches to the content of the variable 'expected_name'
  {\"Bob\", 25}
  iex(3)> {^expected_name, _} = {\"Alice\", 25}
  ** (MatchError) no match of right hand side value: {\"Alice\", 25}
"
|> IO.puts()
