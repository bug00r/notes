
set appdefaults tk_res_01.res

if [file exists $appdefaults] {
	if [catch {option readfile $appdefaults startup} err] {
		puts stderr "error in $appdefaults: $err"
	}
} else {
	puts "$appdefaults not exist?!"
}

option add *foreground red
option add *selectBackground #bfdfff

#option clear

frame .f -width 100 -height 50 -padx 5 -pady 5 -bg white
button .f.b -text test
pack .f .f.b -side top

frame .user2 -class User
button .user2.btn -text UserButton
pack .user2 .user2.btn -side top

proc Resource_ButtonFrame {f class} {
	frame $f -class $class -borderwidth 2
	pack $f -side top -fill x
	foreach b [option get $f buttonlist {}] {
		if [catch {button $f.$b}] {
			button $f.$b -font fixed
		}
		pack $f.$b -side right
	}

}

Resource_ButtonFrame .user User


