# Lesson OOP1

::oo::class create range {

	variable max
	variable current

	constructor {upto} {
		my max $upto
	}

	destructor {
		puts "...descruting"
	}
	
	method max {upto} {
		variable max
		variable current

		set max $upto
		set current -1
	}

	method next {varName} {
		upvar $varName var
		incr current 
		set var $current

		if { $var < $max } {
			return 1
		} else {
			return 0
		}
	}

}

::oo::class create newrange {
	superclass range
	method reset {} { variable current; set current -1 } 
}	

::oo::define range method reset {} { set current -1 }

set xrange [range new 10]
set yrange [newrange new 10]


while { [$xrange next x] } {
	while {[$yrange next y]} {
		puts [expr {$x+$y}]
	}
	$yrange reset
}



