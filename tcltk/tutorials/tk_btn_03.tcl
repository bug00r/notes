proc LessTrouble {args} {
	set b 0
	label .label -textvariable x
	set f [frame .buttons -borderwidth 10]
	foreach val $args {
		button $f.$b -text $val -command [list UpdateX x $val]
		pack $f.$b -side left
		incr b
	}
	pack .label $f
}

proc UpdateX {varname val} {
	upvar #0 $varname x
	set x [expr $x * $val]
}

set x 1
LessTrouble -1 4 16 36


