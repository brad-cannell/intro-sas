/*************************************************************************************************
Demonstration: Merging SAS Data Sets One-to-One

This code is posted for your benefit; however, I highly recommend that you practice typing your
own SAS programs as well. With the SAS programming language, as with all new languages, immersion 
seems to be the best way to learn.

*************************************************************************************************/

*Creating data sets for demonstration;
data advisees_personal;
	input first $ gender $ program $;
	datalines;
	Alison F MPH
	Ming F MPH
	Brian M MPH
	Keesha F MPH
run;

data advisees_grades;
	input first $ BACH5300 $ BIOS5300 $ EPID5300 $ EOHS5300 $ HMAP5300 $;
	datalines;
	Alison A A A A A
	Ming B B B B B
	Brian B A B A B
	Keesha A B A B A
run;

*Merge data sets one-to-one;
data advisees;
	merge advisees_personal advisees_grades;
	by first;
run;

proc print data = advisees;
run;

*Sort the advisees data set by first name in ascending order;
*Merge data sets one-to-one;
proc sort data = advisees_personal;
	by first;
run;

proc sort data = advisees_grades;
	by first;
run;

data advisees;
	merge advisees_personal advisees_grades;
	by first;
run;

proc print data = advisees;
run;
