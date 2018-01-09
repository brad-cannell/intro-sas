/*************************************************************************************************
Practice: Merging SAS Data Sets Many-to-One

This code is posted for your benefit; however, I highly recommend that you practice typing your
own SAS programs as well. With the SAS programming language, as with all new languages, immersion 
seems to be the best way to learn.

*************************************************************************************************/

*Creating data sets for practice;
data Demographics;
	input ID Visit $ Gender $ Site $;
	datalines;
	1001 F CHI
	1002 F DEN
	1003 M FW
	1004 M SDG
run;

data Grip_Strength;
	input ID Visit $ Grip_R Grip_L;
	datalines;
	1001 Pre 32 30
	1001 Post 33 32
	1002 Pre 28 30
	1002 Post 27 30
	1003 Pre 32 28
	1003 Post 34 30
	1004 Pre 22 22
	1004 Post 27 26
run;

*merge the three data sets above;
*Because the input data sets are already sorted on ID, no PROC PRINT is necessary;
data Combined;
	merge Demographics Grip_Strength;
	by id;
run;

proc print data = combined;
run;
