
#797

proc Scale2 { w min max {width {}}} {
	global scale2
	if {$width == {}} {
		set width [expr {$max - $min}]
	}

	set scale2($w,scale) [expr ($max-$min)/$width.0]	
	set scale2($w,min) $min;# Current minimum

	set scale2($w,max) $max
	set scale2($w,Min) $min;# lower bound to the scale
	set scale2($w,Max) $max
	set scale2($w,L) 10
	set scale2($w,R) [expr {$width + 10}]

	canvas $w
	$w create rect 0 0 110 10 -fill grey -tag slider
	$w create rect 0 -4 10 10 -fill black -tag {left lbox}
	$w create rect 100 0 110 14 -fill red -tag {right rbox}
	$w create text 5 16 -anchor n -text $min -tag {left lnum}
	$w create text 105 16 -anchor n -text $max -tag {right rnum} -fill red

	set scale [expr {($width+10) / 110.0}]
	$w scale slider 0 0 $scale 1.0
	
	set nx [lindex [$w coords slider] 2] 
	$w move right [expr $nx-110] 0
	$w move all 10 10

	set bbox [$w bbox all]
	set height [expr {[lindex $bbox 3]+4}]
	$w config -height $height -width [expr { $width + 30 }]

	$w bind left <Button-1> {Scale2Mark %W %x lbox}
	$w bind right <Button-1> {Scale2Mark %W %x rbox}
	$w bind left <B1-Motion> {Scale2Drag %W %x lbox}
        $w bind right <B1-Motion> {Scale2Drag %W %x rbox}	
}

proc Scale2Mark { w x what } {
	global scale2
	set scale2($w,$what) $x
}

proc Scale2Drag { w x what } {
	global scale2

	set x1 $scale2($w,$what)
	set scale2($w,$what) $x
	set dx [expr {$x-$x1}]

	set rx [lindex [$w coords rbox] 0]
	set lx [lindex [$w coords lbox] 0]

	if {$what == "lbox"} {
		if {$lx + $dx > $rx} {
			set dx [expr {$rx-$lx}]
			set scale2($w,$what) $rx
		} elseif {$lx + $dx < $scale2($w,L)} {
			set dx [expr {$scale2($w,L) - $lx}]
			set scale2($w,$what) $scale2($w,L)
		}
		$w move left $dx 0

		set lx [lindex [$w coords lbox] 0]
		set scale2($w,min) [expr { int($scale2($w,Min) + ($lx-$scale2($w,L)) * \
		       $scale2($w,scale))}]
	      	$w itemconfigure lnum -text $scale2($w,min) 
	} else {
		if { $rx + $dx < $lx } {
			set dx [expr {$lx-$rx}]
			set scale2($w,$what) $lx
		} elseif {$rx + $dx > $scale2($w,R)} {
			set dx [expr $scale2($w,R) - $rx]
			set scale2($w,$what) $scale2($w,R)
		}
		$w move right $dx 0

		set rx [lindex [$w coords right] 0]
		set scale2($w,max) [expr {int( $scale2($w,Min) + ($rx-$scale2($w,L)) * \
		       $scale2($w,scale))}]
	       	$w itemconfigure rnum -text $scale2($w,max)
	}
}

proc Scale2Value {w} {
	global scale2
	return [list $scale2($w,min) $scale2($w,max)]
}

frame .f
Scale2 .f.blubb 10 100 100
pack .f  .f.blubb -expand true -fill both
