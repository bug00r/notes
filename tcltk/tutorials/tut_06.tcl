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

puts "1/2 [expr {1/2}]"
puts "-1/2 [expr {-1/2}]"
puts "-1./2 [expr {-1./2}]"
puts "1/2 [expr {1./2}]"
puts "1/3 [expr {1./3}]"
puts "1/3 [expr {double(1)/3}]"

puts {Some Examples on Floating Point numbers:}

puts "1/2 : [expr {1./2}]"
puts "1/3 : [expr {1./3}]"

set aa [expr {1.0/3.0}]
puts "3*(1/3) : [expr {3*$aa}]"

set bb [expr {10.3/3.0}]
puts "3*(10/3) : [expr {3.0*$bb}]"

set cc [expr {10.0/3.0}]
set dd [expr {2.0/3.0}]
puts "(10.0/3.0) / (2.0/3.0): [expr {$cc/$dd}]"

set ee [expr {1.0/10.0}]
puts "1.2 / 0.1 : [expr {1.2/$ee}]"


#
# The wrong Way
#

set number [expr {int(1.2/0.1)}] ;# Force an Integer - 
				 ;# accidentally number = 11

for { set i 0 } { $i <= $number } { incr i } {
	set x [expr {$i*0.1}]
	puts "$x"
}

#
# A right Way
#

set xx 0.0
set delta 0.1

while { $xx < 1.2+0.5*$delta } {
	set xx [expr {$xx + $delta}]
	puts $xx
}

#
# Two different estimates of "pi"
#

set pi1 [expr {4.0*atan(1.0)}]
set pi2 [expr {6.0*asin(0.5)}]
puts [expr {$pi1-$pi2}]


