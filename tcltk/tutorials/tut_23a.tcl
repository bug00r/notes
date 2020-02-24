# Lesson 23

# create a dictionary
# Two Clients, known by their client number
# with first and last names

dict set clients ID1 forenames Joe
dict set clients ID1 surname Schmoe
dict set clients ID2 forenames Anne
dict set clients ID2 surname Other

# print a Table

puts "Number of Clients: [dict size $clients]"
dict for {id info} $clients {
	puts "Cliend: $id"
	dict with info {
		puts "	Name: $forenames $surname"
	}
}

# example of db revisited with dict

proc addname {dbVar first last} {

	upvar $dbVar db

	dict incr db ID
	set id [dict get $db ID]

	dict set db $id first $first
	dict set db $id last $last
}

proc report { db } {

	# loop over names
	
	dict for { id name } $db {
		# create temp mapping

		if {$id eq "ID"} { continue }

		set last [dict get $name last]
		dict set tmp $last $id
	}

	foreach last [lsort [dict keys $tmp]] {
		set id [dict get $tmp $last]
		puts "	[dict get $db $id first] $last"
	}
}

# init 

dict set f_name ID 0
dict set h_name ID 0

addname f_name Mary Poppins
addname f_name Uriah Heep
addname f_name Frodo Baggins

addname h_name Rene Descartes
addname h_name Richard Lionheart
addname h_name Leonardo "da Vinci"
addname h_name Charls Baudelaire
addname h_name Julius Caesar

# report 

puts "Fictional Characters:"
report $f_name
puts "Historical Characters:"
report $h_name



