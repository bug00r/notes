proc Scroll_Set {scrollbar geoCmd offset size} {
	if {$offset != 0.0 || $size != 1.0 } {
		eval $geoCmd; # Make sure if it visible
	}
	$scrollbar set $offset $size
}


proc Scrolled_Listbox {f args} {
	frame $f
	listbox $f.list -xscrollcommand [list Scroll_Set $f.xscroll \
	[list grid $f.xscroll -row 1 -column 0 -sticky we]] \
	-yscrollcommand [list Scroll_Set $f.yscroll \
	[list grid $f.yscroll -row 0 -column 1 -sticky ns]]

	eval {$f.list configure} $args

	scrollbar $f.xscroll -orient horizontal -command [list $f.list xview]
	scrollbar $f.yscroll -orient vertical -command [list $f.list yview]

	grid $f.list -sticky news
	grid rowconfigure $f 0 -weight 1
	grid columnconfigure $f 0 -weight 1
	return $f.list
}

set l [Scrolled_Listbox .f -listvariable fonts]
pack .f -expand yes -fill both
set fonts [lsort -dictionary [font families]]


