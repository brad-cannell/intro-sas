/*************************************************************************************************
Module 2: Descriptive Analysis I

Practice: Graphing Frequencies and Percentages

This code is posted for your benefit; however, I highly recommend that you practice typing your
own SAS programs as well. With the SAS programming language, as with all new languages, immersion 
seems to be the best way to learn.

*************************************************************************************************/

/*
Step 1. Highlight and sumbmit the data step below.
*/
data bmi;
	input id $ sex $ bmi & $23.;
	datalines;
	001 Female Not Overweight or Obese
	002 Male Not Overweight or Obese
	003 Female Underweight
	004 Female Not Overweight or Obese
	005 Female Overweight
	006 Female Overweight
	007 Female Not Overweight or Obese
	008 Male Not Overweight or Obese
	009 Male Not Overweight or Obese
	010 Male Overweight
	011 Female Not Overweight or Obese
	012 Female Not Overweight or Obese
	013 Female Not Overweight or Obese
	014 Female Obese
	015 Male Overweight
	016 Female Overweight
	017 Male Obese
	018 Female .
	019 Male Not Overweight or Obese
	020 Female Obese
run;

/*
Step 2. Create a vertical bar chart for the variable BMI that includes datalables at the end of the bars.
*/



/*
Step 3. Create a horizontal bar chart for the variable BMI that includes a table of frequency statistics.
*/
