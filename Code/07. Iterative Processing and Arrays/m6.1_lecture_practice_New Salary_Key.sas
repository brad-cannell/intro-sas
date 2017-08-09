/*************************************************************************************************
Module 6: Iterative Processing and Arrays

Practice: Increase Salary

This code is posted for your benefit; however, I highly recommend that you practice typing your
own SAS programs as well. With the SAS programming language, as with all new languages, immersion 
seems to be the best way to learn.

*************************************************************************************************/

/*
Step 1. Write a SAS program that uses a DO loop to display the new salary at the end of each year 
for 10 years.
*/
data salary;
	salary = 40000;
	do year = 1 to 25;
		salary + salary*0.02;
		output;
	end;
	format salary dollar10.2;
run;


/*
Step 2. Create a list report that displays your results.
*/
proc print data = salary noobs;
	title "New Salary at the End of Each Year for 25 Years";
	footnote "&sysdate at &systime";
	id year;
run;



