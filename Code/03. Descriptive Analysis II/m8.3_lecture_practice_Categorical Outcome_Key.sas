/*************************************************************************************************
Practice: Categorical Outcome

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
Use the FREQ procedure to create a Two-way frequency table of prog by ses.
Which program is comprised of the highest proportion of students who are low SES?
*/
proc freq data = hsb1;
	tables prog*ses;
run;

/*
With 35.56% of the students in Program #1 are low SES. This is a higher proportion of students who are
low SES than any other program.
*/
