
source scrolled_canvas.tcl

proc CanvasHello {} {
	set can [Scrolled_Canvas .c -width 400 -height 100 \
		-scrollregion {0 0 800 400}]
	pack .c -fill both -expand true

	$can create text 50 50 -text "Hello, World!!" -tag movable

	$can bind movable <Button-1> {CanvasMark %x %y %W}
	$can bind movable <B1-Motion> {CanvasDrag %x %y %W}

	$can create rect 10 10 30 30 -fill red -tag movable
	$can create line 1 1 40 40 90 60 -width 2 -tag movable
	$can create poly 1 1 40 40 90 60 -fill blue -tag movable
}

CanvasHello
