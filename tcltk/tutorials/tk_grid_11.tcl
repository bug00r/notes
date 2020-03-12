# grid 11

foreach b {alpha beta gamma x y z} {
	label .$b -text $b
}

.beta config -bg white
.y config -bg white
grid .alpha .beta .gamma -sticky news
grid .x .y .z -sticky news

grid columnconfigure . "0 1 2" -uniform group1 -weight 1
grid columnconfigure . 1 -weight 2


