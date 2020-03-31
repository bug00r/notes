# Lesson 22

proc addname { first last } {
	global name

	# create a new ID (stored in the name array too for easy access)
	incr name(ID)
	set id $name(ID)

	set name($id,first) $first ; # the indes is simply a string
	set name($id,last) $last   ; # So we can use both fixed and  
				    ; #varying parts
}

# Init the array and add a few names

global name
set name(ID) 0

addname Mary Poppins
addname Uriah Heep
addname Rende Descartes
addname Leonardo "da Vinci"

# check the contents of our database
# the parray command is a quick way 
# to print array

parray name

#some array commands

array set array1 [ list {123} {Abigal Aardvark} \
       			{234} {Bob Baboon} \
			{345} {Cythy Coyote} \
			{456} {Daniel Dog} ]

puts "Array1 has [array size array1] entries"
puts "Array1 has the following entries:\n [array names array1]\n"
puts "ID Number 123 belongs to $array1(123)\n"

if {[array exist array1]} {
	puts "array1 is an array"
} else {
	puts "array1 is not an array"
}

if {[array exist array2]} {
	puts "array2 is an array"
} else {
	puts "array2 is not an array"
}

proc existence { variable } {
	upvar $variable testVar
	if {[info exists testVar]} {
		puts "$variable Exists"
	} else {
		puts "$variable does not exists"
	}
}

existence array1
existence array2

#create an array
for {set i 0} {$i < 5} {incr i} { set a($i) test }

puts "\ntesting unsetting a member of an array"
existence a(0)
puts "a0 has been unset"
unset a(0)
existence a(0)

puts "\ntesting unsetting several members of an array, part 2"
existence a(3)
existence a(4)
catch { unset a(3) a(0) a(4) }
puts "\nAfter attempting to delete a(3), a(0) and a(4)"
existence a(3)
existence a(4)

puts "\nUnset all the array's elements"
existence a
array unset a *

puts "\ntesting unsetting an array"
existence a
puts "a has been unset"
unset a
existence a


