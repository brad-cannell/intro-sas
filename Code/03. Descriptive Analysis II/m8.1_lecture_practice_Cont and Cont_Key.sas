/*************************************************************************************************
Practice: Continuous Outcome and Continuous Predictor

This code is posted for your benefit; however, I highly recommend that you practice typing your
own SAS programs as well. With the SAS programming language, as with all new languages, immersion 
seems to be the best way to learn.

*************************************************************************************************/

/*
Use a SET statement in a DATA step to read hsb1.sas7bdat into your work library
*/
data hsb1;
	set "Z:\Dropbox\UNTHSC Admin and Teaching\Courses\5147-Fall 2014\BACH_EPID 5313\Data\High School and Beyond\hsb1.sas7bdat";
run;


/*
Use the SGPLOT procedure to graphically investigate the relationship between the variable read and the variable write.
What does the relationship between read and write appear to be?
*/
proc sgplot data = hsb1;
	scatter x = read y = write;
	reg x = read y = write;
run;

/*
Read and write appear to be positivley correlated in this scatter plot.
*/


/*
Write a PROC CORR step to investigate the relationship between read and write. 
Do the results change your previous conclusion? 
*/
proc corr data = hsb1;
	var read write;
run;

/*
The results of PROC CORR confirm our previous findings. Read and write are strongly, and statistically significantly, 
positively correlated. 
*/
