# Lesson 9

set x 1

# This is a normal way to write a TCL while Loop

while { $x < 5 } {
	puts "x: $x"
	set x [expr { $x + 1 }]
}

# The next example shows the difference between "..." and {...}
# How many times does the following loop run? Why does it not
# print on each pass

set x 0

while "$x < 5" {
	set x [expr { $x + 1 }]
	if { $x > 7 } break
	if "$x > 3" continue
	puts "x is $x"
}

