# 25-11

. config -bg black

frame .menubar -bg white
frame .body -width 150 -height 50 -bg grey50

foreach b { alpha beta} {
	button .menubar.$b -text $b
}

pack .menubar.alpha -side left
pack .menubar.beta -side right

#this shares size vertically
#pack .menubar -expand true -fill x

#this makes menu stay on top
pack .menubar -side top -fill x

pack .body -expand true -fill both

#resizing main window
wm geometry . 200x100

# allow interactive resizing
wm minsize . 100 50



