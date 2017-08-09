/*************************************************************************************************
Lab Assignment 8: Descriptive Analysis II

	*Use PROC CORR
	*Create a scatter plot
	*Create a bar chart
	*Create multi-way frequency reports

This code is posted for your benefit; however, I highly recommend that you practice typing your
own SAS programs as well. With the SAS programming language, as with all new languages, immersion 
seems to be the best way to learn.

*************************************************************************************************/

*Example 1: As X increases, Y always increases by the same amount;
data one;
	input x y;
	datalines;
	1 10
	2 20
	3 30
	4 40
	5 50
	6 60
run;

*Create a scatter plot;
proc sgplot data = one;
	scatter x = x y = y;
run;

*Compute the sample correlation coefficient;
proc corr data = one;
	var x y;
run;




*Example 2: As X increases, Y always increases by varying amounts;
data two;
	input x y;
	datalines;
	1 11
	2 26
	3 25
	4 45
	5 57
	6 60
run;

*Create a scatter plot;
proc sgplot data = two;
	scatter x = x y = y;
run;

*Compute the sample correlation coefficient;
proc corr data = two;
	var x y;
run;




*Example 3: As X goes decreases, Y always decreases by the same amount;
data three;
	input x y;
	datalines;
	-1 -10
	-2 -20
	-3 -30
	-4 -40
	-5 -50
	-6 -60
run;

*Create a scatter plot;
proc sgplot data = three;
	scatter x = x y = y;
run;

*Compute the sample correlation coefficient;
proc corr data = three;
	var x y;
run;




*Example 4: As X increases, Y always decreases by the same amount;
data four;
	input x y;
	datalines;
	1 60
	2 50
	3 40
	4 30
	5 20
	6 10
run;

*Create a scatter plot;
proc sgplot data = four;
	scatter x = x y = y;
run;

*Compute the sample correlation coefficient;
proc corr data = four;
	var x y;
run;




*Example 5: X and Y are random variables;
data five;
	do i = 1 to 100;
		x = ranuni(13487);
		y = ranuni(94357);
		output;
	end;	
run;

*Create a scatter plot;
proc sgplot data = five;
	scatter x = x y = y;
run;

*Compute the sample correlation coefficient;
proc corr data = five;
	var x y;
run;




*Multi-way tables


/*Task 1.	Practice using an interpreting PROC CORR and scatter plots in SAS. For each of 
the following example data sets:
a.	Create a scatter plot
b.	Compute the sample correlation coefficient
c.	Test the H0: rho=0 at the .05 level of significance and state your conclusions
d.	Determine the p-value for the test*/

*Import Data Set 1;
proc import out = brown
	datafile = "\\hscms8\SAS_Class\mbc0022\Data\Lab 8\Brown.xlsx"
	dbms = xlsx replace;
	sheet = 'SHEET1';
	getnames = yes;
	mixed = yes;
run;

proc print data = brown;
run;

*Create a scatter plot;
proc sgplot data = brown;
	scatter x = age y = billirubin;
run;

*Compute the sample correlation coefficient;
proc corr data = brown;
	var age billirubin;
run;

*Import Data Set 2;
proc import out = parker
	datafile = "\\hscms8\SAS_Class\mbc0022\Data\Lab 8\Parker.xlsx"
	dbms = xlsx replace;
	sheet = 'SHEET1';
	getnames = yes;
	mixed = yes;
run;

proc print data = parker;
run;

*Create a scatter plot;
proc sgplot data = parker;
	scatter x = water y = gfj;
run;

*Compute the sample correlation coefficient;
proc corr data = parker;
	var water gfj;
run;




/*Task 2: Create a scatter plot;
	a. Explore the relationship between age and systolic blood pressure by creating a scatter plot.
	b. Answer Q3 on the homework assignment 7 quiz. 
	c. View this scatter plot again separately for men and women. 
	d. Answer Q4 on the lab assignment 8 quiz. 
	e. View this scatter plot again by adding a Lowess curve and labeling the data. 
	f. Answer Q5 on the lab assignment 8 quiz.*/

proc print data=ntrhd.whas;
run;

proc sgplot data=ntrhd.whas;
	scatter x = age y = bmi;
run;

proc sgplot data=ntrhd.whas;
	scatter x = age y = bmi / group = sho;
run;

proc sgplot data=ntrhd.whas;
	scatter x = age y = sysbp;
	loess x = age y = sysbp;
run;




/*Task 3. Create vertical bar charts 
	a. Produce two vertical bar charts for MI type using sgplot and gchart. */

proc sgplot data=ntrhd.whas;
	vbar mitype;
run;

proc gchart data=ntrhd.whas;
	vbar mitype / discrete;
run;




/*Task 4. Produce horizontal bar charts 
	a. Produce two horizontal bar charts for MI order using sgplot and gchart.*/

proc sgplot data=ntrhd.whas;
	hbar miord;
run;

proc gchart data=ntrhd.whas;
	hbar miord / discrete;
run;




/*Task 5. Using two-way frequency tables 
	a. Produce a two-way frequency table for cohort year and history of cardiovascular disease.*/

proc freq data = ntrhd.whas;
	tables year*cvd;
run;

/*Task 6. Multi two-way frequency tables 
	a. Produce multi two-way frequency tables for cohort year and atrial fibrillation, 
	cohort year and cardiogenic shock, cohort year and congestive heart complications, 
	and cohort year and complete heart block.*/

proc freq data = ntrhd.whas;
	tables year*(afb sho chf av3);
run;
