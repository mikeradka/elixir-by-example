"
OPERATORS

Most of the operators in Elixir are defined in the Kernel module, and you
can refer to the module documentation for a detailed description of them.

ARITHMETIC OPERATORS
  + (add)
  - (subtract)
  * (multiply)
  / (divide. The division operator always returns a float)

COMPARISON OPERATORS
  ===, !==      Strict equality/inequality
  ==, !=        Weak equality/inequality
  <, >, ≤, ≥    Less-than, greater-than, less-then-or-equal, greater-than-or-equal

The difference between strict and weak equality is relevant only when comparing
integers to floats:

  iex(1)> 1 == 1.0    # Weak equality
  true
  iex(2)> 1 === 1.0   # Strict equality
  false
  "
|> IO.puts()
