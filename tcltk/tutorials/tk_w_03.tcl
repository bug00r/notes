set x {documentProc dBoxProc plainDProc altDBoxProc movableDBoxProc \
zoomDocProc rDocProc floatProc floatZoomProc floatSideProc floatSideZoomProc}

foreach y $x {
	toplevel .$y
	label .$y.l -text $y
	pack .$y.l -padx 40 -pady 20
	if [catch { unsupported1 style .$y $y } err] {
		puts "$y: $err"
	}
}


