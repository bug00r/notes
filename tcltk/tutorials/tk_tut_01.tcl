#/usr/local/bin/wish

# TK Example

proc Widget_Attributes {w {out stdout}} {
	puts $out [format "%-20s %-10s %s" Attribute Default Value]
	foreach item [$w configure] {
	puts $out [format "%-20s %-10s %s" \
		[lindex $item 0] [lindex $item 3] [lindex $item 4]]
	}
}

set b [button .hello -text "Hello, World!" -command { puts "Hello, World!"; }]
pack .hello -padx 20 -pady 10

$b flash
$b invoke
$b configure -background green

Widget_Attributes $b


