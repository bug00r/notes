# 25-10

. config -borderwidth 10

frame .ok -borderwidth 2 -relief sunken
button .ok.b -text OK
pack .ok.b -padx 5 -pady 5

button .cancel -text Cancel
pack .ok .cancel -side left -padx 5 -pady {5 10}




