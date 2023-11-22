"
GENERAL BEHAVIOR

To formalize the behavior of basic pattern-matching a bit:

The pattern matching expression consists of two parts: the 'pattern' (left)
and the 'term' (right). In a 'match expression', an attempt to match the
term to the pattern takes place.

If the match succeeds, all variables in the pattern are bound to the
corresponding values from the term. The result of the entire expression is
the entire term you matched. If the match fails, an error is raised.
"
|> IO.puts()
