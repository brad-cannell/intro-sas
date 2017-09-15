* ============================================================================;
* Lab: Conditional Processing

* This code is posted for your benefit. However, I highly recommend that you 
* practice typing your own SAS programs as well. With the SAS programming 
* language, as with all new languages, immersion seems to be the best way to 
* learn.
* ============================================================================;


* Task 1. 
* Import the file called Class Survey 5141.csv as a new SAS data set called 
* classurv1 in a new SAS library called classurv.;
libname classurv "C:\Users\mbc0022\Desktop";

proc import out = classurv.classurv1
	datafile    = "C:\Users\mbc0022\Desktop\Class Survey 5141.csv"
	dbms        = csv replace;
	datarow     = 3;
run;


* Task 2. 
* Using the KEEP statement in a DATA step, subset the data to contain 
* only the variables for the following questions (HINT: Some of the variable 
* names in the survey data set may be slightly different than the variable names 
* listed in the codebook): Insurance, personal doctor, veteran, marital status, 
* employment, salary, year born, month born, gender.;
data classurv.classurv2;
	set classurv.classurv1;
	keep q13 q14 q17 q18 q20 q21_1 q24 q25 q26;
run;


* Task 3. 
* Create user-defined formats for the values of all categorical variables in the 
* data set (i.e. NOT salary or year of birth).;
proc format;
	value	standard01_	0 = 'No'
						1 = 'Yes';

	value	reason		1 = 'Required for graduation'
						2 = 'Personal interest'
						3 = 'Improve employment opportunities'
						4 = 'To analyze data for my current research';

	value 	reason2_	1 = 'Personal interest'
						2 = 'Improve employment opportunities'
						3 = 'To analyze data for my current research';

	value	packages	1 = 'SAS'
						2 = 'SPSS'
						3 = 'Stata'
						4 = 'R'
						5 = 'Other';
	
	value	genhealth	1 = 'Excellent'
						2 = 'Very Good'
						3 = 'Good'
						4 = 'Fair'
						5 = 'Poor';

	value	seatbelt	1 = 'Always'
						2 = 'Nearly Always'
						3 = 'Sometimes'
						4 = 'Seldom'
						5 = 'Never';
				
	value	persdoc		0 = 'No'
						1 = 'Only one'
						2 = 'More than one';

	value	race		1 = 'White'
						2 = 'Black'
						3 = 'AI/AN'
						4 = 'Asian'
						5 = 'PI'
						6 = 'Other';

	value	marital		1 = 'Married'
						2 = 'Divorced'
						3 = 'Widowed'
						4 = 'Separated'
						5 = 'Never Married';

	value 	employ		1 = 'Empoyed for wages'
						2 = 'Self-employed'
						3 = 'Out of work >= 1'
						4 = 'Out of work < 1'
						5 = 'Homemaker'
						6 = 'Student'
						7 = 'Retired'
						8 = 'Unable to work';
				
	value	income		1 = '0-25'
						2 = '25001-50'
						3 = '50001-75'
						4 = '75001-100'
						5 = '100001-125'
						6 = '125001-150'
						7 = '150001-175'
						8 = '175001-200'
						9 = '200001+';
				
	value	month		1 = 'January'
						2 = 'February'
						3 = 'March'
						4 = 'April'
						5 = 'May'
						6 = 'June'
						7 = 'July'
						8 = 'August'
						9 = 'September'
						10 = 'October'
						11 = 'November'
						12 = 'December';
				
	value	gender		1 = 'Female'
						2 = 'Male';

	value 	color		1 = 'Black'
						2 = 'Blue'
						3 = 'Gray'
						4 = 'Green'
						5 = 'Orange'
						6 = 'Pink'
						7 = 'Purple'
						8 = 'Red'
						9 = 'White'
						10 = 'Yellow';

	value bmi			1 = 'Underweight'
						2 = 'Healthy weight'
						3 = 'Overweight'
						4 = 'Obese';

	value raceth		1 = 'White, non-Hispanic'
						2 = 'Black, non-Hispanic'
						3 = 'Hispanic, any race'
						4 = 'Other race, non-Hispanic';
run;


* Task 4. 
* Create a new data set named classurv3. Use the RENAME statement to give each 
* variable a short (but meaningful) name. For example, "insurance" or "pers_doc." 
* Then apply labels to the variable names. Finally, in the same DATA step, apply 
* the user-defined formats you created as well as an appropriate SAS format to 
* the values of the annual salary variable.;


* Rename variables and Apply Formats;
* http://support.sas.com/documentation/cdl/en/lrcon/62955/HTML/default/
viewer.htm#a000695119.htm;
data classurv.classurv3;
	set classurv.classurv2;
	rename	q13   = ins       /* RENAME statement does not change appearance of */ 
			q14   = persdoc   /* Viewtable Window - Labels */
			q17   = veteran
			q18   = marital
			q20   = employ
			q21_1 = salary
			q24   = year
			q25   = month
			q26   = gender;

	label	q13   = "Any Insurance"
			q14   = "Personal Doctor"
			q17   = "Veteran Status"
			q18   = "Marital Status"
			q20   = "Employment Status"
			q21_1 = "Annual Salary"
			q24   = "Year of Birth"
			q25   = "Month of Birth"
			q26   = "Gender";

	format	q13   standard01_.
			q14   persdoc.
			q17   standard01_.
			q18   marital.
			q20   employ.
			q21_1 dollar10.2
			q25   month.
			q26   gender.;
			
run;

proc print data = classurv.classurv3;
	title1 "Checking the Edits to the Class Survey Data";
	footnote "&sysdate at &systime";
run;


* Task 5. 
* Create a new data set named classsurv4. Recode the values in the year of birth 
* variable to the actual year of birth, as opposed to the coded value for the 
* year of birth. (HINT: This should only require one line of code).; 
data classurv.classurv4;
	set classurv.classurv3;
	year = year + 1949;
run;

*Can also use a SUM function;
data classurv.classurv4;
	set classurv.classurv3;
	year = sum(year, 1949);
run;

*Can also use a SUM statement;
data classurv.classurv4;
	set classurv.classurv3;
	year + 1949;
run;

proc print data = classurv.classurv3;
	title1 "Comparing classurv3 to classurv4";
	footnote "&sysdate at &systime";
run;

proc print data = classurv.classurv4;
	title1 "Comparing classurv3 to classurv4";
	footnote "&sysdate at &systime";
run;


* Task 7. 
* Create a data set named classsurv5. In the same DATA step create a new 
* calculated variable that contains each student's date of birth. Name the 
* variable dob and assume each student was born on the 15th day of the month. 
* Additionally, create another calculated variable that contains the age of each 
* student (as of their last birthday) at the time of the survey (Assume everyone 
* took the survey on January 10, 2014). Name this variable age.;
data classurv.classurv5;
	set classurv.classurv4;
	dob = mdy(month, 15, year);
	age = int(yrdif(dob, '10JAN2014'd, 'Actual'));
run;


* How many missing observations are there for the variable age?;
proc print data = classurv.classurv5;
	where age = .;
run;


* Task 8. 
* Determine the average age of students on the first day of class.;
proc means data = classurv.classurv5;
	var age;
	title1 "Average Age of Students on the First Day of Class";
	footnote "&sysdate at &systime";
run;

* Task 9. 
* Create a histogram that depicts the distribution of students’ salaries.;
proc sgplot data = classurv.classurv5;
	histogram salary;
	density salary;
	title "Histogram of Salary on First Day of Class";
	footnote "&sysdate at &systime";
run;


* Task 10. Determine quartiles of the variable for annual salary.;
proc univariate data = classurv.classurv5;
	var salary;
	ods select quantiles; /*Display only the quantiles table from PROC UNIVARIATE*/
	title1 "Determine Quartiles of Annual Salary";
	footnote "&sysdate at &systime";
run;


* Task 11. 
* Create a new SAS data set called classurv6. Use conditional 
* processing to categorize participants into groups defined by quartiles of 
* salary;
data classurv.classurv6;
	set classurv.classurv5;
	if missing(salary) then salary4cat = .;
	else if (0 <= salary < 2500) then salary4cat = 1;
	else if (2500 <= salary < 11492) then salary4cat = 2;
	else if (11492 <= salary < 39130) then salary4cat = 3;
	else if salary >= 39130 then salary4cat = 4;
run;


* Task 12. 
* Create a list report to view the continuous salary variable and the 
* categorized salary variable only.;
proc print data = classurv.classurv6;
	var salary salary4cat;
	title1 "Comparing Salary and Salary4cat";
	footnote "&sysdate at &systime";
run;


* Task 13. 
* Determine the percentage of participants in each of the salary categories.;
proc freq data = classurv.classurv6;
	tables salary4cat * gender;
	title1 "Percentage of Students in each Category of Salary";
	title2 "By Gender";
	footnote "&sysdate at &systime";
run;

* Task 13: Alternative way of categorizing salary and viewing one-way 
* frequency report;
proc format;
	value	salary	low-1 = '1st Quartile'
					1-<10046 = '2nd Quartile'
					10046-<38813 = '3rd Quartile'
					38813-high = '4th Quartile';
run;

proc freq data = classurv.classurv6;
	tables salary * gender;
	format salary salary.;
	title1 "Percentage of Students in each Category of Salary";
	title2 "By Gender";
	footnote "&sysdate at &systime";
run;


* Task 14. 
* Using the WHERE statement, create a list report that includes only females 
* who are between 22 and 24 years old (inclusive). This list report should 
* include only the obs column, and the variables for gender, and age, in the 
* given order.;
proc print data = classurv.classurv6;
	where gender = 1 & (age between 22 and 24);
	var gender age;
	title1 "List Report of Females who are Between the ages of 22 and 24";
	footnote "&sysdate at &systime";
run;


* Task 15. 
* Create a new SAS data set called classurv7. In the same DATA step create a 
* midterm exam weight variable and a final exam weight variable. For males the 
* midterm is worth 40% and the final is worth 60%. For females the midterm is 
* worth 60% and the final is worth 40%.;
data classurv.classurv7;
	set classurv.classurv6;
	if gender = 1 then
		do;
			midterm = .6;
			final   = .4;
		end;
	else if gender = 2 then
		do;
			midterm = .4;
			final   = .6;
		end;
run;


* Task 16.
* Create a list report that includes the variables for gender, midterm weight, 
* and final weight.;
proc print data = classurv.classurv7;
	var gender midterm final;
	title1 "List Report of Exam Weights";
	footnote "&sysdate at &systime";
run;
