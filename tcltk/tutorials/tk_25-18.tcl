# 25-18

. config -bg black

frame .one -bg white
frame .two -width 100 -height 50 -bg grey50

foreach b {alpha beta} {
	button .$b -text $b
	pack .$b -in .one -side left
}

frame .one.right
foreach b {delta epsilon} {
	button .$b -text $b
	pack .$b -in .one.right -side bottom
}

pack .one.right -side right
pack .one .two -side top

#obscuring button
button .a -text hello
frame .b
pack .a -in .b
pack .b -side top

#comment the next line and you won't see the button hello
raise .a

