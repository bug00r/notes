
spinbox .s1 -from -10 -to 10
spinbox .s2 -from -10 -to 10 -increment .25 -format %4.2f

set states [list Arizona California Nevada "New Mexico"]
spinbox .s3 -values $states -wrap 1

set months {Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec}

frame .f
spinbox .f.month -values $months -textvariable date(month) -state readonly -width 8
spinbox .f.date -from 1 -to 31 -textvariable date(date) -state readonly -width 8
spinbox .f.year -from 1970 -to 2020 -textvariable date(year) -state readonly -width 8

label .f.l_month -text "Month:"
label .f.l_date -text "Date:"
label .f.l_year -text "Year:"

grid .f.l_month .f.month
grid .f.l_date .f.date
grid .f.l_year .f.year
grid .f.l_month .f.l_date .f.l_year -padx 2 -sticky e
grid .f.month .f.date .f.year -sticky ew


pack .s1 .s2 .s3 .f


