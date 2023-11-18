"
An IO list is a special sort of list that's useful for incrementally
building output that will be forwarded to an I/O device, such as a
network or a file. Each element of an IO list must be one of the following:

  - An integer in the range of 0 to 255
  - A binary
  - An IO list

An IO list is a deeply nested structure in which leaf elements are plain
bytes (or binaries, which are also a sequence of bytes). For example, here
is \"Hello word\" represented as a convoluted IO list:
"
|> IO.puts()

~s(iex\(1\)> iolist = [[['H', 'e'], "llo,"], " worl", "d!"]
[[[~c"H", ~c"e"], "llo,"], " worl", "d!"])
|> IO.puts()

"
Notice you can combine character lists and binary strings into a deeply
nested list. Many I/O functions can work directly and efficiently with
such data. For example, you can print this structure to the screen:

iex(2)> IO.puts(iolist)
Hello, world!

Under the hood, the structure is flattened, and you can see the human-
readable output. You'll get the same effect if you send an IO list to
a file or a network socket.
"
|> IO.puts()
