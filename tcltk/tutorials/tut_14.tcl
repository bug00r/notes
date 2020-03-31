# Lesson 14

set nestedList {
	{1 2 3}
	{a B C D E F}
	{abc def ghi}
}

puts "The last Element of second sublist is: "
puts "	[lindex $nestedList 1 end]"


set x "a b c d e f g h"
puts "Item at index 2 of the list {$x} is: [lindex $x 2]\n"

set y [split 7/4/1776 "/"]
puts "We celebrate on the [lindex $y 1]'th day of the \
	[lindex $y 0]'th month\n"

set z [list puts "arg 2 is $y"]
puts "A command resembles: $z\n"

set i 0
foreach j $x {
	puts "$j is item number $i in list x"
	incr i
}

set i 0
foreach {a b} $x {
	puts "Pair $i in list x: $a $b"
	incr i
}

