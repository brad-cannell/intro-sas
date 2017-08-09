/*************************************************************************************************
Demonstration: Concatenating SAS Data Sets

This code is posted for your benefit; however, I highly recommend that you practice typing your
own SAS programs as well. With the SAS programming language, as with all new languages, immersion 
seems to be the best way to learn.

*************************************************************************************************/

*Creating data sets for demonstration;
data advisees_MPH;
	input first $ gender $ program $;
	datalines;
	Alison F MPH
	Ming F MPH
	Brian M MPH
run;

data advisees_DrPH;
	input first $ gender $ program $;
	datalines;
	Tiffany F DrPH
	Florence F DrPH
run;

*Concatenating SAS data sets with identical variables;
data advisees;
	set advisees_MPH advisees_DrPH;
run;

proc print data = advisees;
run;

*Creating advisees_MHA;
data advisees_MHA;
	input first $ gender $ degree $;
	datalines;
	Jessica F MHA
	Ryan M MHA
run;

*Concatenating SAS data sets with different variable names;
data advisees_Masters;
	set advisees_MPH advisees_MHA;
run;

proc print data = advisees_Masters;
run;

*Concatenating SAS data sets with different variable names again;
data advisees_Masters;
	set advisees_MPH advisees_MHA (rename = (degree = program));
run;

proc print data = advisees_Masters;
run;
