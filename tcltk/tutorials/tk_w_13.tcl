listbox .choices -height 5 -width 20 -listvariable states
pack .choices

lappend states Arizona
lappend states California "New Mexico"


proc Scroll_Set {scrollbar geoCmd offset size} {
	if {$offset != 0.0 || $size != 1.0 } {
		eval $geoCmd	
	}
	$scrollbar set $offset $size
}
       
proc Scrolled_Listbox {f args} {
	frame $f 
	listbox $f.list -xscrollcommand [list Scroll_Set $f.xscroll \
		[list grid $f.xscroll -row 1 -column 0 -sticky we ]] \
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


proc List_Select {parent values} {
	frame $parent
	set choices [Scrolled_Listbox $parent.choices -width 20 -height 5]
	set picked [Scrolled_Listbox $parent.picked -width 20 -height 5]
	pack $parent.choices $parent.picked -side left -expand true -fill both
	bind $choices <ButtonRelease-1> [list ListTransferSel %W $picked]
	bind $picked <ButtonRelease-1> {ListDeleteSel %W %y}
	bind $choices <<ListboxSelect>> {ListboxChanged %W}
	bind $picked <<ListboxSelect>> {ListboxChanged %W}

	foreach x $values {
		$choices insert end $x
	}
}

proc ListTransferSel {src dst} {
	foreach i [$src curselection] {
		$dst insert end [$src get $i]
	}
}

proc ListDeleteSel { w y } {
	foreach i [lsort -integer -decreasing [$w curselection]] {
		$w delete $i
	}
}

proc List_SelectValues {parent} {
	set picked $parent.picked.list
	set result {}
	foreach i [$w curselection] {
		lappend result [$w get $i]
	}
}

proc ListboxChanged {w} {
	puts -nonewline "Listbox $w selection is now: "
	foreach index [$w curselection] {
		puts -nonewline "[$w get $index]"
	}
	puts ""
}

List_Select .f {apples oranges bananas grapes mangos peaches pears}
pack .f -expand true -fill both


