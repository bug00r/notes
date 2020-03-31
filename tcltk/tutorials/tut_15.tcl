# Lesson 15

set b [ list a b {c d e} { f { g h }} ]
puts "Treated as a list: $b"
puts "lindex test should be 'e': [lindex $b 2 2]"
puts "lindex test should be 'g': [lindex $b 3 1 0]"

set b [split "a b {c d e} {f {g h}}"]
puts "Transformed by split: $b"
puts "lindex test should be 'e': [lindex $b 2]"
puts "lindex test should be 'g': [lindex $b 3]"

set a [concat a b {c d e} {f {g h}}]
puts "concated: $a\n"
puts "lindex test should be 'c': [lindex $a 2]"
puts "lindex test should be 'g': [lindex $a 6 0]"

lappend a {ij k lm}
puts "After appending: $a\n"; #Note: {ij k lm} is a single element

set b [linsert $a 3 "1 2 3"]; # "1 2 3" is a single element
puts "After linsert at pos 3: $b\n"

set b [lreplace $b 3 5 "AA" "BB"]
puts "After lreplace 3 positions with 2 values at position 3:"
puts "	$b\n"

