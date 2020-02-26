# Lesson 33

set cmd "OK"
eval puts $cmd

set cmd "puts"; lappend cmd {Also OK}; eval $cmd

set cmd "NOT OK"
#eval puts $cmd

eval [format {%s "%s"} puts "Even this works"]

set cmd "And even this can made to work"

eval [format {%s "%s"} puts $cmd]

set tmpFileNum 0;

set cmd {proc tempFileName }
lappend cmd ""
lappend cmd "global num; incr num
lappend cmd return \"/tmp/TMP.[pid].\$num\""
eval $cmd

puts "\nThis is the body of the proc definition:"
puts "[info body tempFileName]"


set cmd {puts "This is cool!}

if {[info complete $cmd]} {
	eval $cmd
} else {
	puts "Incomplete Command: $cmd"
}

