/*************************************************************************************************
Lab Assignemnt
Module 6: Iterative Processing and Arrays

This code is posted for your benefit; however, I highly recommend that you practice typing your
own SAS programs as well. With the SAS programming language, as with all new languages, immersion 
seems to be the best way to learn.

*************************************************************************************************/

/*
Task 1. 
Get the data sets named dfwtemps2012, students, and speed from the course website and 
import them into SAS
*/
libname temps "Z:\Dropbox\UNTHSC Admin and Teaching\Courses\5147-Fall 2014\BACH_EPID 5313\Data\Average Temperatures\";
libname	student "Z:\Dropbox\UNTHSC Admin and Teaching\Courses\5147-Fall 2014\BACH_EPID 5313\Data\Students\";
libname speed "Z:\Dropbox\UNTHSC Admin and Teaching\Courses\5147-Fall 2014\BACH_EPID 5313\Data\Speed";

proc import out = speed.speed1
	datafile = "Z:\Dropbox\UNTHSC Admin and Teaching\Courses\5147-Fall 2014\BACH_EPID 5313\Data\Speed\Speed.xls"
	dbms = XLS replace;
run;


/*
Task 2. 
Use ARRAYS and DO loops to recode the variables SATS1 and SATS2 in the students data set. 
Recode the values 7, 8, and 9 to missing.
*/
*Starting with an example of the naive way of programming this task;



/*
Task 3. 
Create a list report that shows the values of SATS1 and SATS2 were properly recoded. 
Give the report a descriptive title, a subtitle with your name, and a footnote with the current 
date and time.
*/



/*
Task 4. 
Use ARRAYS and DO loops to create five new variables called nx1-nx5 as the squared value 
of the variables x1-x5 in the speed data set. Use ARRAYS and DO loops to create three new 
variables called ny1-ny3 as the square root of the variables y1-y3 in the speed data set.
*/

*Create NX1-NX5;


*Create NY1-NY3;



/*
Task 5. 
Create a list report that includes the variables you just created. Give the report a 
descriptive title, a subtitle with your name, and a footnote with the current date and time.
*/



/*
Task 6. 
Figure out the variables that have missing values that need to be recoded to “.” in the 
dfwtemps2012 data set. Use an ARRAY and DO loop to recode all missing values to “.” Drop the 
index variable from your data set. Create a list report that shows that all the missing values 
were properly recoded. Give the report a descriptive title, a subtitle with your name, and a 
footnote with the current date and time.
*/



/*
Task 7. 
Continuing to use the dfwtemps2012 data set, use ARRAYs and DO loops to create new 
variables containing the average daily temperatures in Celsius. Create a list report that 
includes the temperature variables you just created. Add the appropriate titles and footnotes to 
the list report.
*/



/*
Task 8. 
You look back at the original assignment and notice that there is a note written on the 
top to correct the following mistakes.

Mistake 1: The values for the temperature in Fahrenheit for the first 15 days of all months were 
entered 1 degree (Fahrenheit) higher than the actual temperature. (i.e. if the actual temperature 
was 44.4 degrees, then the entered value in the data set was 45.4 degrees)

Mistake 2: For all other days in all months, the value was entered 1 degree (Fahrenheit) lower 
than the actual temperature. (i.e. if the actual temperature was 45.8 degrees, then the value 
entered in the data set was 44.8 degrees)

Now it’s your responsibility to correct these mistakes in SAS, and record the actual temperatures 
in Fahrenheit. Please use ARRAYs to make the new variables when completing this task.
*/











