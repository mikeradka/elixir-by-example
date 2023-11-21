"
THE MATCH OPERATOR

So far, you've seen the most basic use of the match operator:

  iex(1)> person = {\"Bob\", 25}
        ^ pattern  ^ expression
        {\"Bob\", 25}
        ^ term

We treated this like an assignment, but in reality something more complex is
going on here. At runtime, the left side is called a 'pattern', and on the
right side you have an 'expression' that evaluates to an Elixir term.

In this example, you match the variable 'person' to the righ-side term
'{\"Bob\", 25}'. A variable always matches the right-side term, and it
becomes bound to the value of that term.
"
|> IO.puts()
