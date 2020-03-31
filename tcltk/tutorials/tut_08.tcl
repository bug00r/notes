# Lesson 8

set string "a"

switch $string {
	"a" -
        "b" {
		puts "Using the body for pattern 'b' for a and b"
	}	
}

set edge_count 3

switch $edge_count {
	0 -
	1 -
	2 {
		puts "not a polygon"
	}
	3 {
		puts "triangle"
	}
	4 {
		puts "quadrilateral"
	}
	5 {
		puts "pentagon"
	}
	default {
		puts "unknown"
	}
	
}

set x THREE
set y 3
set z THREE

#Note that patterns are not subject of substitutions if
#contained in braces


switch $x {
	$z {
		set y1 [expr {$y+1}]
		puts "MATCH \$z. $y + $z is $y1"
	}
	ONE {
		set y1 [expr {$y+1}]
		puts "MATCH ONE. $y + one is $y1"
	}
	TWO {
		set y1 [expr {$y+2}]
		puts "MATCH TWO. $y + two is $y1"
	} 
	THREE {
		set y1 [expr {$y+3}]
		puts "MATCH THREE. $y + three is $y1"
	} 
	default {
		puts "$x is NOT A MATCH"
	}


set xx THREE
set yy 3
set zz THREE

switch $xx\
    $zz {
        set y1 [expr {$yy+1}]
        puts "MATCH \$zz. $yy + $zz is $y1"
    }\
    ONE {
        set y1 [expr {$yy+1}]
        puts "MATCH ONE. $yy + one is $y1"
    }\
    TWO {
        set y1 [expr {$yy+2}]
        puts "MATCH TWO. $yy + two is $y1"
    }\
    THREE {
        set y1 [expr {$yy+3}]
        puts "MATCH THREE. $yy + three is $y1"
    }\
    default {
        puts "$xy is NOT A MATCH"
    }


