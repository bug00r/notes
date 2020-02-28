# Lesson 43 Child interpreter

set i1 [ interp create firstChild ]
set i2 [ interp create secondChild ]

puts "first child interpr: $i1"
puts "second child interp: $i2\n"

# set a variable "name" in each child interp,
# and create a procedure within each interp
# to return that value

foreach int [list $i1 $i2] {
	interp eval $int [list set name $int]
	interp eval $int {proc nameis {} {
		global name
		return "nameis: $name"
	} }
}

foreach int [list $i1 $i2] {
	interp eval $int "puts \"EVAL IN $int: name is \$name\""
	puts "Return from 'nameis' is: [interp eval $int nameis]"
}

# a short program to return the value of "none"

proc rtnName {} {
	global name
	return "rtnName: $name"
}

# alias that procedure to a proc in $i1

interp alias $i1 rtnName {} rtnName

puts ""

# This is an error. The alias causes the evaluation
#  to happen in the {} interpreter, where name is
#  not defined

puts "firstChild reports [interp eval $i1 rtnName]"

