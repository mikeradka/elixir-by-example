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
"
|> IO.puts()
