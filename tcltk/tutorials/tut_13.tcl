# Lesson 13

global logFile
set logFile [open "log.out" w]

proc writeLog {data} {
    global logFile

    puts $logFile "LOG: $data"
}

proc SetPositive {variable value} {
	upvar 1 $variable myvar
	if { $value < 0 } {
		set myvar [expr {-$value}]
	} else {
		set myvar $value
	}
	return $myvar
	# OR more concisely:
	# set myvar [expr {abs($myvar)}]
}

SetPositive x 5
SetPositive y -5

puts "X: $x ,Y: $y"


