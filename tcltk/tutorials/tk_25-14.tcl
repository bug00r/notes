# 25-14

. config -bg black
# frames to hold open the cavity
frame .prop -bg white -height 80 -width 20
frame .base -width 120 -height 20 -bg grey50
pack .base -side bottom

#floating a label
label .foo -text Foo
pack .prop .foo -side right -expand true






