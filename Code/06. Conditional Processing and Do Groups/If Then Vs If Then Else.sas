/******************************************************************************
IF-THEN vs. IF-THEN-ELSE

Students sometimes have trouble getting a feel for the difference between 
IF-THEN and IF-THEN-ELSE processing. Below is a simple example to help
demonstrate.

This code is posted for your benefit; however, I highly recommend that you 
practice typing your own SAS programs as well. With the SAS programming 
language, as with all new languages, immersion seems to be the best way to 
learn.
******************************************************************************/


This isn't very good. I think skip patterns probably make the best examples.
Find or create a skip pattern for use as an example.


/* 
Create a data set with two categorical variables where:
gender: 1 = male, 2 = female
bmi: 1 = not overweight or obese, 2 = overweight, 3 = obese, 7 = Don't know, 
	 9 = Refused
*/
data ds;
	input id gender bmi;
	datalines;
	1 1 1
	2 . 7
	3 1 3
	4 2 1
	5 1 2
	6 1 3
	7 2 1
	8 2 9
	9 . 2
	10 2 2
	11 2 1
	12 2 3
	13 1 2
	14 1 1
	15 2 1
	16 2 3
	17 2 2
	18 1 2
	19 1 3
	20 2 2
	;
run;

/*
Now let's say we want to recode gender to a dummy variable for male.
*/
data ds_2;
	set ds;
	if gender = 1 then male = 1;
	if gender = 2 then male = 0;
run;

proc print data = ds_2;
run;

/*
In this case, we get exactly the result we wanted. Now let's try again using
IF-THEN-ELSE syntax
*/
data ds_2;
	set ds;
	if gender = 1 then male = 1;
	else if gender = 2 then male = 0;
run;

proc print data = ds_2;
run;


* This is R code from the WHI sexual function study. Needs to be converted
* into SAS code. But, it's a good example of when order matters in if then
* Statements
dt[, abuse_d := if_else(is.na(verbab) & is.na(phyab),  -3, # Abuse not measured
                if_else(is.na(verbab) & !is.na(phyab), -2, # Can't determine, answered phyab, but not verbab
                if_else(is.na(phyab) & !is.na(verbab), -1, # Can't determine, answered verbab, but not phyab
                if_else(phyab_d == 0 & verbab_d == 0,   0, # Did not experience abuse
                if_else(phyab_d == 1 | verbab_d == 1,   1, # Experienced abuse
                NA_real_)))))]

dt[, abuse_d2 := if_else(phyab_d == 1 | verbab_d == 1,  1, 
                if_else(phyab_d == 0 & verbab_d == 0,   0, 
                if_else(is.na(phyab) & !is.na(verbab), -1,
                if_else(is.na(verbab) & !is.na(phyab), -2,
                if_else(is.na(phyab) & is.na(verbab),  -3, 
                NA_real_)))))]
                
See WHI Sexual Function preprocessing.Rmd file.