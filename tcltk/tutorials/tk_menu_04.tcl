
proc Menu_Setup {menubar} {
	global menu
	frame $menubar
	pack $menubar -side top -fill x
	set menu(menubar) $menubar
	set menu(uid) 0
}

proc Menu {label} {
	global menu
	if [info exists menu(menu,$label)] {
		error "enu $label already defined"
	}

	set name $menu(menubar).mb$menu(uid)
	set menuName $name.menu
	incr menu(uid)
	set mb [menubutton $name -text $label -menu $menuName]
	pack $mb -side left
	menu $menuName -tearoff 1
	set menu(menu,$label) $menuName
}

Menu_Setup .mb
Menu test
Menu test2
Menu Test3


