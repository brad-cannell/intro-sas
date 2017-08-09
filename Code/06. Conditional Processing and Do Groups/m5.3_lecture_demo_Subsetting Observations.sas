/*************************************************************************************************
Demonstration: Subsetting Observations in the DATA step

This code is posted for your benefit; however, I highly recommend that you practice typing your
own SAS programs as well. With the SAS programming language, as with all new languages, immersion 
seems to be the best way to learn.

*************************************************************************************************/

/*
Viewing a list report of ntrhd.staff;
*/
proc print data = ntrhd.staff;
run;


/*
Creating a new SAS data set called subset1 that contains a subset of the observations in
ntrhd.staff
*/
data subset1;
	set ntrhd.staff;
	where job_title contains 'Lab' or Employee_ID < 120110;
run;


/*
Creating list report of subset1
*/
proc print data = subset1;
run;


/*
Creating a new SAS data set called subset2 that contains a subset of the VARIABLES 
in ntrhd.staff
*/
data subset2;
	set ntrhd.staff;
	keep employee_id job_title salary gender;
run;


/*
Creating list report of subset2
*/
proc print data = subset2;
run;
