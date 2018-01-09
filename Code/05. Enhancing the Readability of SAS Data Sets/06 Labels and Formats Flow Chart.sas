/******************************************************************************
Domonstrate labels and formats flow chart
Module 4: Enhancing the Readability of SAS Data Sets

This code is posted for your benefit; however, I highly recommend that you 
practice typing your own SAS programs as well. With the SAS programming 
language, as with all new languages, immersion seems to be the best way to 
learn.
******************************************************************************/

data ds;
	input x1 x2 x3;
	datalines;
	2076 1 2
	2844 2 2
	;
run;

proc print data = ds;
run;

* Labels;
* Always create (only temporarily) with label statement;
* Apply temporarily;
proc print data = ds;
	label x1 = "Birthdate";
	label x2 = "Sex";
	label x3 = "Happiness Scale";
run;

* Apply temporarily alternative;
proc print data = ds label;
	label x1 = "Birthdate";
	label x2 = "Sex";
	label x3 = "Happiness Scale";
run;

* What about other procs?;
proc means data = ds;  * No labels;
	var x2;
run;

proc means data = ds;  * With labels;
	var x2;
	label x2 = "Sex";
run;

proc freq data = ds;  * No labels;
	tables x1;
run;

proc freq data = ds;  * With labels;
	tables x1;
	label x1 = "Birthdate";
run;

* Apply permanently;
data ds2;
	set ds;
	label x1 = "Birthdate";
	label x2 = "Sex";
	label x3 = "Happiness Scale";
run;

proc contents data = ds2;
run;

proc contents data = ds;  * For comparison;
run;

/*****************************************************************************/

* Formats;
* Create temporarily;
proc format;
	value sex	1 = "Female"
				2 = "Male";
run;

proc print data = ds2 label; * Formats created, but not applied;
run;

* Create permanently;
proc format library = heart; * Look in the library;
	value sex	1 = "Female"
				2 = "Male";
run;

proc print data = ds2 label; * Formats created, but not applied;
run;

* If created permanently, we must;
options fmtsearch = (heart);

proc print data = ds2 label; * Formats created, but not applied;
run;

* Apply temporarily;
proc print data = ds2 label;
	format x2 sex.;
run;

* Wrong, demonstrates that format name is arbitrary;
proc print data = ds2 label;
	format x2 sex.;
	format x3 sex.; 
run;

* Apply permanently;
data ds3;
	set ds2;
	format x2 sex.;
run;

proc contents data = ds3; * Show that formats are permanent;
run;

proc print data = ds3; * Show that formats are permanent;
run;

* Caution: You now MUST supply formats to the end user!!!;

* Finally, add built-in SAS format;
data ds4;
	set ds3;
	format x1 mmddyy10.;
run;

proc contents data = ds4;
run;

proc print data = ds4 label; * Very readable output;
run;























