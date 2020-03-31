# 25-17

foreach label {one two three four five} {
	label .$label -text $label
	pack .$label -side left -padx 5
}

proc ShuffleUp { parent child } {
	set first [lindex [pack slaves $parent] 0]
	pack $child -in $parent -before $first
}

proc ShuffleDown { parent child } {
	pack $child -in $parent
}

ShuffleUp . .five
ShuffleDown . .three


