# Lesson 27

proc nitpickyIncr { var { amount 1}} {
	upvar $var v
	if { [info exists v] } {
		incr v $amount
	} else {
		return -code error "Variable $var does not exist!"
	}
}	


# use the catch command to prvent the program from ending
# prematurely, and demonstrate a simple ise of [info procs]

if { [info procs nitpickyIncr] eq "nitpickyIncr" } {
	catch {
		nitpickyIncr a
	} msg
} else {
	puts "Please define the proc 'nitpickyIncr'"
}

puts "After calling nitpickyIncr with a non existent variable:"
puts "$msg"

set a 100
nitpickyIncr a
puts "After calling nitpickyIncr with a variable with"
puts "a value of 100: $a"

catch {
	nitpickyIncr b -3
} msg
puts "After calling nitpickyIncr with a non existent var"
puts "by -3: $msg"

puts "\nThese vars have been defined:\n[lsort [info vars]]"
puts "\nThese globals have been defined:\n[lsort [info globals]]"

set exist [info procs localproc]
if {$exist == ""} {
	puts "\nlocalproc does not exist at point 1"
}

proc localproc {} {
	global argv

	set loc1 1
	set loc2 2
	puts "\nLocal vars accessible in this proc are:"
	puts "	[lsort [info locals]]"
	puts "\nVars accessible from this proc are:"
	puts "	[lsort [info vars]]"
	puts "\nGlobal vars visible from this proc are:"
	puts "	[lsort [info globals]]"
}

set exist [info procs localproc]
if { $exist != "" } {
	puts "localproc does exist at point 2"
}

localproc


