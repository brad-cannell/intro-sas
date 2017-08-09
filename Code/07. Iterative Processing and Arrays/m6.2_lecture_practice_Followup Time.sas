/*************************************************************************************************
Module 6: Iterative Processing and Arrays

Practice: Converting Follow-up Times

This code is posted for your benefit; however, I highly recommend that you practice typing your
own SAS programs as well. With the SAS programming language, as with all new languages, immersion 
seems to be the best way to learn.

*************************************************************************************************/

/*
Creating the long_study data set. This is a longitudinal study in wide format. It contains data 
for the follow-up visits from four participants. All follow-up times are in days, but I want
them in years.
*/
data long_study;
	input id followup1 followup2 followup3 followup4 followup5 followup6 followup7 followup8 
	followup9 followup10;
datalines;
10001 0 2 359 713 1191 1443 1820 2185 2548 2910
10003 0 1 436 799 1085 1538 1807 2246 2540 2904
10004 0 1 184 362 548 730 904 936 1084 1134
10005 0 44 218 422 602 786 946 1150 1309 1533
;
run;


/*
Using conditional processing to convert follow-up times in days to follow-up times in years
*/
data long_study2;
	set long_study;
	followup1 = round((followup1 / 365.25), .1);
	followup2 = round((followup2 / 365.25), .1);
	followup3 = round((followup3 / 365.25), .1);
	followup4 = round((followup4 / 365.25), .1);
	followup5 = round((followup5 / 365.25), .1);
	followup6 = round((followup6 / 365.25), .1);
	followup7 = round((followup7 / 365.25), .1);
	followup8 = round((followup8 / 365.25), .1);
	followup9 = round((followup9 / 365.25), .1);
	followup10 = round((followup10 / 365.25), .1);
run;


/*
Using a DO Loop to convert follow-up times in days to follow-up times in years.
*/
data long_study3;
	set long_study;
	array followup {10} followup1-followup10;
	do i = 1 to 10;
		followup{i} = round((followup{i} / 365.25), .1);
	end;
run;



