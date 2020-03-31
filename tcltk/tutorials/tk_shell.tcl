# A TCL Shell

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


set t [Scrolled_Text .eval -width 80 -height 10]
pack .eval -fill both -expand true

# Text tags give script output, errors, command, command errors
# results and the prompt a different apperance

$t tag configure prompt -underline true
$t tag configure result -foreground purple
$t tag configure error -foreground red
$t tag configure output -foreground blue

# insert prompt and init

set eval(prompt) "tcl> "
$t insert insert $eval(prompt) prompt
$t mark set limit insert
$t mark gravity limit left
focus $t
set eval(text) $t

# key bindings

bind $t <Return> {EvalTypein ; break}
bind $t <BackSpace> {
	if {[%W tag nextrange sel 1.0 end] != ""} {
		%W delete sel.first sel.last
	} elseif {[ %W compare insert > limit ]} {
		%W delete insert-1c
		%W see insert
	}
	break
}
bind $t <Key> {
	if [%W compare insert < limit] {
		%W mark set insert end
	}
}

# Eval everything between limit and end as a tcl command
proc EvalTypein {} {
	global eval
	$eval(text) insert insert \n
	set command [$eval(text) get limit end]
	if [info complete $command] {
		$eval(text) mark set limit insert
		Eval $command
	}
}


# Echo the comman and evaluate it
proc EvalEcho {command} {
	global eval
	$eval(text) mark set insert end
	$eval(text) insert insert $comman\n
	Eval $command
}

# Evaluate command an display result
proc Eval {command} {
	global eval
	$eval(text) mark set insert end
	
	if [catch {$eval(slave) eval $command} result] {
		$eval(text) insert insert $result error
	} else {
		$eval(text) insert insert $result result
	}

	if {[$eval(text) compare insert != "insert linestart"]} {
		$eval(text) insert insert \n
	} 

	$eval(text) insert insert $eval(prompt) prompt
	$eval(text) see insert
	$eval(text) mark set limit insert
	return
}

#create and init slave interpreter
proc SlaveInit {slave} {
	interp create $slave
	load {} Tk $slave
	interp alias $slave reset {} ResetAlias $slave
	interp alias $slave puts {} PutsAlias $slave
	return $slave
}

# reset Alias
proc ResetAlias {slave} {
	interp delete $slave
	SlaveInit $slave
}

# puts Alias puts stdout and std err into the text widget
proc PutsAlias {slave args} {
	if {[llength $args] > 3} {
		error "Invalid Arguments"
	}
	set newline "\n"
	if {[string match "-nonewline" [lindex $args 0]]} {
		set newline ""
		set args [lreplace $args 0 0]
	}
	if {[llength $args] == 1} {
		set chan stdout
		set string [lindex $args 1]$newline
	} else {
		set chan [lindex $args 0]
		set string [lindex $args 1]$newline
	}
	if{[regexp (stdout|stderr) $chan]} {
		global eval
		$eval(text) mark gravity limit right
		$eval(text) insert limit $string output
		$eval(text) see limit
		$eval(text) mark gravity limit left
	} else {
		puts -nonewline $chan $string
	}
}

set eval(slave) [SlaveInit shell]











