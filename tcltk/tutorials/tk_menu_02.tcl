

menu .menubar

. config -menu .menubar

foreach m {File Edit Help} {
	set $m [menu .menubar.m$m]
	.menubar add cascade -label $m -menu .menubar.m$m
}

$File add command -label Quit -command exit


