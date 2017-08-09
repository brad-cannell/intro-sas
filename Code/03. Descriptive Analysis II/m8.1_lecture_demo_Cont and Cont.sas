/*************************************************************************************************
Demonstration: Continuous Outcome and Continuous Predictor

This code is posted for your benefit; however, I highly recommend that you practice typing your
own SAS programs as well. With the SAS programming language, as with all new languages, immersion 
seems to be the best way to learn.

*************************************************************************************************/

/*
Developing an Intuition for Describing the Relationship Between Two Continuous Variables
*/
data random;
	input id x y;
datalines;
1 62 38
2 14 33
3 94 3
4 53 18
5 4 8
6 87 10
7 1 22
8 79 42
9 88 24
10 62 46
;
run;


/*
Plot the data to get a feel for what it looks like
*/
proc sgplot data = random;
	scatter x = x y = y;
run;


/*
Plot the data again with the DATALABEL option
*/
proc sgplot data = random;
	scatter x = x y = y / datalabel = id;
run;


/*
Quantifying our intuition with a Pearson Correlation Coefficient
*/
proc corr data = random;
	var x y;
run;


/*
Positively correlated data
*/
data positive1;
	input x y;
datalines;
1 100
2 101
3 102
4 103
5 104
6 105
7 106
8 107
9 108
10 109
;
run;

proc sgplot data = positive1;
	scatter x = x y = y;
run;

proc corr data = positive1;
	var x y;
run;


/*
What about this data?
*/
data data;
	input x y;
datalines;
1 100
0 99
-1 98
-2 97
-3 96
-4 95
-5 94
-6 93
-7 92
-8 91
;
run;

proc sgplot data = data;
	scatter x = x y = y;
run;

proc corr data = data;
	var x y;
run;


/*
Negatively correlated data
*/
data negative;
	input x y;
datalines;
1 100
2 99
3 98
4 97
5 96
6 95
7 94
8 93
9 92
10 91
;
run;

proc sgplot data = negative;
	scatter x = x y = y;
run;

proc corr data = negative;
	var x y;
run;


/*
Using class survey data
*/
options fmtsearch = (class);
libname class "Z:\Dropbox\UNTHSC Admin and Teaching\Courses\5147-Fall 2014\BACH_EPID 5313\Data\Day one survey\5147\";
/*
Merge class data sets to get all needed variables
*/
data class.classurv15;
	merge class.classurv6 class.classurv12;
	id = _N_;
run;


/*
Exploring the relationhsip between height and weight
*/
proc sgplot data = class.classurv15;
	scatter x = oht y = wt_lbs;
run;

proc corr data = class.classurv15;
	var oht wt_lbs;
	label 	oht = "Height in Inches" 
			wt_lbs = "Weight in Pounds";
run;


/*
Plot the data again with a regression line
*/
proc sgplot data = class.classurv15;
	scatter x = oht y = wt_lbs;
	reg x = oht y = wt_lbs;
	label 	oht = "Height in Inches" 
			wt_lbs = "Weight in Pounds";
run;


/*
Relationship between height and weight, stratified by gender
*/
proc sgplot data = class.classurv15;
	scatter x = oht y = wt_lbs / group = gender;
	reg x = oht y = wt_lbs / group = gender;
	label 	oht = "Height in Inches" 
			wt_lbs = "Weight in Pounds";
run;



