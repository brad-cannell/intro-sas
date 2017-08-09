/******************************************************************************
Module 2: Descriptive Analysis I

Graphical Descriptions of Categorical Variables

This code is posted for your benefit; however, I highly recommend that you 
practice typing your own SAS programs as well. With the SAS programming 
language, as with all new languages, immersion seems to be the best way to 
learn.
******************************************************************************/

data bmi;
	input id $ sex $ bmi & $23.;
	datalines;
	001 Female Not Overweight or Obese
	002 Male Not Overweight or Obese
	003 Female Not Overweight or Obese
	004 Female Not Overweight or Obese
	005 Female Not Overweight or Obese
	006 Female Overweight
	007 Female Not Overweight or Obese
	008 Male Not Overweight or Obese
	009 Male Not Overweight or Obese
	010 Male Overweight
	011 Female Not Overweight or Obese
	012 Female Not Overweight or Obese
	013 Female Not Overweight or Obese
	014 Female Not Overweight or Obese
	015 Male Overweight
	016 Female Overweight
	017 Male Obese
	018 Female .
	019 Male Not Overweight or Obese
	020 Female Obese
run;

* Create a frequency report for bmi in this sample;
proc freq data = bmi;
	table bmi;
run;


* Vertical bar charts for categorical variables;
proc sgplot data = bmi;
	vbar bmi;
run;

proc gchart data = bmi;
	vbar bmi;
run;

proc sgplot data = bmi;
	vbar bmi / datalabel; * Values for BMI are added to the end of each bar;
run;


* Horizontal bar charts for categorical variables;
proc sgplot data = bmi;
	hbar bmi;
run;

proc gchart data = bmi;
	hbar bmi;
run;

























