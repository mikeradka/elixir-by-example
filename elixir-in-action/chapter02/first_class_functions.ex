# FIRST-CLASS FUNCTIONS
# In Elixir, a function is a first-class citizen, which means
# it can be assigned to a variable. Here, assigning a function
# to a variable doesn't mean calling the function and storing
# its result to a variable. Instead, the function definition
# itself is assigned, and you can use the variable to call
# the function.
#
# As an example, to create a function, you can use the fn construct:
#
# # iex(1)> square = fn x ->
# ...(1)>  x * x
# ...(1)> end
# #Function<42.125776118/1 in :erl_eval.expr/6>
#
# The variable square now contains a function that computes
# the square of a number. Because the function isn't bound to
# a global name, it's also called an anonymous function or
# a lambda.
#
# Notice that the list of arguments isn't enclose in parenthesis.
# You CAN technically use parenthesis here, but the prevalent
# convention enforced by the Elixir formatter is to omit the
# parenthesis. This may seem inconsistent, but there is a good
# reason for this which will be discussed in Chapter 3.
#
# You can call this function by specifying the variable name
# followed by a dot (.) and the arguments:
#
# iex(2)> square.(5)
# 25
#
# NOTE: the dot operator indicates that an anonymous function
# is being invoked. In contrast, the expression square(5) is
# invoking a named function defined somewhere else in the
# module. Without the dot operator, you'd have to parse the
# surrounding code to understand whether you're calling a
# named function or an anonymous function.

square = fn x ->
  x * x
end

"
square = fn x ->
  x * x           : square.(5) = " <> to_string(square.(5)) <> "
end
"
|> IO.puts()

# Because functions can be stored in a variable, they can be
# passed as arguments to other functions. This is often used
# to allow clients to parameterize generic logic.
# For example, the function Enum.each/2 implements the generic
# iteration - it can iterate over anything enumerable, such as
# lists. It takes two arguments: an enumerable and a one-arity
# lambda (an anonymous function that accepts one argument). It
# iterates through the enumerable and calls the lambda to
# specify what they want to do with each element.
#
# The following snippet uses Enum.each to print each value of
# a list to the screen:
#
# iex(3)> print_element = fn x -> IO.puts(x) end
# #Function<42.125776118/1 in :erl_eval.expr/6>
# iex(4)> Enum.each(
# ...(4)>  [1, 2, 3],
# ...(4)>  print_element
# ...(4)> )
# 1
# 2
# 3
# :ok

"
  iex(3)> print_element = fn x -> IO.puts(x) end  # Defines the lambda
  #Function<42.125776118/1 in :erl_eval.expr/6>
  iex(4)> Enum.each([1, 2, 3], print_element)     # Passes the lambda to Enum.each/2
  1                                               # Output printed by the lambda
  2                                               # Output printed by the lambda
  3                                               # Output printed by the lambda
  :ok                                             # Return value of Enum.each/2
"
|> IO.puts()

"
Of couse, you don't need a temp variable to pass the lambda to Enum.each/2:

  iex(5)> Enum.each([1, 2, 3], fn x -> IO.puts(x) end)  # Passes the lambda directly
  1
  2
  3
  :ok
"
|> IO.puts()

# Notice how the lambda just forwards all arguments to IO.puts,
# doing no other meaningful work. For such cases, Elixir makes
# it possible to directly reference the function and have a
# more compact lambda definition.
# Instead of writing fn x -> IO.puts(x) end, you can write
# &IO.puts/1.
#
# The & operator, also known as the capture operator, takes the
# full function qualifier - a module name, a function name, and
# an arity - and turns that function into a lambda that can be
# assigned to a variable. You can use the capture operator to
# simplify the call to Enum.each/2:
# iex(8)> Enum.each([1, 2, 3], &IO.puts/1)  # Passes the lambda that deletgates to IO.puts
# 1
# 2
# 3
# :ok

"
Instead of writing fn x -> IO.puts(x) end, you can write &IO.puts/1. You can use
the capture operator (&) to simplify the call to Enum.each/2:

  iex(6)> Enum.each([1, 2, 3], &IO.puts/1)
  1
  2
  3
  :ok
"
|> IO.puts()

# The capture operator can also be used to shorten the lambda
# definition, making it possible to omit explicit argument
# naming. For example, you can turn this definition
#
# iex(11)> lambda = fn x, y, z -> x * y + z end
#
# Into a more compact form:
#
# iex(12)> lambda = &(&1 * &2 + &3)
#
# This snippet creates a three-arity lambda. Each argument is
# referred to via the &n placeholer, which identifies the nth
# argument of the function. You can call this lambda like
# any other:
#
# iex(13)> lambda.(2, 3, 4)
# 10
#
# The return value 10 amounts to 2 * 3 + 4, as specified in
# the lambda definition.

"
The capture operator can also be used to shorten the lambda definition.
For example, you can turn this definition:

  iex(7)> lambda = fn x, y, z -> x * y + z end

Into a more compact form:

  iex(8)> lambda = &(&1 * &2 + &3)

This creates a three-arity lambda, which can be called like any other:

  iex(9)> lambda.(2, 3, 4)
  10
"
|> IO.puts()

"
CLOSURES
A lambda can reference any variable from the outside scope:

  iex(1)> outside_var = 5
  5
  iex(2)> my_lambda = fn ->
  ...(2)>   IO.puts(outside_var)    # Lambda references a variable from the outside scope
  ...(2)> end
  #Function<43.125776118/0 in :erl_eval.expr/6>
  iex(3)> my_lambda.()
  5
  :ok
"
|> IO.puts()

"
As long as you hold the reference to my_lambda, the variable outside_var is
also accessible. This is also known as closure: by holding a reference to a
lambda, you indirectly hold a reference to all variables it uses, event if
those variables are from the external scope.
A closure always captures a specific memory location. Rebinding a variable
doesn't affect the previously defined lambda that references the same
symbolic name:

  iex(1)> outside_var = 5
  5
  iex(2)> lambda = fn -> IO.puts(outside_var) end   # lambda captures the current location of outside_var
  #Function<43.125776118/0 in :erl_eval.expr/6>
  iex(3)> outside_var = 6                           # Rebinding doesn't affect the closure
  6
  iex(4)> lambda.()                                 # Proof that the closure isn't affected
  5
  :ok
"
|> IO.puts()

"
The preceding code illustrates another important point. Normally,
after you have rebound outside_var to the value 6, the original
memory location would be eligible for garbage collection. But
because the lambda function captures the original location (the
one that holds the number 5, and you're still referencing that
lambda, the original location isn't available for garbage collection.
"
|> IO.puts()
