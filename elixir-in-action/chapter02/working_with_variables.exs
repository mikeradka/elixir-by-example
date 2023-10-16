# Elixir is a dynamic programming language
# which means that you don't explicitly declare
# a variable or its type. Instead, the variable
# type is determined by whatever data it contains
# at the moment. In elixir, variable assignment
# is called 'binding'. When you initialize
# a variable with a value, the variable is bound
# to that value:

monthly_salary = 1000
IO.puts("monthly_salary: " <> to_string(monthly_salary))

# Variables can be used in complex expressions
times_twelve = monthly_salary * 12
IO.puts("monthly_salary * 12 = " <> to_string(times_twelve))

# Variables can be rebound to a different value:
monthly_salary = 1000
IO.puts("monthly_salary: " <> to_string(monthly_salary))
monthly_salary = 11000
IO.puts("rebound monthly_salary: " <> to_string(monthly_salary))

# Rebinding a variable doesn't mutate the existing memory location
# It reserves the new memory and reassignes the
# symbolic name to the new location.
# Elixir is a garbage-collected language, which means
# that you don't have to manually release memory.
