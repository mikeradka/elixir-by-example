# Numbers can be integers or floats, and they work mostly
# as you would expect:
number = 3  # Integer written as numeric
IO.puts("number = 3" <> String.pad_leading(": ", 11) <> to_string(number))

number_hex = 0xFF # Integer written in hex
IO.puts("number_hex = 0xFF" <> String.pad_leading(": ", 4) <> to_string(number_hex))

float = 3.14  # Float
IO.puts("float = 3.14" <> String.pad_leading(": ", 9) <> to_string(float))

float_exp = 1.0e-2
IO.puts("float_exp = 1.0e-2 : " <> to_string(float_exp))
