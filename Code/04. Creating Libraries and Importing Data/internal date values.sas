/*
Find the internal value for a given data in SAS.
*/

data date;
	date_numeric = 365;
	date_literal = '02JAN1960'd;
	today        = today();
run;

proc print data = date;
run;

* To format them;
data date2;
	set date;
	format date_literal date_numeric today mmddyy10.;
run;

proc print data = date2;
run;
 
