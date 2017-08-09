/*************************************************************************************************
Practice: Restructuring SAS Data Sets

This code is posted for your benefit; however, I highly recommend that you practice typing your
own SAS programs as well. With the SAS programming language, as with all new languages, immersion 
seems to be the best way to learn.

*************************************************************************************************/

/*
Creating data set for practice
*/
data bmi;
	input id gender $ bmi1 bmi2 bmi3 bmi4;
datalines;
001 F 30 28 26 28
002 F 35 30 31 30
003 M 29 28 25 25
004 F 38 34 30 29
;
run;

proc print data = bmi;
run;

/*
Restructure the bmi data to person-period data using iterative processing:
*/


/*
View a list report of your restructured data
*/

