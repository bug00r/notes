# Lesson Threads 02

package require Thread

puts "*** I' thread [thread::id]"

#create 3 Threads

for {set thread 1} { $thread <= 3 } { incr thread} {
	set id [thread::create {
	
		#print a hello message 3 times,
		#waiting a random amount of time between
		#messages

		for {set i 1} {$i <= 3} {incr i} {
			after [expr { int(500*rand())}]
			puts "Thread [thread::id] says hello"
		}

	}];# thread::create

	puts "*** Started thread $id"
};# for

puts "*** Existing Threads: [thread::names]"

# Wait until all other threads are finished

while { [llength [thread::names]] > 1 } {
	after 500
}

puts "*** That's all, folks!"



