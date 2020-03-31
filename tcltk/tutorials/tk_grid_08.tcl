# grid 08

. config -bg white

foreach c {888 999 aaa bbb ccc ddd fff} {
	frame .$c -bg #$c -width 40 -height 40
}

# - represents a spanned column.
# ^ represents a spanned row.
# x represents a skipped cell.

grid .888 - - -sticky news
grid .999 .aaa - -sticky news
grid ^ .fff .bbb -sticky news
grid .ccc - ^ -sticky news




