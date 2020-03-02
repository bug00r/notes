# Lesson CORO

#  define a procedure that will return a sequence of integers

proc next_integer {{step 1}} {
	yield
	set i [expr {-$step}]
	while {1} {
		yield [incr i $step]
	}
}

# define two coroutines - one for all integers
# and one that returns the even ones

coroutine next1 next_integer
coroutine next_even next_integer 2

# Print the first few

while {1} {
	set i1 [next1]
	set i2 [next_even]

	puts "$i1 -- $i2"

	if { $i2 > 10 } {
		break
	}
}


proc isEqual {} {
	set word [yield]
	set prev {}
	set doubleWords {}

	while { $word ne "" } {
		set equal [expr { $word eq $prev }]

		if { $equal } {
			lappend doubleWords $word
		}

		set prev $word

		set word [yield $equal]
	}

	return $doubleWords

}

coroutine examine isEqual

foreach w {a b c d d e f g h h i i a} {
	examine $w
}

puts "Double Words: [examine {}]"


proc readWords {} {
	set file [yield]
	set infile [open $file]

	while { [gets $infile line] >= 0 } {
		#get rid of non letters
		regsub -all {[^a-zA-Z]} $line " " line
		set words [split $line]
		
		#examining words
		foreach word $words {
			if { $word ne "" } {
				examine $word
			}
		}
	}

	close $infile

	return [examine {}]

}

coroutine examine isEqual
coroutine examineFile readWords

puts "Double words: [examineFile mytext.txt]"






