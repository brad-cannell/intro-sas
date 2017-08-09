/*************************************************************************************************
Lab Assignment 
Module 11: Analyzing Weighted Survey Data

In today’s lab you will use data from the 2012 Behavioral Risk Factor Surveillance System (BRFSS), 
and from the 2009-2010 National Health and Nutrition Examination Survey (NHANES), and the 2011 
Youth Risk Behavior Surveillance System (YRBSS). Both the BRFSS and the YRBSS are publicly 
available via the CDC website. You will perform descriptive statistics with survey weights, 
and become familiar with these data sets. Please use the documentation on each data set, via 
their websites, to correctly get the data into SAS and analyze the data using survey weights. 
Please complete the following tasks.

This code is posted for your benefit; however, I highly recommend that you practice typing your
own SAS programs as well. With the SAS programming language, as with all new languages, immersion 
seems to be the best way to learn.

*************************************************************************************************/

/*
Task 1. 
Please go to the BRFSS website, download the 2012 BRFSS transport file, and accompanying codebook. 
Unzip the SAS transport file you just downloaded. Double click the SAS transport file to read it 
into your work library. Use a data step to store the data in a permanent library. 
*/



/*
Task 2.
Create a new data set that only contains responses for the state of Texas. Create a frequency 
report for the variable that measures whether the participant has ever had a myocardial 
infarction.
*/



/*
Task 3.	
Produce a two-way frequency report of sex by myocardial infarction.
*/



/*
Task 4.	
Calculate the mean of number of drinks in the past 30 days by sex. Use PROC SURVEYFREQ to 
test for a significant difference in alcoholic drink consumption by sex.
*/



/****************************************************************************************/
/*  This SAS program creates a permanent SAS format library that is used to analyze to  */
/*  analyze the 2011 YRBSS dataset.                                                      */
/*                                                                                      */
/*  Change the file location specification from "c:\yrbs2011" to the location where you */
/*  want the format library to be stored before you run this program.  Change the       */
/*  location specification in the "library" statement at the top of the program.        */
/*                                                                                      */
/*  Note: Run "YRBS_2011_SAS_Format_Program.sas" BEFORE you run                         */
/*  "YRBS_2011_SAS_Input_Program.sas" to create the 2011 YRBS dataset.                  */
/****************************************************************************************/


/****************************************************************************************/
/*  This SAS program reads ASCII format (text format) 2011 YRBS data and creates a      */
/*  formatted and labeled SAS dataset.                                                  */
/*                                                                                      */
/*  Change the file location specifications from "c:\yrbs2011" to the location where 	*/
/*  you have stored the YRBS ASCII data file and the format library before you run this */
/*  program.  Change the location specification in three places - in the "filename"     */
/*  statement and in the two "libname" statements at the top of the program.            */
/*                                                                                      */
/*  Note: Run "YRBS_2011_SAS_Format_Program.sas" BEFORE you run                         */
/*  "YRBS_2011_SAS_Input_Program.sas" to create the 2011 YRBS dataset.                  */
/****************************************************************************************/

/*
Task 5.	
Please go to the YRBSS website. Please use the YRBSS instructions and
SAS code to covert the 2011 YRBSS data into a SAS data set. 
Produce a frequency report for the variable Q85.
*/



/*
Task 6.	
Produce a two-way frequency report for Q2 by Q29.
*/


/*
Task 7.	
Calculate the mean of the variable Q7.
*/



/*
Task 8. 
Please go to the NHANES website. Download the Demographics SAS Transport File (.xpt) for the year 
2009-2010. Create a two-way frequency table for gender by language of the sample person interview.
Assume that language of the sample person interview is a perfect proxy measure of primary language 
spoken.
*/




