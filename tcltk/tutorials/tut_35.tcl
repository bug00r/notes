# Lesson 35

set dirs [list "."]

puts "[format "%-15s %-20s " "FILE" "DIRECTORY"]"

foreach dir $dirs {
	catch { cd $dir }
	set c_files [glob -nocomplain *c*]

	foreach name $c_files {
		puts "[format "%-15s %-20s " $name [pwd]]"
	}
}

