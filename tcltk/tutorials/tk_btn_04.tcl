
proc MaxLineLength {file} {
	set max 0
	if [catch {open $file} in] {
		return $in
	}

	foreach line [split [read $in] \n] {
		set len [string length $line]
		if {$len > $max} {
			set max $len
		}
	}

	return "Longest line is $max chars"
}

proc DoIt {} {
	.label config -text [MaxLineLength [.e get]]
}

. config -borderwidth 10
entry .e -width 30 -bg white -relief sunken
bind .e <Return> DoIt

button .doit -text "Manx Line Length" -command DoIt


label .label -text "Enter File Name"
pack .e .doit .label -side top -pady 5

