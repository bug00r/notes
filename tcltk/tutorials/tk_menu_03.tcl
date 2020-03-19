
menu .menubar

. config -menu .menubar

foreach m {File Edit Help} {
	set $m [menu .menubar.m$m]
	.menubar add cascade -label $m -underline 0 -menu .menubar.m$m
}

$File add command -label Quit -underline 0 -command exit

proc MenuChanged {w} {
	puts "Menu $w selection:[$w entrycget active -label]"
}

bind .menubar <<MenuSelect>> {MenuChanged %W}



