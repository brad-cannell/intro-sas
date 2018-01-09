/******************************************************************************
Demonstration: Skip Patterns

This code is posted for your benefit; however, I highly recommend that you 
practice typing your own SAS programs as well. With the SAS programming 
language, as with all new languages, immersion seems to be the best way to 
learn.
******************************************************************************/

* Load formats;
proc format;
	value yesno 	1 = "Yes"
					2 = "No";

	value lastpap	1 = "Within past year"
					2 = "Within past 2 years"
					3 = "Within past 3 years"
					4 = "Within past 5 years"
					5 = "5 or more years";
run;

* Download 2015 BRFSS data set as a SAS transport file;
* Read-in the BRFSS data as old_ds;
* Keep only variables of interest;
data old_ds (keep = id hadpap2 lastpap2);
	set llcp2015;
	id = _N_;
run;

* Create a new data set with an additional variable - pap5 - that contains
* infomation about whether or not a participant had a pap test in the past
* 5 years;
data new_ds;
	set old_ds;
	if lastpap2 in (1:4) then pap5 = 1;
	else if lastpap2 = 5 | hadpap2 = 2 then pap5 = 2;
	else pap5 = .;
run;

* Data check;
ods html file = "C:\Users\mbc0022\Desktop\data_check.html";
proc freq data = new_ds;
	tables hadpap2 * lastpap2 pap5 / nopercent norow nocol missing;
	format hadpap2 pap5 yesno.
           lastpap2 lastpap.;
run;
ods html close;

* Final answer;
ods html file = "C:\Users\mbc0022\Desktop\final_answer.html";
proc freq data = new_ds;
	tables pap5;
	label pap5 = "Had a pap test in past 5 years";
	format pap5 yesno.;
run;
ods html close;

* Compare to wrong answer;
data wrong;
	set new_ds;
	if lastpap2 in (1:4) then wrong = 1;
	else if lastpap2 = 5 then wrong = 2;
	else wrong = .;
run;

ods html file = "C:\Users\mbc0022\Desktop\wrong_answer.html";
proc freq data = wrong;
	tables wrong;
	format wrong yesno.;
run;
ods html close;

