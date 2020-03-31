# Grid 6

set i 0
foreach x {news ns ew " " new sew wsn esn nw ne sw se n s w e} {
	frame .f$x -borderwidth 2 -relief ridge -width 40 -height 40
	grid .f$x -sticky news \
		-row [expr {$i/4}] -column [expr {$i%4}]
	label .l$x -text $x -bg white
	grid .l$x -sticky $x -padx 2 -pady 2 \
		-row [expr {$i/4}] -column [expr {$i%4}]
	incr i
}




