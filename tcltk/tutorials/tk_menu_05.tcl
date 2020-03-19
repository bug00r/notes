
proc Menu_Setup {menubar} {
	global menu
	menu $menubar
	set top [winfo parent $menubar]
	$top config -menu $menubar
	set menu(menubar) $menubar
	set menu(uid) 0
}

proc Menu {label} {
	global menu
	if [info exists menu(menu,$label)] {
		error "Menu $label already defined"
	}
	set menuName $menu(menubar).mb$menu(uid)
	incr menu(uid)
	menu $menuName -tearoff 1
	$menu(menubar) add cascade -label $label -menu $menuName
	set menu(menu,$label) $menuName
}

proc MenuGet {menuName} {
	global menu
	if [catch {set menu(menu,$menuName)} m] {
		return -code error "No such menu: $menuName"
	}
	return $m
}

proc Menu_Command { menuName label command } {
	set m [MenuGet $menuName]
	$m add command -label $label -command $command
}

proc Menu_Check { menuName label var { command {} } } {
	set m [MenuGet $menuName]
	$m add check -label $label -command $command -variable $var
}

proc Menu_Radio { menuName label var {val {}} {command {}} } {
	set m [MenuGet $menuName]
	if {[string length $val] == 0 } {
		set val $label
	}
	$m add radio -label $label -command $command -value $val \
	-variable $var
}

proc Menu_Separator {menuName} {
	[MenuGet $menuName] add separator
}

proc Menu_Cascade {menuName label} {
	global menu
	set m [MenuGet $menuName]
	if [info exists menu(menu,$label)] {
		error "Menu $label already defined"
	}
	set sub $m.sub$menu(uid)
	incr menu(uid)
	menu $sub -tearoff 0
	$m add cascade -label $label -menu $sub
	set menu(menu,$label) $sub
}

proc Menu_Bind {what sequence accText menuName label} {
	variable menu
	set m [MenuGet $menuName]
	if {[catch {$m index $label} index]} {
		error "$label not in menu $menuName"
	}
	bind $what $sequence [list MenuInvoke $m $index]
	$m entryconfigure $index -accelerator $accText
}

proc MenuInvoke {m index} {
	set state [$m entrycget $index -state]
	if {[string equa $state normal]} {
		$m invoke $index	
	}
}

Menu_Setup .mb
Menu File
Menu_Command File Hello! {puts "Hello, everyone!!"}
Menu_Check File Boolean foo {puts "foo = $foo"}
Menu_Separator File
Menu_Cascade File Options
Menu_Radio Options Level1 lvl
Menu_Radio Options Level2 lvl
Menu_Radio Options Level3 lvl
Menu Edit
Menu Help
Menu About

frame .body -width 100 -height 50
pack .body ; focus .body
Menu_Bind .body <Control-q> Ctrl-Q File Hello!

