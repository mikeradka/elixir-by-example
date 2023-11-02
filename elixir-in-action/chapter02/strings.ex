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
# Elixir doesn't have a dedicated string type.
# Instead, strings are represented by using either a binary
# or a list type.
#
# BINARY STRINGS
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

expr = ~S(Not escaped \n)
expr_str = "~S(Not escaped \\n)"
Print.print_expression(expr_str, expr, 27)

# Finally, there's a special heredocs syntax, which supports
# better formatting for multiline strings. Heredocs strings
# start with a triple double-quote. The ending triple double-quote
# must be on its own line:
#
# iex(6)> """
# ...(6)> Heredoc must end on its own line """
# ...(6)> """
# "Heredoc must end on its own line \"\"\"\n"

expr = """
Heredoc must end on its own line """
"""
IO.puts(expr)

# Because strings are binaries, you can concatenate them with
# the <> operator:
#
# iex(7)> "String" <> " " <> "concatenation"
# "String concatenation"

expr = "String" <> " " <> "concatenation"
expr_str = ~s("String" <> " " <> "concatenation")
Print.print_expression(expr_str, expr, 11)

# Many helper functions are available for working with binary
# strings. Most of them reside in the String module
# https://hexdocs.pm/elixir/String.html
#
# CHARACTER LISTS
# The alternative way of representing strings is to use
# single-quote syntax:
#
# iex(1)> 'ABC'
# ~c"ABC"

expr = 'ABC'
expr_str = "'ABC'"
Print.print_expression(expr_str, expr, 40)

# This creates a character list, which is a list of integers
# in which each element represents a single character.
#
# The previous result is exactly the same as if you manually
# construct the list of integers:
#
# iex(3)> [65, 66, 67]
# ~c"ABC"

expr = [65, 66, 67]
expr_str = "[65, 66, 67]"
Print.print_expression(expr_str, expr, 33)

# Even the runtime doesn't distinguish between a list of
# integers and a character list. When a list consists of
# integers that represent printable characters, it's printed
# on the screen in the string form.
#
# iex(5)> 'Interpolation: #{3 + 0.14}'
# ~c"Interpolation: 3.14"

expr = 'Interpolation: #{3 + 0.14}'
expr_str = "'Interpolation: #{3 + 0.14}'"
Print.print_expression(expr_str, expr, 24)

# iex(6)> ~c(Character list sigil)
# ~c"Character list sigil"

expr = ~c(Character list sigil)
expr_str = "~c(Character list sigil)"
Print.print_expression(expr_str, expr, 21)

# iex(7)> ~C(Unescaped sigil #{3 + 0.14})
# ~c"Unescaped sigil \#{3 + 0.14}"

expr = ~C(Unescaped sigil #{3 + 0.14})
expr_str = "~C(Unescaped sigil #{3 + 0.14})"
Print.print_expression(expr_str, expr, 21)

# iex(8)> '''
# ...(8)> Heredoc
# ...(8)> '''
# ~c"Heredoc\n"

expr = '''
Character list heredoc
'''
IO.puts(expr)

# Character lists aren't compatible with binary strings. Most
# of the operations from the String module won't work with
# character lists. In general, you should prefer binary strings
# over character lists. Occasionally, functions may work only
# with character lists. This mostly happens with pure Erlang
# libraries. In this case, you can convert a binary string to
# a character list version using the String.to_charlist/1
# function:
#
# iex(9)> String.to_charlist("ABC")
# ~c"ABC"
#
# To convert a character list to a binary string, you can use
# List.to_string/1
#
# iex(11)> List.to_string([65, 66, 67])
# "ABC"
#
# In general, you should prefer binary strings as much as
# possible, using character lists only when some third-party
# library (most often written in Erlang) requires it.
