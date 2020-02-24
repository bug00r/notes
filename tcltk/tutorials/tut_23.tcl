# Lesson 23

# won't work

proc print12 {a} {
	puts "$a(1) and $a(2)"
}

set array1(1) "A"
set array1(2) "B"

#this will print error
#print12 $array1

# solution with upvar

proc print12 {array} {
	upvar $array a
	puts "$a(1) and $a(2)"
}

print12 array1

# The example database revisited - to get a
#  more general "database"

proc addname { db first last } {

	upvar $db name
	#creating ID
	incr name(ID)
	set id $name(ID)

	set name($id,first) $first;
	set name($id,last) $last;
}

proc report {db} {
	upvar $db name
	
	#loop over last names: make a map from last name to ID
	
	foreach n [array names name "*,last"] {
		#split the name to geht the ID
		regexp {^[^,]+} $n id
		#sore in tmp array: an "inverse" map of last name to ID
		set last $name($n)
		set tmp($last) $id
	}	

	foreach last [lsort [array names tmp]] {
		set id $tmp($last)
		puts "\t$name($id,first) $name($id,last)"
	}
}

# init array db with names

set f_name(ID) 0
set h_name(ID) 0

addname f_name Mary Poppins
addname f_name Uriah Heep
addname f_name Frodo Baggins

addname h_name Rene Descartes
addname h_name Richard Lionheart
addname h_name Leonardo "da Vinci"
addname h_name Charles Baudelaire
addname h_name Julius Caesar

# simple reporting
puts "fictional Names"
report f_name
puts "Historical Names"
report h_name

