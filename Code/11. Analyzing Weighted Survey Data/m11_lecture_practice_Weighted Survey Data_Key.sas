/*************************************************************************************************
Practice: Analyzing Weighted Survey Data

This code is posted for your benefit; however, I highly recommend that you practice typing your
own SAS programs as well. With the SAS programming language, as with all new languages, immersion 
seems to be the best way to learn.

*************************************************************************************************/

/*
Use a SET statement in a DATA step to read hsb1.sas7bdat into your work library
*/
data wdc02;
	set "Z:\Dropbox\UNTHSC Admin and Teaching\Courses\5147-Fall 2014\BACH_EPID 5313\Data\2012 BRFSS\wdc02.sas7bdat";
run;

data wdc02;
	set wdc02;
	if smoke100 in (7, 9) then smoke100 = .;
	if smoke100 = 2 then smoke100 = 0;
run;


/*
Use the SURVEYFREQ procedure to create a two-way frequency table of gender by smoking. 
Which gender has the highest proportion of participants who have smoked at least 100 cigarettes?
*/
proc surveyfreq data = wdc02;
	strata _ststr;
	cluster _psu;
	weight _llcpwt;
	tables male*smoke100 / row cl;
	format smoke100;
run;

/*
46.7% of males reported smoking at least 100 cigarettes in their life, compared to just 35.2% of females.
*/
