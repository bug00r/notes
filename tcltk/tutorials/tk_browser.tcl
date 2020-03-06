# TK Browser example

# Example 1-1 test1 
# Example 1-2 test2
# Example 2-3 test3
# Example 2-4 test4
# Example 3-5 test5
# Example 3-6 test6
# Example 4-7 test1
# Example 4-1 test1 
# Example 5-2 test1
# Example 5-3 test1
# Example 6-4 test1
# Example 6-5 test1
# Example 7-6 test1
# Example 7-7 test1
# Example 8-1 test1
# Example 8-2 test1
# Example 9-3 test1
# Example 9-4 test1
# Example 10-5 test1
# Example 10-6 test1
# Example 10-7 test1


proc Scrolled_Text { f args } {
	frame $f
	eval { text $f.text -wrap none \
       	       -xscrollcommand [list $f.xscroll set] \
	       -yscrollcommand [list $f.yscroll set]} $args
	scrollbar $f.xscroll -orient horizontal -command [list $f.text xview]
	scrollbar $f.yscroll -orient vertical -command [list $f.text yview]
	grid $f.text $f.yscroll -sticky news
	grid $f.yscroll -sticky news
	grid rowconfigure $f 0 -weight 1
	grid columnconfigure $f 0 -weight 1
	return $f.text
}

switch $tcl_platform(platform) {
	"unix" { set browse(dir) . }
	"windows" { set browse(dir) . }
	"macintosh" { set browse(dir) . }
}

wm minsize . 30 5
wm title . "Tcl Example Browser"

#create a row of buttons alson the top

set f [frame .menubar]
pack $f -fill x
button $f.quit -text Quit -command exit
button $f.next -text Next -command Next
button $f.prev -text Previous -command Previous

# run and reset button use eval echo

button $f.load -text Run -command Run
button $f.reset -text Reset -command Reset
pack $f.quit $f.reset $f.load $f.next $f.prev -side right

# a label identifies current example

label $f.label -textvariable browse(current)
pack $f.label -side right -fill x -expand true

# menu
menubutton $f.ex -text Examples -menu $f.ex.m
pack $f.ex -side left
set m [menu $f.ex.m]

#text for example
set browse(text) [Scrolled_Text .body -width 80 -height 10 -setgrid true]
pack .body -fill both -expand true

foreach f [lsort -dictionary [glob [file join $browse(dir) *]]] {
	if [catch {open $f} in] {
		puts stderr "Cannot open $f: $in"
		continue
	}
	while {[gets $in line] >= 0} {
		if [regexp {^# Example ([0-9]+)-([0-9]+)} $line x chap ex] {
			lappend examples($chap) $ex
			lappend browse(list) $f
			#read file
			gets $in line
			set title($chap-$ex) [string trim $line "# "]
			set file($chap-$ex) $f
			close $in
			break
		}
	}

}

#create menüs
option add *Menu.tearOff 0
set limit 8
set c 0; set i 0

foreach chap [ lsort -integer [array names examples] ] {
	if { $i == 0 } {
		$m add cascade -label "Chapter $chap..." -menu $m.$c
		set sub1 [menu $m.$c]
		incr c
	}
	set i [expr { ($i + 1) % $limit }]
	$sub1 add cascade -label "Chapter $chap" -menu $sub1.sub$i
	set sub2 [menu $sub1.sub$i]

	foreach ex [lsort -integer $examples($chap)] {
		$sub2 add command -label "$chap-$ex $title($chap-$ex)" \
			-command [list Browse $file($chap-$ex)]
	}

}

# display file

proc Browse { file } {
	global browse
	set browse(current) [file tail $file]
	set browse(curix) [lsearch $browse(list) $file]
	set t $browse(text)
	$t config -state normal
	$t delete 1.0 end
	if [catch {open $file} in] {
		$t insert end $in
	} else {
		$t insert end [read $in]
		close $in
	}
	$t config -state disabled
}

set browse(curix) -1
proc Next {} {
	global browse
	if {$browse(curix) < [llength $browse(list)] - 1} {
		incr browse(curix)
	}
	Browse [lindex $browse(list) $browse(curix)]
}

proc Previous {} {
	global browse
	if {$browse(curix) > 0} {
		incr browse(curix) -1
	}
	Browse [lindex $browse(list) $browse(curix)]
}

proc Run {} {
	global browse
	EvalEcho [list source [file join $browse(dir) $browse(current)]]
}

proc Reset {} {
	EvalEcho reset
}

#THIS WAS DONE BY PAGE 571

