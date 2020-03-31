# Lesson 25

set tclfiles [glob *.tcl]
puts "Name - date of last modification"
foreach f $tclfiles {
	puts "$f - [clock format [file mtime $f] -format %x ]"
}


# reports files and directories

set dirs [glob -nocomplain -type d *]
if { [llength $dirs] > 0 } {
	puts "Directories:"
	foreach d [lsort $dirs] {
		puts "	$d"
	}
} else {
	puts "(no subdirectories)"
}

set files [glob -nocomplain -type f *]
if { [llength $files] > 0 } {
	puts "Files: "
	foreach f [lsort $files] {
		puts "	[file size $f] - $f (extension: [file extension $f])"
	}
} else {
	puts "(No Files)"
}



