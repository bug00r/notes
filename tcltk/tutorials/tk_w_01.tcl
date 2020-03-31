
labelframe .s -text Sizes
radiobutton .s.small -text Small -variable size -value small
radiobutton .s.med -text Medium -variable size -value medium
radiobutton .s.large -text Large -variable size -value large
.s.large select


label .l -bitmap question
.s configure -labelwidget .l -labelanchor wn


pack .s.small .s.med .s.large -anchor w -padx 2 -pady 1
pack .s

