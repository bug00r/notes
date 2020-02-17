#Lesson 4

set Z Albany
set Z_LABEL "The Capitol of New Yoor is: "

puts "\n........... examples of differences between \" and \{"
puts "$Z_LABEL $Z"
puts {$Z_LABEL $Z}

puts "\n........... examples of differences in nestin \{ and \""
puts "$Z_LABEL {$Z}"
puts {Who said, "What ist this country needs is a good $0.05 cigar!"?}

puts "\n........... examples of escape strings"
puts {Note: no substitution done within braces \r \n \x0a \f \v}
puts {But:
the escaped newline at the end of a\
string is replaced by a space}

