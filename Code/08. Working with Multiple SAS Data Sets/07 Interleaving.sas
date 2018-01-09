/*************************************************************************************************
Demonstration: Interleaving SAS Data Sets

This code is posted for your benefit; however, I highly recommend that you practice typing your
own SAS programs as well. With the SAS programming language, as with all new languages, immersion 
seems to be the best way to learn.

*************************************************************************************************/

*Creating data sets for demonstration;
data advisees_MPH;
	input last $ gender $ program $;
	datalines;
	Hall F MPH
	Li F MPH
	Cho M MPH
run;

data advisees_DrPH;
	input last $ gender $ program $;
	datalines;
	Mahoney F DrPH
	Cooper F DrPH
run;

data advisees_MHA;
	input last $ gender $ degree $;
	datalines;
	Williams F MHA
	Clark M MHA
run;

*Concatenating all three advisees data sets;
data advisees;
	set advisees_MPH advisees_DrPH advisees_MHA (rename = (degree = program));
run;

proc print data = advisees;
run;

*Sort the advisees data set by last name in ascending order;
proc sort data = advisees;
	by last;
run;

proc print data = advisees;
run;

*Alternate way of interleaving data sets;
proc sort data = advisees_MPH;
	by descending last;
run;

proc sort data = advisees_DrPH;
	by descending last;
run;

proc sort data = advisees_MHA;
	by descending last;
run;

data advisees2;
	set advisees_MPH advisees_DrPH advisees_MHA (rename = (degree = program));
	by descending last;
run;

proc print data = advisees2;
run;
