# Numbers can be integers or floats, and they work mostly
# as you would expect:
number = 3  # Integer written as numeric
IO.puts("number = 3" <> String.pad_leading(": ", 11) <> to_string(number))

number_hex = 0xFF # Integer written in hex
IO.puts("number_hex = 0xFF" <> String.pad_leading(": ", 4) <> to_string(number_hex))

float = 3.14  # Float
IO.puts("float = 3.14" <> String.pad_leading(": ", 9) <> to_string(float))

float_exp = 1.0e-2  # Float, exponential notation
IO.puts("float_exp = 1.0e-2 : " <> to_string(float_exp))

# standard arithmetic operators are supported:
# 1 + 2 * 3
IO.puts("1 + 2 * 3" <> String.pad_leading(": ", 12) <> to_string(1 + 2 * 3))

# The division operator always returns a float value
IO.puts("4 / 2" <> String.pad_leading(": ", 16) <> to_string(4 / 2))
IO.puts("3 / 2" <> String.pad_leading(": ", 16) <> to_string(3 / 2))

# To perform integer division, use the div/2 Kernel function
expr = div(5, 2)
result = to_string(expr)
expr_str = "div(5, 2)"
pad = String.pad_leading(": ", 12)
IO.puts(expr_str <> pad <> result)

# To calculate the remainder, use the rem/2 Kernel function
expr = rem(5, 2)
result = to_string(expr)
expr_str = "rem(5, 2)"
IO.puts(expr_str <> pad <> result)
