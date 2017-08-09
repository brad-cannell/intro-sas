/*************************************************************************************************
Module 4: Enhancing the Readability of SAS Data Sets

Using Formats in SAS

This code is posted for your benefit; however, I highly recommend that you practice typing your
own SAS programs as well. With the SAS programming language, as with all new languages, immersion 
seems to be the best way to learn.

*************************************************************************************************/

*Creating user-defined formats;
proc format;
	value	gender	1 = 'Female'
					2 = 'Male';
	
	value	standard01_	0 = 'No'
						1 = 'Yes';
run;

*View the first 10 observations with user-defined formats;
proc print data=ntrhd.hospital2 (obs=10);
	format	gender	gender.
			check1	standard01_.;
run;
	
*View the contents of hospital2 again;
proc contents data=ntrhd.hospital2;
	ods select VARIABLES;
run;
	
*View first 10 obs of hospital2 again;
proc print data=ntrhd.hospital1 (obs=10);
run;




*Adding formats to a data step;
data ntrhd.hospital3;
	set ntrhd.hospital2;
	format	gender	gender.
			check1	standard01_.;
run;

*View the contents of hospital3;
proc contents data=ntrhd.hospital3;
	ods select VARIABLES;
run;

*View first 10 obs of hospital3;
proc print data=ntrhd.hospital3 (obs=10);
run;




*Quickly create fake dataset to show what happens when you 
take the mean of a character variable;
data fake;
	input likert $;
	datalines;
	Excellent
	Good
	Excellent
	Good
	Poor
run;

*Estimate the mean of gender in fake;
proc means data=fake;
	var likert;
run;

*Estimate the mean of gender in hospital3;
proc means data=ntrhd.hospital3;
	var clean;
run;

*View first 10 obs of hospital3 again;
proc print data=ntrhd.hospital3 (obs=10);
run;




*Making user-defined formats permenant;
proc format library=ntrhd;
	value	gender	1 = 'Female'
					2 = 'Male';
	
	value	standard01_	0 = 'No'
						1 = 'Yes';
run;

*Telling SAS where to find the permanently stored formats;
options fmtsearch = (ntrhd);

*View first 10 obs of hospital3 again;
proc print data=ntrhd.hospital3 (obs=10);
run;




*Finding quartiles of income;
proc univariate data=ntrhd.hospital3;
	var income;
run;

*Formating income categories;
proc format library=ntrhd;
	value	income	low-<31602.5 = '1st quartile'
					31602.5-<57795.5 = '2nd quartile'
					57795.5-<80488.5 = '3rd quartile'
					80488.5-high = '4th quartile';
run;

*View first 10 observations of hospital4 with income format;
proc print data=ntrhd.hospital3 (obs=10) label;
	id id;
	format income income.;
run; 
