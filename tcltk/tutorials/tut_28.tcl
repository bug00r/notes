# Lesson 28

puts "Number of commands that have been executed: [info cmdcount]"
puts "Now THIS many commands have been executed: [info cmdcount]"

puts "\nThis Interpreter is revision level: [info tclversion]"
puts "This interpreter is at patch level: [info patchlevel]"

puts "The process id for this program is [pid]"

proc factorial {val} {
	puts "Current Level: [info level] - val: $val"
	set lvl [info level]
	if { $lvl == $val } {
		return $val
	}
	return [expr {($val-$lvl) * [factorial $val]}]
}

set count1 [info cmdcount]
set fact [factorial 3]
set count2 [info cmdcount]

puts "The factorial of 3 is $fact"
puts "Before calling facorial proc, $count1 commands run"
puts "After calling, $count2 commands run"
puts "It took [expr {$count2 - $count1}] commands for factorial"

# use [info script] to determine where the other files of interest
# reside

set sysdir [file dirname [info script]]
set source [file join $sysdir "utils.tcl"]
puts "Source: $source"




