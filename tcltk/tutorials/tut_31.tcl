# Lesson 31

# this extends the tcl package script search dio to the tutorial one
lappend auto_path [file join [file dirname [file normalize [info script]]] "tut_31_pkg"]

puts "globals: [info globals]"
puts "lib_path: [info library]"
puts "auto_path: $auto_path"

package require tutstack 1.0

set stack [tutstack create]
foreach num {1 2 3 4 5} { tutstack push $stack $num }

while { ![tutstack empty $stack] } {
	puts "[tutstack::pop $stack]"
}

tutstack destroy $stack


