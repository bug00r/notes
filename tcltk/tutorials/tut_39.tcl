#Lesson 39 Timing

proc timetst1 {lst} {
	set x [lsearch $lst "5000"]
	return $x
}

proc timetst2 {array} {
	upvar $array a
	return $a(5000)
}

#make a long list and array

for { set i 0 } { $i < 5001 } { incr i } {
	set array($i) $i
	lappend list $i
}

puts "Time for list search: [time { timetst1 $list } 100]"
puts "time for array index: [time { timetst2 array } 100]"



