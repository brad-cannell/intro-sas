/*************************************************************************************************
Lab Assignment 
Module 7: Working with Multiple SAS Data Sets

Using NHANES Data

This code is posted for your benefit; however, I highly recommend that you practice typing your
own SAS programs as well. With the SAS programming language, as with all new languages, immersion 
seems to be the best way to learn.

*************************************************************************************************/

/*
Task 1. 
Go to the NHANES website. Download the following SAS Transport Files (.xpt) for the year 2011-2012: 
	a. Demographics
	b. Examination
		i. Blood Pressure
		ii. Body Measures
	c. Laboratory
		i. Serum Cotinine and Urinary Total NNAL
	d. Questionnaire
		i. Alcohol Use
		ii. Medical Conditions
		iii. Drug Use (Ages 18+)
		iv. All three smoking files.

*/


/*
Task 2.
Convert these 10 SAS Transport Files into temporary SAS data sets.
*/
/*
Do this by opening the folder containing the .xpt files we just downloaded. When you double click
on those .xpt files, it should create new data sets in the work library.
*/


/*
Task 3.
Create a contents report of your work library. Familiarize yourself with the variables in
each data set.
*/



/*
Task 5. 
Create a new SAS library called NHANES. Merge the 10 data sets above into a new data set called 
NHANES and store it in the library called NHANES. Create a contents report to look at the 
variables in the merged data set with the variables in order. 
*/



/*
Task 6. 
On the NHANES website, save the text file containing the NHANES I Epidemiologic Followup Study 
data set n87int.txt. Copy the SAS input statement from the NHANES website and paste it into 
your SAS program. Create a new SAS data set called nhanes.nhefs1987 from n87int.txt. Make sure 
to drop every variable that starts with the word “blank” using the DROP = data set option. 
*/



/*
Task 7. 
On the NHANES website, save the text file containing the NHANES I Epidemiologic Followup Study 
data set N92int.txt. Copy the SAS input statement from the NHANES website and paste it into 
your SAS program. Create a new SAS data set called nhanes.nhefs1992 from N92int.txt. Make sure 
to drop every variable that starts with the word “blank” using the DROP = data set option. 
Rename the sample sequence number variable so that it has the same name in nhanes.nhefs1987 
and nhanes.nhefs1992.
*/



/*
Task 8. 
Interleave nhanes.nhefs1987 with nhanes.nhefs1992 to create a single new SAS data set called 
nhanes.nhefs1. View the descriptor portion of nhanes.nhefs1.
*/



/*
Task 9. 
Create a list report for the first 10 observations in nhanes.nhefs1. Include only the variables 
that contain the following information:
•	Sample Sequence Number
•	Year of interview
•	Average number of hours a week the participant works
*/



/*
Task 10. 
Create a new data set called nhanes.nhefs2 from nhanes.nhefs1. Keep only the variables you viewed 
in the list report you created in Task 9. Recode inapplicable, refused, don’t know, and not 
ascertained to a missing value for all participants. 
*/



/*
Task 11. 
Use the TRANSPOSE procedure to restructure nhanes.nhefs2 from long to wide. Create a calculated 
variable that contains the difference in the average number of hours per week worked in 1987 and 
the average number of hours worked per week in 1992 for each participant (ignore 1988 and 1993). 
*/


