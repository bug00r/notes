proc TextButton { t start end command } {
	global textbutton
	if ![info exists textbutton(uid)] {
		set textbutton(uid) 0
	} else {
		incr textbutton(uid)
	}
	set tag button$textbutton(uid)
	$t tag configure $tag -relief raised -borderwidth 2
	if {[regexp color [winfo visual $t]]} {
		$t tag configure $tag -background thistle
	} else {
		$t tag configure $tag -background [$t cget -fg]
		$t tag configure $tag -foreground [$t cget -bg]
	}

	$t tag bind $tag <Button-1> $command
	$t tag add $tag $start $end

	$t tag bind $tag <Enter> [list TextButtonChangeCursor %W $start $end tcross]
	$t tag bind $tag <Leave> {TextButtonRestoreCursor %W}

}

proc TextButtonChangeCursor { t start end cursor } {
	$t tag add cursor=[$t cget -cursor] $start $end
	$t config -cursor $cursor
}

proc TextButtonRestoreCursor {t} {
	regexp {cursor=([^ ]*)} [$t tag names] x cursor
	$t config -cursor $cursor
}

frame .f
set t [text .f.t -width 100 -height 100 ]

$t insert end "what eh unbelievable fuck fuck off"

TextButton .f.t 0.end 1.end [list puts "What the fuck"]

pack .f .f.t

