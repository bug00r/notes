# Lesson 20

set sample "Where there is a will, There is a way."

#
# Match the first substring with lowercase letters only
#

set result [regexp {[a-z]+} $sample match]
puts "Result: $result match: $match"

#
#Math the first two words, the first one allows uppercase
set result [regexp {([A-Za-z]+) +([a-z]+)} $sample match sub1 sub2]
puts "Result: $result Match: $match 1: $sub1 2: $sub2"

#replace a word

regsub "way" $sample "lawsuit" sample2
puts "New: $sample2"

# Use the -all option to count the number of "words"
puts "Number of Words: [regexp -all {[^ ]+} $sample]"


