# Lesson 16

set list [list {Washington 1789} {Adams 1797} {Jefferson 1801} \
	{Madison 1809} {Monroe 1817} {Adams 1825} ]

set x [lsearch $list Washington*]
set y [lsearch $list Madison*]
incr x
incr y -1;# Set range to be not inclusion

set subsetlist [lrange $list $x $y]
puts "These presidents served between Washington and Madison"
foreach item $subsetlist {
	puts "Starting in [lindex $item 1]: President [lindex $item 0]"
}

set x [lsearch $list Madison*]

set srtlist [lsort $list]
set y [lsearch $srtlist Madison*]

puts "\n$x Presidents came before MAdison chronologically"
puts "$y presidents came before Madison alphabetically"

# matches
string match f* foo
string match f?? foo

# doesn't match
string match f foo

# returns a bis list of files on my System
set bins [glob /*]
puts "$bins"

