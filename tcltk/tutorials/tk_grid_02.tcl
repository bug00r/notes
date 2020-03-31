# grid sticky

. config -bg white

foreach c {yellow orange red green blue purple} {
	label .l$c -text $c -bg white
	frame .f$c -bg $c -width 100 -height 3
	grid .l$c .f$c
       	grid .l$c -sticky w
	grid .f$c -sticky ns	
}


