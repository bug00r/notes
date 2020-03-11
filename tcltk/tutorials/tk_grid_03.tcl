# grid 03

. config -bg white

set row 0

foreach c {purple green blue orange yellow red} {
	label .l$c -text $c -bg white
	frame .f$c -bg $c -width 100
       	grid .l$c -row $row -column 0 -sticky w
	grid .f$c -row $row -column 1 -sticky ns
	incr row	
}

