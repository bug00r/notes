# Lesson 31

# this extends the tcl package script search dio to the tutorial one
lappend auto_path [file dirname [file normalize [info script]]]

puts "globals: [info globals]"
puts "lib_path: [info library]"
puts "auto_path: $auto_path"





