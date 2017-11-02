* ============================================================================;
* Effectively Presenting Your Results

* Demonstration: Creating a Table 1 in Microsoft Word

* This code is posted for your benefit. However, I highly recommend that you 
* practice typing your own SAS programs as well. With the SAS programming 
* language, as with all new languages, immersion seems to be the best way to 
* learn.
* ============================================================================;

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
* ============================================================================;
data drugs;
	infile "C:\Users\mbc0022\Desktop\drugs.csv" dsd firstobs = 2;
	input age edu female use;
	label age = "Age";
	label edu = "Education";
	label female = "Female";
	label use = "Drug use status";
run;

ods rtf file = "C:\Users\mbc0022\Desktop\Drug Use Reports.rtf";

* Find mean age;
* ============================================================================;
title1 "Mean age of Participants by Drug Use Status";
proc means data = drugs mean clm;
	var age;
	class use;
	format use use.;
run;


* Create frequency tables;
* ============================================================================;
title1 "Education and Gender of Participants by Drug Use Status";
proc surveyfreq data = drugs;
	tables use * (edu female) / row cl;
	format edu edu. use use.;
run;

ods rtf close;
