/*************************************************************************************************
Practice: Interleaving SAS Data Sets

This code is posted for your benefit; however, I highly recommend that you practice typing your
own SAS programs as well. With the SAS programming language, as with all new languages, immersion 
seems to be the best way to learn.

*************************************************************************************************/

*Creating data sets for practice;
data trial_CHI;
	input ID Gender $ Site $;
	datalines;
	1001 F CHI
	1002 F CHI
	1003 M CHI
	1004 M CHI
run;

data trial_FW;
	input ID Gender $ Site $;
	datalines;
	1005 F FW
	1006 F FW
	1007 M FW
	1008 M FW
run;

data trial_DEN;
	input ID Gender $ Site $;
	datalines;
	1009 F DEN
	1010 F DEN
	1011 M DEN
	1012 M DEN
run;

*Interleave the three data sets above;
proc sort data = trial_CHI;
	by gender site;
run;

proc sort data = trial_FW;
	by gender site;
run;

proc sort data = trial_DEN;
	by gender site;
run;

data trial_sorted;
	set trial_CHI trial_FW trial_DEN;
	by gender site;
run;

proc print data = trial_sorted;
run;
