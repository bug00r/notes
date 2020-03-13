# pack 01

proc Pane_Create {f1 f2 args} {
	
	set t(-orient) vertical
	set t(-percent) 0.5
	set t(-in) [winfo parent $f1]
	array set t $args

	set master $t(-in)
	upvar #0 Pane$master pane
	array set pane [array get t]

	# Create the grip and set placement attributes that
	# will not change. A thin divider line is achieved by
	# making the two frames one pixel smaller in the

	set pane(1) $f1
	set pane(2) $f2
	set pane(grip) [frame $master.grip -background gray50 \
	-width 10 -height 10 -bd 1 -relief raised \
	-cursor crosshair]
	
	if {[string match vert* $pane(-orient)]} {
		set pane(D) Y;# adjust boundary y direction
		place $pane(1) -in $master -x 0 -rely 0.0 -anchor nw \
		-relwidth 1.0 -height -1
		place $pane(2) -in $master -x 0 -rely 1.0 -anchor sw \
		-relwidth 1.0 -height -1
		place $pane(grip) -in $master -anchor c -relx 0.8
	} else {
		set pane(D) X;# Adjust boundary in X Direction
		place $pane(1) -in $master -relx 0.0 -y 0 -anchor nw \
		-relheight 1.0 -width -1
		place $pane(2) -in $master -relx 1.0 -y 0 -anchor ne \
		-relheight 1.0 -width -1
		place $pane(grip) -in $master -anchor c -rely 0.8
	}
	$master configure -bg black


	bind $master <Configure> [list PaneGeometry $master]
	bind $pane(grip) <ButtonPress-1> [list PaneDrag $master %$pane(D)]
	bind $pane(grip) <B1-Motion> [list PaneDrag $master %$pane(D)]
	bind $pane(grip) <ButtonRelease-1> [list PaneStop $master]

	PaneGeometry $master

}

proc PaneDrag {master D} {
	upvar #0 Pane$master pane
	if [info exists pane(lastD)] {
		set delta [expr {double($pane(lastD) - $D) / $pane(size)}]
		set pane(-percent) [expr {$pane(-percent) - $delta}]
		if {$pane(-percent) < 0.0} {
			set pane(-percent) 0.0
		} elseif {$pane(-percent) > 1.0} {
			set pane(-percent) 1.0
		}
		PaneGeometry $master
	}
	set pane(lastD) $D
}

proc PaneStop {master} {
	upvar #0 Pane$master pane
	catch {unset pane(lastD)}
}

proc PaneGeometry {master} {
	upvar #0 Pane$master pane
	if {$pane(D) == "X"} {
		place $pane(1) -relwidth $pane(-percent)
		place $pane(2) -relwidth [expr {1.0 - $pane(-percent)}]
		place $pane(-grip) -relx $pane(-percent)
		set pane(size) [winfo width $master]
	} else {
		place $pane(1) -relheight $pane(-percent)
		place $pane(2) -relheight [expr 1.0 - $pane(-percent)]
		place $pane(grip) -rely $pane(-percent)
		set pane(size) [winfo height $master]
	}
}

proc PaneTest {{p .p} {orient vert}} {
	catch {destroy $p}
	frame $p -width 200 -height 200
	label $p.1 -bg blue -text foo
	label $p.2 -bg green -text bar
	pack $p -expand true -fill both
	pack propagate $p off
	Pane_Create $p.1 $p.2 -in $p -orient $orient -percent 0.3
}

PaneTest







