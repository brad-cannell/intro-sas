/*************************************************************************************************
Practice: Merging SAS Data Sets One-to-One

This code is posted for your benefit; however, I highly recommend that you practice typing your
own SAS programs as well. With the SAS programming language, as with all new languages, immersion 
seems to be the best way to learn.

*************************************************************************************************/

*Creating data sets for practice;
data Demographics;
	input ID_NUM Gender $ Site $;
	datalines;
	1001 F CHI
	1002 F DEN
	1003 M FW
	1004 M SDG
run;

data Grip_Strength;
	input ID Grip_R Grip_L;
	datalines;
	1001 32 30
	1002 28 30
	1003 32 28
	1004 22 22
run;

*merge the three data sets above;
