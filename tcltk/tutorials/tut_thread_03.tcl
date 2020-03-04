# Lesson Thread 03

package require Thread

puts "*** I am thread [thread::id]"

for {set thread 0} {$thread < 3} {incr thread} {
	set id [thread::create -joinable {
		
		for {set i 0 } {$i < 3} {incr i} {
			after [expr {int(500*rand())}]
			puts "Thread [thread::id] says hello"
		}
	
	}];#thread::create

	puts "*** started thread $id"

	lappend threadids $id
}

puts "*** Existing threads: [thread::names]"

foreach id $threadids {
	thread::join $id
}

puts "*** thats all"

