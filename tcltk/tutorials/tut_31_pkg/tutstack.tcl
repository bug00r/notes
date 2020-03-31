# Lesson 31 package

#register the package

package provide tutstack 1.0
package require Tcl 8.5

# Create Namespace

namespace eval ::tutstack {
	#export commands
	namespace export create destroy push pop peek empty
	
	#set up state
	variable stack
	variable id 0

	#create an ensemble
	namespace ensemble create
}

# create a new stack
proc ::tutstack::create {} {
	variable stack
	variable id

	set token "stack[incr id]"
	set stack($token) [list]
	return $token
}

# destroy a stack
proc ::tutstack::destroy {token} {
	variable stack

	unset stack($token)
}

# Push an element onto a stack
proc ::tutstack::push {token elem} {
	variable stack	

	lappend stack($token) $elem
}

# Check if stack is empty
proc ::tutstack::empty {token} {
	variable stack

	set num [llength $stack($token)]
	return [expr {$num == 0}]
}

# See what is on top of the stack without removing it
proc ::tutstack::peek {token} {
	variable stack

	if {[empty $token]} {
		error "Stack empty"
	}

	return [lindex $stack($token) end]
}

# Remove an Element from the top of the Stack
proc ::tutstack::pop {token} {
	variable stack

	set ret [peek $token]
	set stack($token) [lrange $stack($token) 0 end-1]

	return $ret
}


