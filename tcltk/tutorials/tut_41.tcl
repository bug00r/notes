# Lesson 41

set Time [clock seconds]

puts "The time is: [clock format $Time -format %H:%M:%S]"
puts "The date is: [clock format $Time -format %D]"
puts [clock format $Time -format {Today is: %A, the %d of %B, %Y}]
puts "the default format for the time is: [clock format $Time]\n"

set halBirthBook "Jan 12, 1997"
set halBirthMovie "Jan 12, 1992"
set bookSec [clock scan $halBirthBook]
set movieSec [clock scan $halBirthMovie]

puts "The book and the movie versions of '2001, a Space Odyssey' had"
puts "a discrepancy of [expr {$bookSec - $movieSec}] seconds"
puts "in how soon sentinent computers like the HAL 9000"
puts "would appear"



