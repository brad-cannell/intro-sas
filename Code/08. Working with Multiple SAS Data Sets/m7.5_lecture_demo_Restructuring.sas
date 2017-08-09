/*************************************************************************************************
Demonstration: Restructuring SAS Data Sets

This code is posted for your benefit; however, I highly recommend that you practice typing your
own SAS programs as well. With the SAS programming language, as with all new languages, immersion 
seems to be the best way to learn.

*************************************************************************************************/

data baby_weight;
	input id gender $ weight3 weight6 weight9 weight12;
datalines;
1001 F 9 13 16 17
1002 F 11 16 17 20
1003 M 17 20 23 24
1004 F 16 18 21 22
1005 M 11 15 16 18
1006 M 17 21 25 26
1007 M 16 17 19 21
1008 F 15 16 18 19
;
run;

/*
View the baby weight data
*/
proc print data = baby_weight;
run;


/*
Restructure the baby weight data to person-period data using iterative processing:
*/
data baby_weight_long (keep = id gender month weight);
	set baby_weight;
	array months{4} (3 6 9 12);
	array weights{4} weight3--weight12;
	do i = 1 to 4;
		month = months{i};
		weight = weights{i};
		output;
	end;
run;

proc print data = baby_weight_long;
run;


/*
Restructure the baby weight data to person-period data using iterative processing:
Step 1.
*/
data baby_weight_long1;
	set baby_weight;
	array weights{4} weight3--weight12;
	do i = 1 to 4;
		weight = weights{i};
	end;
run;

proc print data = baby_weight_long1;
run;


/*
Restructuring the baby_weight_long data to person-level data using PROC TRANSPOSE
*/
proc sort data = baby_weight_long;
	by id month;
run;


*Step 1;
proc transpose data = baby_weight_long
	out = baby_weight_wide;
run;

proc print data = baby_weight_wide;
run;


*Step 2;
proc transpose data = baby_weight_long
	out = baby_weight_wide;
	by id;
run;

proc print data = baby_weight_wide;
run;


*Step 3;
proc transpose data = baby_weight_long
	out = baby_weight_wide;
	by id;
	id month;
run;

proc print data = baby_weight_wide;
run;


*Step 4;
proc transpose data = baby_weight_long
	out = baby_weight_wide (drop = _NAME_)
	prefix = weight;
	by id;
	id month;
run;

proc print data = baby_weight_wide;
run;
	
		


















