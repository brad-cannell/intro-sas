/******************************************************************************
Module 9: Effectively Presenting Your Results

Creating a Descriptive Table in Microsoft Word

This code is posted for your benefit; however, I highly recommend that you 
practice typing your own SAS programs as well. With the SAS programming 
language, as with all new languages, immersion seems to be the best way to 
learn.
******************************************************************************/

proc format;
	value	edu	1 = "Less than high school"
				2 = "High school"
				3 = "Some college"
				4 = "Collge graduate";
	value	use	0 = "Non-users"
				1 = "Use other drugs"
				2 = "Use opioid drugs";
run;

* Import data;
data drugs;
	infile "C:\Users\mbc0022\Desktop\drugs.csv" dsd firstobs = 2;
	input age edu female use;
run;

* Find mean age;
proc means data = drugs;
	var age;
	class use;
	format use use.;
run;

* Create frequency tables;
proc freq data = drugs;
	tables use * (edu female);
	format edu edu. use use.;
run;
