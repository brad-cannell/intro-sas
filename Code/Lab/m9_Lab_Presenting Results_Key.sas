/******************************************************************************
Lab Assignment 
Module 9: Effectively Presenting Your Results

In this week’s lab we will practice creating and formatting tables and graphs 
to present data. We will use data from the survey you took on day one of this 
class, and the DFW Temperatures data set. Please complete the following tasks.

This code is posted for your benefit; however, I highly recommend that you 
practice typing your own SAS programs as well. With the SAS programming 
language, as with all new languages, immersion seems to be the best way to 
learn.
******************************************************************************/
libname class "Z:\Dropbox\UNTHSC Admin and Teaching\Courses\5161-Spring 2016\
BACH_EPID 5313\Data\Day one survey\5147";
libname temps "Z:\Dropbox\UNTHSC Admin and Teaching\Courses\5161-Spring 2016\
BACH_EPID 5313\Data\Average Temperatures";
options fmtsearch = (class);



/******************************************************************************
Task 1.
Use SAS to determine the N and Percent of students in each age group, 
race/ethnicity, and marital status within levels of gender. Create a 
demographics table (usually table 1 in publications) that compares the above 
characteristics of male and female students. Your table should include an 
appropriate title and be formatted for publication.
(Note: The variable age is calculated from the variables month and year. You 
should assume that each person was born on the 15th of the month. The 
categories for age are 20-24, 25-29, 30-34, 35-39, and 40+. Secondly, the 
variable race should be separated into non-Hispanic white, non-Hispanic black, 
Hispanic, and Asian.)
******************************************************************************/
proc format;
	value agegroup	1 = "20-24" 
					2 = "25-30" 
					3 = "30+";
	value raceth	1 = "White, non-Hispanic"
					2 = "Black, non-Hispanic"
					3 = "Hispanic"
					4 = "Asian"
					5 = "Other Race, non-Hispanic";
	value married	0 = "Not Currently Married"
					1 = "Currently Married";
run;

data class.classurv16;
	set class.classurv15;

	/* Age Groups */
	if missing(age) then agegroup = .;
	else if 20 <= age < 25 then agegroup = 1;
	else if 25 <= age < 30 then agegroup = 2;
	else agegroup = 3;
	format agegroup agegroup.;

	/* Race / Ethnicity */
	if hispanic = 9 then hispanic = .;
	if race = 9 then race = .;
	if missing(hispanic) | missing(race) then raceth = .;
	else if hispanic = 1 then raceth = 3;
	else if race = 1 then raceth = 1;
	else if race = 2 then raceth = 2;
	else if race = 4 then raceth = 4;
	else raceth = 5;
	format raceth raceth.; 

	/* Marital Status */
	if missing(marital) then married = .;
	else if marital = 1 then married = 1;
	else married = 0;
	format married married.;
run;

* Group n's;
proc freq data = class.classurv16;
	tables gender;
run;

* First attempt;
proc freq data = class.classurv16;
	title1 "5313 Module 9 Lab Task 1";
	title2 "Demographics for Table 1";
	table gender * (agegroup raceth married);
run;

* Second attempt - better; 
ods rtf file = 'C:\Users\mbc0022\Desktop\module_9_lab_task_1.rtf';
proc freq data = class.classurv16;
	title1 "5313 Module 9 Lab Task 1";
	title2 "Demographics for Table 1";
	table (agegroup raceth married) * gender / nopercent norow;
run;
ods rtf close;

* Third attempt - even better (but more programming);
* Run everything down to "ods rtf close";
title;
proc freq data = class.classurv16;
	table agegroup * gender / out = agegroup outpct;
run;
proc freq data = class.classurv16;
	table raceth * gender / out = raceth outpct;
run;
proc freq data = class.classurv16;
	table married * gender / out = married outpct;
run;

data table1 (keep = characteristic gender n_percent);
	length characteristic $21;
	set agegroup raceth married;
	if pct_col = . then delete;
	if agegroup ~= . then characteristic = put(agegroup, agegroup.);
	if raceth ~= . then characteristic = put(raceth, raceth.);
	if married ~= . then characteristic = put(married, married.);
	n_percent = cats(count, 
                     ' (', 
                     put(pct_col, 4.1), 
                     ')');
	label n_percent = "n (%)";
run;

proc sort data = table1;
	by gender;
run;

ods rtf file = 'C:\Users\mbc0022\Desktop\module_9_lab_task_1.rtf';
proc print data = table1 label;
	title1 "5313 Module 9 Lab Task 1";
	title2 "Demographics for Table 1";
run;
ods rtf close;



/******************************************************************************
Task 2.
Create a bar chart that displays the percent of males and females in each age 
group. Create the chart described above in Microsoft Excel and paste it into 
the .docx file you created in Task 1 and save again. Your chart should include 
an appropriate title, axis labels, and be formatted for publication.
******************************************************************************/
proc freq data = class.classurv16;
	title1 "5313 Module 9 Lab";
	title2 "Frequency Table for Task 2";
	table gender*agegroup / out = freq outpct;
run;

/*
In this DATA step we convert gender and agegroup to character variables. The 
new values for these character variables are the character strings from our
formats. In other words, instead of having formatted numeric variables, we
will now have character variables that look like our formats. This is to help
with readability after we export the data to Excel.
*/
data freq;
	format gender_c agegroup_c;
	set freq;
	gender_c = put(gender, gender.);
	agegroup_c = put(agegroup, agegroup.);
run;

proc export 
	data = freq
	dbms = xlsx replace
	outfile = "C:\Users\mbc0022\Desktop\lab9_task2.xlsx"
	replace;
run;



/******************************************************************************
Task 3
Create a line chart that compares the average monthly temperatures for 1995 
and 2012. Months should be on the x-axis, average temperature should be on the 
y-axis. The line graph should have two lines: one for 1995 and one for 2012. 
Include a graph title, a label for each axis, and format the graph so that it 
would be publication ready. Create the chart described above in Microsoft Excel, 
paste it into the .docx file you created in Task 1, and save again.
******************************************************************************/
data temps.lab9_1995 (keep = sort_order month average1995);
	set temps.dfwtemps1995;
	array temps {31} _numeric_;
	do i = 1 to 31;
		if temps{i} = -99 then temps{i} = .;
	end;
	average1995 = round(mean(of temp_f1-temp_f31),.1);
	sort_order = _N_;
run;

data temps.lab9_2012 (keep = sort_order month average2012);
	set temps.dfwtemps2012;
	array temps {31} _numeric_;
	do i = 1 to 31;
		if temps{i} = -999 then temps{i} = .;
	end;
	average2012 = round(mean(of temp_f1-temp_f31),.1);
	sort_order = _N_;
run;

data temps.lab9_both (drop = sort_order);
	merge temps.lab9_1995 temps.lab9_2012;
	by sort_order;
run;

proc print data = temps.lab9_both;
	title1 "5313 Module 9 Lab Task 3";
	title2 "Average Temperatures by Month";
run;

proc export 
	data = temps.lab9_both
	dbms = xlsx replace
	outfile = "C:\Users\mbc0022\Desktop\lab9_task3.xlsx"
	replace;
run;
