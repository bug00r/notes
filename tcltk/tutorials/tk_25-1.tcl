# 25-1 and 25-2 example

. config -bg black

frame .one -width 40 -height 40 -bg white
frame .two -width 100 -height 50 -bg grey50

#true = fit window to needed size
#false = don't fit window
pack propagate . false
pack .one .two -side top





