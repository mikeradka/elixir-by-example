IO.puts("Hello world from Elixir")

IO.puts("foo" <> "bar") # concatenation
IO.puts(5 + 5)  # simple math expression

IO.puts(true and false) # boolean operator example
IO.puts(true or false) # another boolean operator example
IO.puts(true or raise("This error will never be raised"))

IO.puts(1 || true) # or
IO.puts(false || 11) # another or

IO.puts(nil && 13) # and
IO.puts(true && 17) # another and

IO.puts(!true) # not
IO.puts(!1) # another not
IO.puts(!nil) # not with nil

IO.puts(1 == 1) # == comparison operator
IO.puts(1 != 2) # != comparison operator
IO.puts(1 < 2) # < comparison operator
IO.puts(1 == 1.0) # less strict structural comparison
IO.puts(1 === 1.0) # more strict structural comparison

x = 1 # assign a variable
IO.puts(x)  # print the variable
IO.puts(1 = x) # match operator true
# IO.puts(2 = x) # match operator false

{a, b, c} = {:hello, "world", 42}
IO.puts(a) # pattern match on tuples
IO.puts(b)
IO.puts(c)

{:ok, result} = {:ok, 13} # pattern match on specific values
IO.puts(result)

[a, b, c] = [1, 2, 3] # pattern match on a list
IO.puts(a)
