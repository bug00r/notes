
label .version -text "My App Version 1.0"
set version "May Version from Text Variable"
label .version2 -textvariable version

pack .version .version2 -side top

proc FixedWidthLabel { name values } {
  set maxWidth 0
  foreach value $values {
	if {[string length $value] > $maxWidth} {
		set maxWidth [string length $value]
	}
  }

  label $name -width $maxWidth -anchor w -text [lindex $values 0]
  return $name
}

FixedWidthLabel .status {OK Busy Error}
.status config -text busy

pack .status -side bottom

