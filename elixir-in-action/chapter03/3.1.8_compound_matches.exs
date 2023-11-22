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

Match chaining is another interesting feature.
Recall that a match expression has this general form:

  pattern = expression

You can place any expression on the right side:

  iex(1)> a = 1 + 3
  4

To break down what happens here:

  1. The expression on the right side is evaluated.
  2. The resulting value is matched against the left-side pattern.
  3. Variables from the pattern are bound.
  4. The result of the match expression is the result of the right-side term.

An important consequence is that match expressions can be chained:

  iex(2)> a = (b = 1 + 3)
  4

In the above example, the following happens:

  1. The expression 1 + 3 is evaluated.
  2. The result (4) is matched against the pattern b.
  3. The result of the inner match (which is again 4) is matched against
     the pattern a.

Consequently, both a and b have the value 4.
Here is another example with different values extracted for a and b:

  iex(8)> a = 1 + (b = 1 + 3)
  5
  iex(9)> b
  4
  iex(10)> a
  5

Parenthesis are optional, and many developers omit them in this case:

  iex(1)> a = b = 1 + 3
  4
  iex(2)> a
  4
  iex(3)> b
  4

This yields the same result, due to the fact that the operator '=' is
right-associative.

Now let's look at a more useful example, using the Erlang function
':calendar.local_time/0':

  iex(4)> :calendar.local_time()
  {{2023, 11, 21}, {22, 23, 46}}

Let's say you want to retrieve the function's total result (datetime) as
well as the current hour of the day. You can do this in a single compound
match:

  iex(5)> date_time = {_, {hour, _, _}} = :calendar.local_time()
  {{2023, 11, 21}, {22, 26, 13}}
  iex(6)> hour
  22
  iex(7)> date_time
  {{2023, 11, 21}, {22, 26, 13}}

You can even swap the ordering, and it will give the same result:

  iex(8)> {_, {hour, _, _}} = date_time = :calendar.local_time()
  {{2023, 11, 21}, {22, 27, 48}}
  iex(9)> hour
  22
  iex(10)> date_time
  {{2023, 11, 21}, {22, 27, 48}}

This works because the result of a pattern match is always the result of the
term being matched (whatever is on the right-side of the match operator).
You can successively match against the result of that term and extract
different parts you're interested in.
"
|> IO.puts()
