# Lesson oop2

::oo::class create printable {

	method print {} {
		foreach v [info class variables [info object class [self]]] {
			my variable $v
			puts "$v: [set $v]"
		}
	}
}

::oo::class create counter {
	variable count
	constructor {} {
		set count 0
	}

	method incr {} {
		incr count
	}

	mixin printable
}

counter create countup

countup incr
countup incr

countup print

::oo::objdefine countup {
	method Log args {
		my variable count
		puts "Called in [lindex [info level 1] 0] .. counter was: $count"
		return [next {*}$args]
	}

	filter Log
}

proc runCalculation {} {
	countup incr
	countup incr
	puts "Done"
}

runCalculation


