# Lesson 29

proc demo {argument1 {default "DefaultValue"}} {
	puts "This is a Demo proc"
	puts "	It is being called with $argument1 and $default"
	#We can use [info level] to find out if a value was given for
	#the optional argument "default"
	
	puts "Actual call: [info level [info level]]" 
}

puts "The args for demo are: [info args demo]"
puts "the body for demo is: [info body demo]"

set arglist [info args demo]

foreach arg $arglist {
	if {[info default demo $arg defaulval ]} {
		puts "$arg has a default value of $defaulval"
	} else {
		puts "$arg has no default"
	}
}


