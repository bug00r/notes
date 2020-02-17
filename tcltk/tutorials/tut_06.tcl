# Lesson 6

set x 100
set y 256
set Z [expr {$x+$y}]
set Z_LABEL "$y plus $x is "
puts "$Z_LABEL $Z"
puts "The square root of $y is [expr { sqrt($y) }]"

puts "Because of the precedence rules \"5 + -3 * 4\"  is:"
puts "\t [expr {-3 * 4 + 5}]"
puts "BEcause of the parentheses\t\"(5 + -3) * 4\" is:"
puts "\t [expr { (5 + -3) * 4 }]"

set a 3
set b 4
puts "The hypotenuse of a triangle: [expr { hypot($a,$b) }] or [expr { sqrt(($a**2 + $b**2)) }]"

#
# The trigonometric functions workwith radians
#

set pi6 [expr {3.1415926/6.0}]
puts "Sine and cosine of pi/6: [expr {sin($pi6)}] [expr {cos($pi6)}]"

#
# Working with Arrays
#

set A(1) 10
set A(2) 7
set A(3) 17
set B 2

puts "Sum: [expr {$A(1)+$A($B)}]"


