# grid 09

. config -bg black

label .f1 -text "left side" -bg #ccc
label .f2 -text "right side" -bg #aaa

grid .f1 .f2 -sticky news ;# no padding
grid .f1 -padx 10 -pady 10 ;# cell padding
grid rowconfigure . 0 -pad 20 ;#row padding




