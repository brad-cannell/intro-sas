/*************************************************************************************************
Module 6: Iterative Processing and Arrays

Practice: Using a DO loop for random group assignment

This code is posted for your benefit; however, I highly recommend that you practice typing your
own SAS programs as well. With the SAS programming language, as with all new languages, immersion 
seems to be the best way to learn.

*************************************************************************************************/

/*
Step 1. Create trial group formats.
*/
proc format;
	value group 1 = "Control" group 
				2 = "Treatment";
run;


/*
Step 2. Assign subjects to groups in a DATA step.
*/
data assign;
	do subj = 1 to 50;
		if ranuni(123) le 0.5 then group = 1;
		else group = 2;
		output;
	end;
	format group group.;
run;


/*
Step 3. View a list report of all subjects and thier group assignment. Make sure subject id is the 
id variable in the list report.
*/
proc print data = assign;
	title "Simple Random Assignment to Treatement Groups";
	footnote "&sysdate and &systime";
	id subj;
run;




