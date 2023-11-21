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

Constants are much more useful in compound matches. For example, it is common
to use tuples to group various fields of a record. The following snippet
creates a tuple that holds a person's name and age:

  iex(1)> person = {:person, \"Bob\", 25}
  {:person, \"Bob\", 25}

The first element is a constant atom, ':person', which you use to denote
that this tuple represents a person. You can then rely on this to retrieve
individual attributes of the person:

  iex(2)> {:person, name, age} = person
  {:person, \"Bob\", 25}

Here, you expect the right-side term to be a three-element tuple, with its
first element having a value of ':person'. After the match, the remaining
elements of the tuple are bound to the variables 'name' and 'age' which you
can easily verify:

  iex(3)> name
  \"Bob\"
  iex(4)> age
  25

This is a common idiom in Elixir.

Many functions from Elixir and Erlang return either '{:ok, result}' or
'{:error, reason}'. For example, imagine that your system relies on a
configuration file and expects it to always be available. You can read the
file contents with the help of the 'File.read/1' function.

  iex(2)> {:ok, contents} = File.read(\"my_app.config\")
   {:ok, \"This is just a test config file to illustrate File.read/1.\"}
  iex(3)> contents
   \"This is just a test config file to illustrate File.read/1.\"
"
|> IO.puts()
