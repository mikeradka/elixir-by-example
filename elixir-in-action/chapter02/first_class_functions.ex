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
