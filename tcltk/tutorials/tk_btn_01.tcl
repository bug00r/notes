
proc Trouble {args} {
	set b 0
	label .label -textvariable x
	set f [frame .buttons -borderwidth 10]
	foreach val $args {
		button $f.$b -text $val -command "set x \[expr \$x * $val\]"
		pack $f.$b -side left
		incr b
	}
	pack .label $f
}

set x 1
Trouble -1 4 7 39


