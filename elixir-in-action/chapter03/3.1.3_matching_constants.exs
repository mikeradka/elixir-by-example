"
MATCHING CONSTANTS

Matching is not confined to destructuring tuple elements to individual
variables. Even constants are allowed on the left side of the match
expression.

  iex(1)> 1 = 1
  1

The match operator '=' tries to match the right-side term to the left-side
pattern. So in this example, you try to match the pattern 1 to the term 1.
This succeeds (of course), and the result of the entire expression is the
right-side term.

Here is an example of a failure:

  iex(2)> 2 = 1
  ** (MatchError) no match of right hand side value: 1

This example is only used to illustrate that you can place constants to the
left of '=', proving that '=' is NOT an assignment operator.
"
|> IO.puts()
