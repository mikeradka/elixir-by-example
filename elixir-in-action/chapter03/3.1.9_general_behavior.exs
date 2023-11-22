"
GENERAL BEHAVIOR

To formalize the behavior of basic pattern-matching a bit:

The pattern matching expression consists of two parts: the 'pattern' (left)
and the 'term' (right). In a 'match expression', an attempt to match the
term to the pattern takes place.

If the match succeeds, all variables in the pattern are bound to the
corresponding values from the term. The result of the entire expression is
the entire term you matched. If the match fails, an error is raised.

Therefore, in a pattern matching expression, two different tasks are
performed:

  1. You assert your expectations about the right-side term. If the expectations
     are not met, an error is raised.
  2. You bind some parts of the term to variables from the pattern.

The match operator '=' is just one example where pattern matching can be
used. Pattern matching powers many other kinds of expressions, and it is
especially powerful when used with functions.
"
|> IO.puts()
