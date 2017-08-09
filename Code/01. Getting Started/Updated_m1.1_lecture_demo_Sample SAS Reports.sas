/******************************************************************************
Module 1: Demonstrating some of SAS's capabilities

This program creates several different SAS reports. The purpose is just to 
give you an idea of the kinds of reports you will learn to create using SAS.

This code is posted for your benefit; however, I highly recommend that you 
practice typing your own SAS programs as well. With the SAS programming 
language, as with all new languages, immersion seems to be the best way to 
learn.
******************************************************************************/

* Read in some instream data lines;
data example;
	input id $ sex $ disability ht_in wgt_lbs;
	datalines;
	001 Male 0 71 190
	002 Female 0 60 112
	003 Female 1 64 130
	004 Female 0 65 154
	005 Male 0 73 173
	006 Male 0 69 182
	007 Female 0 68 140
	008 Male 0 73 185
	009 Male 1 71 199
	010 Male 1 66 155
	011 Male 0 71 213
	012 Female 0 69 151
	013 Female 1 66 147
	014 Female 0 68 196
	015 Male . 75 212
	016 Female 0 69 190
	017 Female 0 66 194
	018 Male . 71 194
	019 Female 0 65 176
	020 Female 0 65 102
	;
run;

* Create formats;
proc format;
	value yesno 0 = "No"
				1 = "Yes";
run;

* Permanently apply format;
data example;
	set example;
	format disability yesno.;
run;

* The CONTENTS procedure (contents report);
proc contents data = example;
	title "Viewing the descriptive portion of the Example data set";
	footnote;
run;

* The PRINT procedure (list report);
proc sort data = example;
	by sex;
run;

proc print data = example noobs;
	title "Study Participants";
	title2 "By Participant Sex";
	by sex;
	id sex;
	format disability yesno.;
run;


* The FREQ procedure (frequency report);
proc freq data = example;
	title "Frequency of Disability";
	title2 "By Participant Sex";
	tables sex*disability / chisq;
run;

* The TTEST procedure (ttest report);
proc ttest data = example;
	title "Testing for Difference in Height";
	title2 "By Participant Sex";
	class sex;
	var ht_in;
	label ht_in = "Height in Inches"; 
run;

* The GCHART procedure (SAS graphs);
proc gchart data = example;
	title "Frequency of Disability";
	title2 "By Participant Sex";
	vbar3d disability / group = sex shape = block discrete;
	format disability yesno.;
run;
quit;
