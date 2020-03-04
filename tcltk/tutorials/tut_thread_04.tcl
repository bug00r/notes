# Lesson Threads 04

package require Thread

puts "Thread id: [set t [thread::create]]"

set myX 42

puts "[thread::send $t [list set yourX $myX]]"
puts "[thread::send $t {expr { $yourX / 2 }}]"
#thread::send $t {expr { $yourX / 0 }}
puts "[catch {thread::send $t {expr { $yourX / 0 }}} ret]"
puts "ret: $ret"
puts $errorInfo




