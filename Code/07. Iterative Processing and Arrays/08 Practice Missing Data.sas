/*************************************************************************************************
Module 6: Iterative Processing and Arrays

Practice: Recoding Missing Data

This code is posted for your benefit; however, I highly recommend that you practice typing your
own SAS programs as well. With the SAS programming language, as with all new languages, immersion 
seems to be the best way to learn.

*************************************************************************************************/

/*
Step 2. Read-in the data set below.
*/
data health_study;
	input id expc listen good take hlprob share livaln livchld slpsick nerves exclude count tellfl 
supress nocare satlife vigact liftgroc stairs bend;
datalines;
10001 9 0 1 1 1 0 0 9 0 0 0 1 1 1 0 1 1 9 1 9
10003 1 1 0 0 0 0 1 0 1 0 1 0 1 1 1 0 0 0 9 1
10004 0 0 1 0 0 1 1 0 9 1 0 0 1 0 0 1 9 1 1 1
10005 0 9 9 9 9 9 9 1 0 9 9 9 9 9 9 9 1 0 0 0
;
run;


/*
Step 3. Using conditional processing to recode 9 to missing for all variables.
*/


/*
step 4. Use a DO Loop to to recode 9 to missing for all variables.
*/




