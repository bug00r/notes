# Lesson 30 

set filename "tut_30_mod.tcl"
puts "Global vars visible before sourcing: $filename"
puts "[lsort [info globals]]\n"

if {[info procs testproc] eq ""} {
	puts "testproc does not exist. sourcing $filename"
	source $filename
}

puts "\nNow executing testproc"
testproc

puts "Global vars visible after sourcing $filename"
puts "[lsort [info globals]]\n"

