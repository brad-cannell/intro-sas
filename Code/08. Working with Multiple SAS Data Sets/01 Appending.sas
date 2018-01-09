/*************************************************************************************************
Demonstration: Appending SAS Data Sets

This code is posted for your benefit; however, I highly recommend that you practice typing your
own SAS programs as well. With the SAS programming language, as with all new languages, immersion 
seems to be the best way to learn.

*************************************************************************************************/

*Creating data sets for demonstration;
data advisees;
	input first $ gender $ matric;
	datalines;
	Angela F 2010
	Dawn F 2011
	Aaron M 2011
run;

data advisees_2012;
	input first $ gender $ matric;
	datalines;
	Sruthi F 2012
	Lindsey F 2012
	Natalie F 2012
run;

*Appending SAS data sets with identical variables;
proc append base = advisees data = advisees_2012;
run;

proc print data = advisees;
run;

*Creating advisees_2013;
data advisees_2013;
	input first $ matric;
	datalines;
	Sara 2013
	Dennis 2013
run;

*Appending to a BASE= data set with an additional variable;
proc append base = advisees data = advisees_2013;
run;

proc print data = advisees;
run;

*Creating advisees_2014;
data advisees_2014;
	input first $ matric program $;
	datalines;
	Nathan 2014 MPH
	Gloria 2014 PhD
run;

*Appending a data = data set with an additional variable;
proc append base = advisees data = advisees_2014;
run;

proc print data = advisees;
run;

*Appending a data = data set with an additional variable and force option;
proc append base = advisees data = advisees_2014 force;
run;

proc print data = advisees;
run;
