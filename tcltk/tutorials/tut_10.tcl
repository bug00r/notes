# Lesson 10

for { set i 0 } {$i < 10} {incr i} {
	puts "I inside first Loop: $i"
}

for { set i 3 } { $i < 2 } { incr i } {
	puts "I inside second Loop $i"
}

puts "Start"
set i 0
while { $i < 10 } {
	puts "I inside third Loop: $i"
	incr i
	puts "I after incr: $i"
}

set i 0
incr i
# This is evaluated to:
set i [expr {$i+1}]

