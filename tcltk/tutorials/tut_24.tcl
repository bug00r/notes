# Lesson 24

# count the number of lines in textfile

set infile [open "myfile.txt" r]
set number 0

while { [gets $infile line] } {
	incr number
}
close $infile

puts "Number of lines: $number"

# report it in an external file
set outfile [open "report.out" w]
puts $outfile "Number of Lines: $number"
close $outfile


