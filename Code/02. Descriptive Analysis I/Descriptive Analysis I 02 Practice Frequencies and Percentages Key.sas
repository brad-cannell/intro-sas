/*************************************************************************************************
Module 2: Descriptive Analysis I

Practice: Calculate Frequencies and Percentages

This code is posted for your benefit; however, I highly recommend that you practice typing your
own SAS programs as well. With the SAS programming language, as with all new languages, immersion 
seems to be the best way to learn.

*************************************************************************************************/

/*
Step 1. Highlight and sumbmit the data step below.
*/
data function_study;
	input id $ sex $ disability $ ht_in wgt_lbs;
	datalines;
	001 Male No 71 190
	002 Female No 60 112
	003 Female Yes 64 130
	004 Female No 65 154
	005 Male No 73 173
	006 Male No 69 182
	007 Female No 68 140
	008 Male No 73 185
	009 Male Yes 71 199
	010 Male Yes 66 155
	011 Male No 71 213
	012 Female No 69 151
	013 Female Yes 66 147
	014 Female No 68 196
	015 Male . 75 212
	016 Female No 69 190
	017 Female No 66 194
	018 Male . 71 194
	019 Female No 65 176
	020 Female No 65 102
run;


/*
Step 2. Create a list report that shows all the observations in function_study.
*/
proc print data = function_study;
run;


/*
Step 3. Create a frequency report to calculate the percentage of participants who 
self-report having a disability.
*/
proc freq data = function_study;
	table disability;
run;

/*
22.22% of participants self-reported living with a disability.
2 participants are missing a value for self-reported disability.
*/






