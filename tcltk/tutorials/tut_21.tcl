#
# Examine an overview of UNIX/Linux disks
#
set list1 [list \
{/dev/wd0a        17086    10958     5272    68%    /}\
{/dev/wd0f       179824   127798    48428    73%    /news}\
{/dev/wd0h      1249244   967818   218962    82%    /usr}\
{/dev/wd0g        98190    32836    60444    35%    /var}]

foreach line $list1 {
    regexp {[^ ]* *([0-9]+)[^/]*(/[a-z]*)} $line match size mnt
    puts "$mnt is $size blocks"
}
#
# Extracting a hexadecimal value ...
#
set line {Interrupt	Vector?	[32(0x20)]}
regexp "\[^\t]+\t\\\[\[0-9]+\\(0x(\[0-9a-fA-F]+)\\)]" \
	$line match hexval
puts $line
puts "Hex default ist: 0x$hexval"

# Matching the special chars as if they were ordinary

set str2 "abc^def"
regexp "\[^a-f]*def" $str2 match
puts "using \[^a-f] the match is: $match"
regexp "\[a-f^]*def" $str2 match
puts "using \[a-f^] the match is: $match"
regsub {\^} $str2 " is followed by: " str3
puts "$str2 with the ^ substituted is: \"$str3\""
regsub "(\[a-f]+)\\^(\[a-f]+)" $str2 "\\2 follows \\1" str3
puts "$str2 is converted to \"$str3\""


