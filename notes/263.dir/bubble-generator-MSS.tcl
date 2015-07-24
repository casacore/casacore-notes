# This file contains the data used by the three syntax diagram rendering
# programs:
#
#   bubble-generator.tcl
#   bubble-generator-bnf.tcl
#   bubble-generator-bnf.tcl
#

# Graphs:
#
set all_graphs {
    SPW-EXPR
    {
	loop 
	{
	    line {loop SPWSPEC ;} 
	    {line {or nil  {line : {loop FREQSPEC ;}}}}
	} ,
    }

    SPWID 
    {
	line 
	{
	    or 
	    {line {or nil > <} {or INTEGER FREQSPEC}}
	    REGEX RANGESPEC
	}
    }

    FREQ 
    {
	line RANGESPEC {or nil K M G T} Hz
    }

    RANGE
    {
	line NUMBER {or nil {line ~ NUMBER}}
    }

    ANT-STATION-SPEC
    {
	line {or {line INTEGER {or nil  {line ~ INTEGER}}} STRING REGEX}
    }

    ANT-EXPR
    {
	loop
	{
	    line 
	    {or ANTSPEC {line ( {loop ANTSPEC ,} )}}
	    {or nil {line @ {or STATIONSPEC {line ( {loop STATIONSPEC ,} )}}}}
	} ,
    }

    BASELINE-EXPR
    {
	loop
	{
	    line {or nil !} ANT-EXPR {or nil {line {or & &&} {or nil ANT-EXPR}} &&&}
	} ;
    }

    TIME-EXPR
    {
	loop {
	    line {or 
		{line {line T0 {or nil {line + dT}}}}
		{line {or < >} T0}
		{line TIME-RANGE}
		{line ( TIME-RANGE ) } 
		{line {or nil FLOAT} [ TIME-RANGE ] } 
	    }
	} ,
    }
   TIME-RANGE
    {
      line {line T0 { or nil {line ~ T1}}}
    }

}
