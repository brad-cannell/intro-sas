/*************************************************************************************************
Module 2: Descriptive Analysis I

Numerical Descriptions of Numerical Variables

This code is posted for your benefit; however, I highly recommend that you practice typing your
own SAS programs as well. With the SAS programming language, as with all new languages, immersion 
seems to be the best way to learn.

*************************************************************************************************/

data height_and_weight_20;
	input id $ sex $ ht_in wgt_lbs;
	datalines;
	001 Male 71 190
	002 Male 69 177
	003 Female 64 130
	004 Female 65 153
	005 . 73 173
	006 Male 69 182
	007 Female 68 186
	008 . 73 185
	009 Female 71 157
	010 Male 66 155
	011 Male 71 213
	012 Female 69 151
	013 Female 66 147
	014 Female 68 196
	015 Male 75 212
	016 Female 69 19000
	017 Female 66 194
	018 Female 65 176
	019 Female 65 176
	020 Female 65 102
run;


/*
The basic PROC MEANS step.
*/
proc means data = height_and_weight_20;
run;


/*
The PROC MEANS step with all the default statistics, along with the median and mode, for participant weight only.
Also limiting the number of decimal places displayed to two.
*/
proc means data = height_and_weight_20 n mean median mode std min max maxdec=2;
	var wgt_lbs;
run;


































