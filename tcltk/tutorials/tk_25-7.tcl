# 25-7

frame .menubar -bg white
frame .body -width 150 -height 50 -bg grey50

foreach b {alpha beta} {
	button .menubar.$b -text $b
}

pack .menubar.alpha -side left
pack .menubar.beta -side right

pack .menubar -side top -fill x
pack .body





