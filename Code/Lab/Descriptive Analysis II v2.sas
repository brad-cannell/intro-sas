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

*Import WHAS 500 Data Set;
proc import out = ntrhd.whas
	datafile = "\\hscms8\SAS_Class\mbc0022\Data\WHAS\whas500.xls"
	dbms = xls replace;
	sheet = 'WHAS500';
	getnames = yes;
	mixed = yes;
run;

proc print data = ntrhd.whas;
run;

/*Task 1: Use the CORR Procedure;
	a. Explore the relationship between age and initial heart rate.
	b. Examine the correlation coefficient and the p-value.*/

proc corr data = ntrhd.whas;
	var age hr;
run;

/*Task 2: Create a scatter plot;
	a. Explore the relationship between age and systolic blood pressure by creating a scatter plot.
	b. Answer Q3 on the homework assignment 7 quiz. 
	c. View this scatter plot again separately for men and women. 
	d. Answer Q4 on the lab assignment 8 quiz. 
	e. View this scatter plot again by adding a Lowess curve and labeling the data. 
	f. Answer Q5 on the lab assignment 8 quiz.*/

proc sgplot data=ntrhd.whas;
	scatter x = age y = sysbp;
run;

proc sgplot data=ntrhd.whas;
	scatter x = age y = sysbp / group = gender;
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
