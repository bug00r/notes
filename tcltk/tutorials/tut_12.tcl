# Lesson 12

proc show_a_list {args} {
	set n 0
	foreach arg $args {
		puts "arg $n: $arg"
		incr n
	}
}

show_a_list A B C D E F
puts ""
show_a_list G H I J

proc example {first {second ""} args} {
	if {$second eq ""} {
		puts "There is only one argument and it is: $first"
		return 1
	} else {
		if {$args eq ""} {
			puts "There are two arguments - $first and $second"
			return 2
		} else {
			puts "there are many args:\n$first and $second and $args"
			return "many"
		}
	}
}

set count1 [example ONE]
set count2 [example ONE TWO]
set count3 [example ONE TWO THREE]
set count4 [example ONE TWO THREE FOUR]

puts "The Example was caled with a varying number of arguments:"
puts "	$count1, $count2, $count3 and $count4"

