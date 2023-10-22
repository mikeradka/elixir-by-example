# TUPLES
# Tuples are like untypes structures, or records.
# Tuples are most often used to group a fixed number
# of elements together.
#
# iex(1)> person = {"Bob", 25}
# {"Bob", 25}
person = {"Bob", 25}
person_str = "person = {\"Bob\", 25}"
IO.puts(person_str)

# To extract an element from a tuple, you can use
# the Kernel.elem/2 function, which accepts a tuple
# and the zero-based index of the element.
#
# iex(2)> age = elem(person, 1)
# 25
age = elem(person, 1)
age_str = "age = elem(person, 1)"
pad = String.pad_leading(" : ", 5)
IO.puts(age_str <> pad <> to_string(age))

# To modify an element of the tuple, you can use the
# Kernel.put_elem/3 function, which accepts a tuple,
# a zero-based index, and the new value of the field
# in the given position:
#
# iex(3)> put_elem(person, 1, 26)
# {"Bob", 26}
#
# The function put_elem doesn't modify the tuple. It
# returns the new version, keeping the old one intact.
# Since data in Elixir is immutable, you can't do an
# in-memory modification of a value. You can verify that
# the previous call to put_elem didn't change the person
# variable:
#
# iex(4)> person
# {"Bob", 25}
#
# So in order to use the put_elem function, you need to
# store its result in another variable:
#
# iex(5)> older_person = put_elem(person, 1, 26)
# {"Bob", 26}
# iex(6)> older_person
# {"Bob", 26}
# iex(7)> person
# {"Bob", 25}
older_person = put_elem(person, 1, 26)
older_person_str = "put_elem(person, 1, 26)"
older_person_insp = inspect(older_person)
older_person_insp_str = to_string(older_person_insp)
pad = String.pad_leading(" : ", 0)
IO.puts(older_person_str <> pad <> older_person_insp_str)
#
# Since variables can be rebound, you can also do this:
#
# iex(8)> person = put_elem(person, 1, 26)
# {"Bob", 26}
# iex(9)> person
# {"Bob", 26}
person  = put_elem(person, 1, 26)
person_str = "put_elem(person, 5, 26)"
person_insp = inspect(person)
person_insp_str = to_string(person_insp)
pad = String.pad_leading(" : ", 3)
IO.puts(person_str <> pad <> person_insp_str)
#
# By doing this, you've effectively rebound the person variable
# to the new memory location. The old location isn't referenced
# by any other variable, so it's eligible for garbage collection.
#
# Tuples are most approriate for grouping a small, fixed number
# of elements together. For a dynamically sized collection,
# you can use lists instead.
