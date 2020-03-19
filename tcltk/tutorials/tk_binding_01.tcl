
frame .one -width 30 -height 30
frame .two -width 30 -height 30

bind Frame <Enter> {%W config -bg red}
bind Frame <Leave> {%W config -bg white}

bind .two <Button> {puts "Button %b at %x %y"}

pack .one .two -side left

bind all <Control-c> {destroy %W}
bind all <Enter> {focus %W}


