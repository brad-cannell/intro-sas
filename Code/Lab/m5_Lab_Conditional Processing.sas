/*************************************************************************************************
Lab Assignemnt
Module 5: Conditional Processing

This code is posted for your benefit; however, I highly recommend that you practice typing your
own SAS programs as well. With the SAS programming language, as with all new languages, immersion 
seems to be the best way to learn.

*************************************************************************************************/

/*
Task 1. Import the Excel file called 5313 Survey 5147.XLS as a new SAS data set named classurv1 
in a new SAS library named classurv.
*/



/*
Task 2. Using the KEEP statement in a DATA step, subset the data to contain only the variables 
for the following questions (HINT: Some of the variable names in the survey data set may be 
slightly different than the variable names listed in the codebook): Insurance, personal doctor,
veteran, marital status, employment, salary, year born, month born, gender.
*/



/*
Task 3. 
Create user-defined formats for the values of all categorical variables in the data set (i.e. 
NOT salary or year of birth).
*/



/*
Task 4. 
Create a new data set named classurv3. Use the RENAME statement to give each variable a short 
(but meaningful) name. For example, “insurance” or “pers_doc.” Then apply labels to the variable 
names. Finally, in the same DATA step, apply the user-defined formats you created as well as an 
appropriate SAS format to the values of the annual salary variable.
*/

*Load formats in memory;


*Rename variables and Apply Formats;
*http://support.sas.com/documentation/cdl/en/lrcon/62955/HTML/default/viewer.htm#a000695119.htm;



/*
Task 5. 
Create a new data set named classsurv4. Recode the values in the year of birth variable to the 
actual year of birth, as opposed to the coded value for the year of birth. (HINT: This should 
only require one line of code).
*/ 



/*
Task 7. 
Create a data set named classsurv5. In the same DATA step create a new calculated variable that 
contains each student’s date of birth. Name the variable dob and assume each student was born on 
the 15th day of the month. Additionally, create another calculated variable that contains the age 
of each student (as of their last birthday) at the time of the survey (Assume everyone took the 
survey on the first day of class, August 20, 2014). Name this variable age. 
*/


/*
Task 8. 
Determine the average age of students on the first day of class.
*/



/*
Task 10. Determine quartiles of the variable for annual salary. 
*/



/*
Task 11. Create a new SAS data set called classurv6. Use conditional processing to categorize participants into groups defined by quartiles of salary.
*/



/*
Task 12. Create a list report to view the continuous salary variable and the categorized salary variable only. 
*/



/*
Task 13. Determine the percentage of participants in each of the salary categories.
*/


/*
Task 14. 
Using the WHERE statement, create a list report that includes only males who are employed for wages 
or whose annual salary is between $15,000 and $25,000. This list report should include only the 
obs column, and the variables for gender, employment status, and annual salary, in the given 
order.
*/



/*Task 15. 
Create a new SAS data set called classurv7. In the same DATA step create a midterm exam weight 
variable and a final exam weight variable. For males the midterm is worth 40% and the final 
is worth 60%. For females the midterm is worth 60% and the final is worth 40%.
*/



/*
Task 16.
Create a list report that includes the variables for gender, midterm weight, and final weight.
*/

