/*************************************************************************************************
Lab Assignment 
Module 8: Descriptive Analysis II

In this week’s lab you will practice describing relationships between variables. Specifically, 
you will practice basic descriptive techniques appropriate for analysis of a continuous predictor 
variable and continuous outcome variable, a categorical predictor variable and a continuous 
outcome variable, or a categorical predictor variable and categorical outcome variable.

This code is posted for your benefit; however, I highly recommend that you practice typing your
own SAS programs as well. With the SAS programming language, as with all new languages, immersion 
seems to be the best way to learn.

*************************************************************************************************/
libname heart "Z:\Dropbox\UNTHSC Admin and Teaching\Courses\5147-Fall 2014\BACH_EPID 5313\Data\WHAS\";

proc import out=heart.heart1
	datafile='Z:\Dropbox\UNTHSC Admin and Teaching\Courses\5147-Fall 2014\BACH_EPID 5313\Data\WHAS\whas500_2.xls'
	dbms=xls replace;
	sheet='WHAS500';
	getnames=yes;
	mixed=yes;
run;


/*
Task 1. 
Using the CORR procedure,explore the relationship between age and initial heart rate also, 
examine the correlation coefficient and the p-value.
*/;
proc corr data=heart.heart1;
	var age hr;
run;


/*
Task 2. 
Explore the relationship between age and initial heart rate by creating a scatter plot. Make sure
to add an OLS regression line. View this scatter plot again separately for men and women.
*/
proc sgplot data=heart.heart1;
	scatter x=age y=sysbp;
	reg x=age y=sysbp;
run;

proc format;
	value fgender 0 = "Male"
				  1 = "Female";
run;

proc sgplot data=heart.heart1;
	scatter x=age y=sysbp / group=gender;
	reg x=age y=sysbp / group=gender;
	format gender fgender.;
run;


/*
Task 3. 
Calculate mean bmi within levels of gender using the MEANS procedure
*/
proc means data =heart.heart1;
	class gender;
	var bmi;
	format gender fgender.;
run;


/*
Task 4. 
Produce side-by-side histograms of sysbp comparing gender.
*/
proc sgpanel data=heart.heart1;
	panelby gender;
	histogram sysbp;
	density sysbp;
	label sysbp = 'systolic blood pressure';
	format gender fgender.;
run;


/*
Task 5. 
side-by-side boxplots of bmi comparing gender
*/
proc sgplot data=heart.heart1;
	vbox bmi / category = gender;
	label bmi = 'Body Mass Index';
	format gender fgender.;
run;


/*
Task 6. 
Create a two-way frequency table for cohort year and history of cardiovascular disease.
*/
proc freq data=heart.heart1;
	tables year*cvd;
run;


/*
Task 7. 
Create multiple two-way frequency tables for cohort year and atrial fibrillation, cohort year and 
cardiogenic shock, cohort year and congestive heart complications, and cohort year and complete 
heart block.
*/
proc freq data=heart.heart1;
	tables year*(afb sho chf av3);
run;

