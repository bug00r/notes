
source scrolled_canvas.tcl

proc CanvasHello {} {
	set can [Scrolled_Canvas .c -width 400 -height 100 \
		-scrollregion {0 0 800 400}]
	pack .c -fill both -expand true

	$can create text 50 50 -text "Hello, World!!" -tag movable

	$can bind movable <Button-1> {CanvasMark %x %y %W}
	$can bind movable <B1-Motion> {CanvasDrag %x %y %W}
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

CanvasHello
