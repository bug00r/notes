# grid 05

. config -bg white

foreach c { orange red purple blue yellow green } {
	label .l$c -text $c -bg white
	frame .f$c -bg $c -width 100 -height 3
	grid .l$c .f$c
	grid .l$c -sticky w -padx 3 -ipady 5
	grid .f$c -sticky ns -pady 1
}




