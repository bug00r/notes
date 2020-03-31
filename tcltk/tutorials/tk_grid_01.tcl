# grid example

. config -bg white

foreach col {red purple blue orange green yellow} {
	label .lb$col -text $col -bg white
	frame .lf$col -bg $col -width 100 -height 3
	grid .lb$col .lf$col
}


