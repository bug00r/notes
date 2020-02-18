# Lesson 11

proc sum {arg1 arg2} {
	set x [expr {$arg1 + $arg2}]
	return $x
}

proc sum1 { arg1 arg2 } {
	set x [expr {$arg1 + $arg2}]
}

proc sum2 { arg1 arg2 } {
	expr {$arg1 + $arg2}
}

puts "sum 2 + 3: [sum 2 3]"
puts "sum1 2 + 3: [sum1 2 3]"
puts "sum2 2 + 3: [sum2 2 3]"


#This is also possible maybe for debugging
proc for {a b c} {
	puts "The for comman has been replaced by a puts"
	puts "The arguments were: $a\n$b\n$c\n"
}

for { set i 1 } { $i < 10 } { incr i }
