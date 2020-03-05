# TK Browser example

switch $tcl_platform(platform) {
	"unix" { set browse(dir) /TEMP }
	"windows" { set browse(dir) /TEMP }
	"macintosh" { set browse(dir) /TEMP }
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


