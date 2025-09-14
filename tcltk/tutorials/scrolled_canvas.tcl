

proc Scrolled_Canvas { c args } {
	frame $c

	eval {canvas $c.canvas -xscrollcommand [list $c.xscroll set] \
      	-yscrollcommand [list $c.yscroll set] -highlightthickness 0 -borderwidth 0} $args

	scrollbar $c.xscroll -orient horizontal -command [list $c.canvas xview]
	scrollbar $c.yscroll -orient vertical -command [list $c.canvas yview]

	grid $c.canvas $c.yscroll -sticky news
	grid $c.xscroll -sticky news
	grid rowconfigure $c 0 -weight 1
	grid columnconfigure $c 0 -weight 1

	return $c.canvas
}

proc CanvasMark { x y can } {
	global canvas
	#map rfom view coordinates to canvas coordinates
	set x [$can canvasx $x]
	set y [$can canvasy $y]
	#remember the object and its location
	set canvas($can,obj) [$can find closest $x $y]
	set canvas($can,x) $x
	set canvas($can,y) $y
}

proc CanvasDrag {x y can} {
	global canvas
	set x [$can canvasx $x]
	set y [$can canvasy $y]
	set dx [expr {$x - $canvas($can,x)}]
	set dy [expr {$y - $canvas($can,y)}]
	$can move $canvas($can,obj) $dx $dy
	set canvas($can,x) $x
	set canvas($can,y) $y
}


