/*************************************************************************************************
Module 6: Iterative Processing and Arrays

Practice: Display number of days that make up years

This code is posted for your benefit; however, I highly recommend that you practice typing your
own SAS programs as well. With the SAS programming language, as with all new languages, immersion 
seems to be the best way to learn.

*************************************************************************************************/

/*
Step 1. Write a SAS program that uses a DO loop to display the number of days that have passed at
the end of each year for 10 years.
*/
data years;
	do year = 1 to 10;
		days = year * 365.25;
		output;
	end;
run;


/*
Step 2. Create a list report that displays your results.
*/
proc print data = years noobs;
	title "Number of Days That Have Passed at the End of Each Year for 10 Years";
	footnote "&sysdate at &systime";
	id year;
run;



