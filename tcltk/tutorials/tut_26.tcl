# Lesson 26

set files [exec ls {*}[glob *.tcl]]
puts "$files"

if { [catch { exec lsa *.tcl } msg ] } {
	puts "Something gone wrong"
	puts "Information about that: $::errorInfo"
}


# Write a TCL Script to get a platform-independent program:
#
# create a unique (mostly) file name for a tcl program

set TMPDIR "."
if { [info exists ::env(TMP)] } {
	set TMPDIR $::env(TMP)
}
set tempFileName [file join $TMPDIR invert_[pid].tcl]

#open the output file and # write the program to it
set outfl [open $tempFileName w]
puts $outfl {
	set len [gets stdin line]
	if { $len < 5 } {exit -1}
	for {set i [expr {$len-1}]} {$i >= 0} {incr i -1} {
		append invertedLine [string range $line $i $i]
	}
	puts $invertedLine
	exit 0
}

# closing oputput
close $outfl

# run the new tcl script:
# open a pipe to the program (for both reading and writing: r+)

set io [open "|[info nameofexecutable] $tempFileName" r+]

# send a string to the new program [MUST FLUSH]

puts $io "This will come back backwards"
flush $io

#get a reply and display

set len [gets $io line]
puts "To invert: 'This will come back backwards'"
puts "Inverted: $line"
puts "The line is $len chars long"

#run the program with input defined in an exec call

set invert [exec [info nameofexecutable] $tempFileName << \
	"ABLE WAS I ERE I SAW ELBA"]

puts "The Inversion of 'ABLE WAS I ERE I SAW ELBA' is \n $invert"

#cleanup
file delete $tempFileName

puts "exec info: [info nameofexecutable]"

