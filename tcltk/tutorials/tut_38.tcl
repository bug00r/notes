#Lesson 38

puts "There are $argc agruments to this script"
puts "The name of this script is $argv0"
if {$argc > 0} {puts "The other arguments are: $argv"}

puts "You have these environment variables set:"
foreach index [array names env] {
	puts "$index: $env($index)"
}

