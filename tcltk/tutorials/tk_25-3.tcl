# 25-3

frame .one -bg white
frame .two -width 100 -height 50 -bg grey50

# buttons
foreach b {alpha beta gamma} {
	button .one.$b -text $b
	pack .one.$b -side left
}

pack .one .two -side top












