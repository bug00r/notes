# Lesson Thread 1

package require Thread

# creates thread that search dir for files.

proc myerrorproc {thread_id errorInfo} {
	puts "ERROR: $thread_id with \"$errorInfo\""
}

thread::errorproc myerroproc

set tid [thread::create -joinable {
	
	package require fileutil
	
	set files [fileutil::findByPattern [pwd] *.tcl]
	
	puts "reading files"
	
	catch {	
		set fid [open files.txt w]
		puts $fid [join $files \n]
		close $fid
	} msg

	if {$msg ne ""} {
		puts "...error: $msg"
	} else {
		puts "...successfully"
	}

}]

puts "$tid: exists [thread::exists $tid]"

thread::join $tid
#main thread can perform other tasks



