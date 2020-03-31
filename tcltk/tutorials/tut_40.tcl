#Lesson 40

#auxiliary procs

proc serverOpen {channel addr port} {
	global connected
	set connected 1
	fileevent $channel readable [list readLine Server $channel]
	puts "OPENED"
}

proc readLine { who channel } {
	global didRead
	if { [gets $channel line] < 0 } {
		fileevent $channel readable {}
		after idle "close $channel;set out 1"
	} else {
		puts "Read Line: $line"
		puts $channel "This is a return"
		flush $channel
		set didRead 1
	}
}

set connected 0
set server [socket -server serverOpen 33000]

after 100 update

set sock [socket -async 127.0.0.1 33000]
vwait connected

puts $sock "A Test Line"
flush $sock

vwait didRead

set len [gets $sock line]
puts "Return Line: $len -- $line"

catch {close $sock}
vwait out

close $server


