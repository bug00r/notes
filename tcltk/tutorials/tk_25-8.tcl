# 25-8

frame .menubar -bg white
frame .body -width 150 -height 50 -bg grey50

foreach b {alpha beta} {
	button .menubar.$b -text $b
}

pack .menubar.alpha -side left -ipady 10
pack .menubar.beta -side right -ipadx 10

pack .menubar -side top -fill x -ipady 5
pack .body





