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
