defmodule Print do
  @moduledoc "Implements basic printing functions"

  import IO

  @doc "Prints the expression input and output with some padding"
  def print_expression(input, output, padding) do
    pad = String.pad_leading(" : ", padding)
    puts(input <> pad <> to_string(output))
  end
end

# STRINGS
#
# Elixir doesn't have a dedicated string type.
# Instead, strings are represented by using either a binary
# or a list type.
#
# BINARY STRINGS
#
# The most common way to use strings is to specify them with
# the familiar double-quotes syntax:
#
# iex(1)> "This is a string"
# "This is a string"

expr = "This is a string"
expr_str = ~s("This is a string")
Print.print_expression(expr_str, expr, 27)

# The result is printed as a string, but underneath it's a
# binary - nothing more than a ceonsecutive sequence of bytes.
#
# Elixir provides support for embedded string expressions. You
# can use #{} to place an Elixir expression in a string constant.
# The expression is immediately evaluated, and its string
# representation is placed at the corresponding location in
# the string:
#
# iex(4)> "Embedded expression: #{3 + 0.14}"
# "Embedded expression: 3.14"

expr = "Embedded expression: #{3 + 0.14}"
expr_str = ~s("Embedded expression: #{3 + 0.14}")
Print.print_expression(expr_str, expr, 18)

# Classical \ escaping works as you're used to:
#
# iex(1)> "\r \n \" \\"
# "\r \n \" \\"

expr = "\r \n \" \\"
expr_str = ~S("\r \n \" \\")
Print.print_expression(expr_str, expr, 0)

# And strings don't have to finish on the same line:
#
# iex(1)> "
# ...(1)> This is
# ...(1)> a multiline string
# ...(1)> "
# "\nThis is\na multiline string\n"

expr = "
This is
a multiline string
"
IO.puts(expr)

# Elixir provides another syntax for declaring strings,
# so-called sigils. In this approach, you enclose the string
# inside ~():
#
# iex(2)> ~s(This is also a string)
# "This is also a string"

expr = ~s(This is also a string)
expr_str = "~s(This is also a string)"
Print.print_expression(expr_str, expr, 20)

# Sigils can be useful if you want to include quotes in a string:
#
# iex(3)> ~s("Do or do not. There is no try." -Yoda)
# "\"Do or do not. There is no try.\" -Yoda"

expr = ~s("Do or do not. There is no try." -Yoda)
expr_str = "~s(\"Do or do not. There is no try.\" -Yoda)"
Print.print_expression(expr_str, expr, 0)

# There's also an uppercase version ~S that doesn't handle
# interpolation or escape characters (\):
#
# iex(4)> ~S(Not interpolated #{3 + 0.14})
# "Not interpolated \#{3 + 0.14}"
#
# iex(5)> ~S(Not escaped \n)
# "Not escaped \\n"

expr = ~S(Not interpolated #{3 + 0.14})
expr_str = "~S(Not interpolated #{3 + 0.14})"
Print.print_expression(expr_str, expr, 20)
