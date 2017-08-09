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
data health_study2;
	set health_study;
	if expc = 9 then expc = .;
	if listen = 9 then listen = .;
	if good = 9 then good = .;
	if take = 9 then take = .;
	if hlprob = 9 then hlprob = .;
	if share = 9 then share = .;
	if livaln = 9 then livaln = .;
	if livchld = 9 then livchld = .;
	if slpsick = 9 then slpsick = .;
	if nerves = 9 then nerves = .;
	if exclude = 9 then exclude = .;
	if count = 9 then count = .;
	if tellfl = 9 then tellfl = .;
	if supress = 9 then supress = .;
	if nocare = 9 then nocare = .;
	if satlife = 9 then satlife = .;
	if vigact = 9 then vigact = .;
	if liftgroc = 9 then liftgroc = .;
	if stairs = 9 then stairs = .;
	if bend = 9 then bend = .;
run;


/*
step 4. Use a DO Loop to to recode 9 to missing for all variables.
*/
data health_study3;
	set health_study;
	array variable {*} _numeric_;
	do i = 1 to dim(variable);
		if variable{i} = 9 then variable{i} = .;
	end;
run;



