# LEsson 18

set fullpath "/usr/home/tcl/TclTutor/Lsn.17"
set relativepath "CVS/Entries"
set directorypath "/usr/bin/"

set paths [list $fullpath $relativepath $directorypath]

foreach path $paths {

 set first [string first "/" $path]
 set last [string last "/" $path]

 # Report whether path is absolute or relative
 
 if {$first != 0} {
	puts "$path is relative"
 } else {
 	puts "$path is absolute"
 }

 # If "/" is not the last char in $path, report the
 # last word, Else, removethe last "/", and find the next
 # to last "/", and report the last word
 
 incr last

 if {$last != [string length $path]} {
  set name [string range $path $last end]
  puts "The File referenced in $path is $name"
 } else {
  incr last -2
  set tmp [string range $path 0 $last]
  set last [string last "/" $tmp]
  incr last 
  set name [string range $tmp $last end]
  puts "The final directory in $path is $name"
 }

 # CVS is a dir created by the CVS source code
 # control system
 
 if { [string match "*CVS*" $path] } {
  puts "$path is a part of the source code control tree"
 }

 # compare to "a" to determin ehether the first char is
 # upper or lower case
 
 set comparision [string compare $name "a"]

 if {$comparision >= 0} {
  puts "$name starts with a lowercase letter\n"
 } else {
  puts "$name starts with a uppercase letter\n"
 } 
}

