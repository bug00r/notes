#Lesson 03

set Z Albany
set Z_LABEL "The Capitol of NY is: "

puts "$Z_LABEL $Z";# prints the value of Z
puts "$Z_LABEL \$Z"; #prints the literal $Z instead of value of Z

puts "\nBen Franklin is on the \$100.00 bill"

set a 100.00
puts "Washington is not on the $a bill"; #not what you want
puts "Lincoln is not on the $$a bill";# This is OK
puts "Hamilton is not on the \$a bill";# not what you want either
puts "Ben Franklin is on the \$$a bill";#But this is ok

puts "\n......................... examples of excaping strings"
puts "Tab\tTab\tTab\t"
puts "This string prints out\n in two lines"
puts "This string comes out \
on a single line"

