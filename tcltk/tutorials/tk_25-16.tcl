# 25-16

. config -bg black


frame .prop -bg white -height 80 -width 20
frame .base -width 120 -height 20 -bg grey50

pack .base -side bottom
label .foo -text Foo

pack .prop -side right -expand true -anchor sw
pack .foo -side right -expand true -anchor ne

foreach anchor {center n ne e se s sw w nw center} {
	pack .foo .prop -anchor $anchor
	update idletasks
	after 500
}





