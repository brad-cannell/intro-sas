
* ============================================================================;
* Lab: Effectively Presenting Your Results

* This code is posted for your benefit. However, I highly recommend that you 
* practice typing your own SAS programs as well. With the SAS programming 
* language, as with all new languages, immersion seems to be the best way to 
* learn.
* ============================================================================;


proc format;
	value gender	1 = 'Female'
					2 = 'Male';

	value agegroup	1 = "20-24" 
					2 = "25-30" 
					3 = "30+";

	value race_eth	1 = "White, non-Hispanic"
					2 = "Black, non-Hispanic"
					3 = "Hispanic"
					4 = "Asian"
					5 = "Other Race, non-Hispanic";

	value married	0 = "Not Currently Married"
					1 = "Currently Married";
run;

* Task 1.
* Use SAS to determine the N and Percent of students in each age group, 
* race/ethnicity, and marital status within levels of gender. Create a 
* demographics table (usually table 1 in publications) that compares the above 
* characteristics of male and female students. Create the table described above 
* in Microsoft Word and save it as a .docx file. Your table should include an 
* appropriate title and be formatted for publication.

* Note: The variable age is calculated from the variables month and year. You 
* should assume that each person was born on the 15th of the month, and we 
* want their age as of the first day of class (Assume everyone took the survey 
* on January 10, 2014). The categories for age are 20-24, 25-29, and 30+. The 
* variable race_eth should include the following categories: non-Hispanic white, 
* non-Hispanic black, Hispanic, and Asian non-Hispanic. Finally, 
* marital status should include the following categories: currently married, 
* not currently married.
* ============================================================================;
proc import 
	out = class
	datafile = "C:\Users\Mbc0022\Desktop\Class Survey 5141.csv"
	dbms = csv replace;
	datarow = 3;
run;

data class2
	(keep = marital hispanic race birth_year birth_month gender age agegroup
			race_eth married);

	set class
	(rename = (q18 = marital 
			   q15 = hispanic 
               q16 = race
			   q24 = birth_year
			   q25 = birth_month
			   q26 = gender)); 

	/* Create age variable */
	birth_year = birth_year + 1949;
	dob = mdy(birth_month, 15, birth_year);
	age = int(yrdif(dob, '10JAN2014'd, 'Actual'));

	/* Create age groups variable */
	if missing(age) then agegroup = .;
	else if 20 <= age < 25 then agegroup = 1;
	else if 25 <= age < 30 then agegroup = 2;
	else agegroup = 3;

	/* Create race / ethnicity variable */
	if hispanic = 9 then hispanic = .;
	if race = 9 then race = .;
	if missing(hispanic) | missing(race) then race_eth = .;
	else if hispanic = 1 then race_eth = 3;
	else if race = 1 then race_eth = 1;
	else if race = 2 then race_eth = 2;
	else if race = 4 then race_eth = 4;
	else race_eth = 5;

	/* Create married variable */
	if missing(marital) then married = .;
	else if marital = 1 then married = 1;
	else married = 0;
run;

* Group n's;
proc freq data = class2;
	tables gender;
	format gender gender.;
run;

* First attempt;
proc freq data = class2;
	title1 "5313 Lab Task 1";
	title2 "Demographics for Table 1";
	table gender * (agegroup race_eth married);
	format gender gender. 
		   agegroup agegroup. 
		   race_eth race_eth. 
		   married married.;
run;

* Second attempt - better; 
ods rtf file = 'C:\Users\mbc0022\Desktop\module_9_lab_task_1.rtf';
proc freq data = class2;
	title1 "5313 Lab Task 1";
	title2 "Demographics for Table 1";
	table (agegroup race_eth married) * gender / nopercent norow;
	format gender gender. 
		   agegroup agegroup. 
		   race_eth race_eth. 
		   married married.;
run;
ods rtf close;

* Third attempt - even better (but more programming);
* Run everything down to "ods rtf close";
title;
proc freq data = class2;
	table agegroup * gender / out = agegroup outpct;
	format gender gender. 
		   agegroup agegroup.;
run;
proc freq data = class2;
	table race_eth * gender / out = race_eth outpct;
	format gender gender.
		   race_eth race_eth.;
run;
proc freq data = class2;
	table married * gender / out = married outpct;
	format gender gender. 
		   married married.;
run;

data table1 (keep = characteristic gender n_percent);
	length characteristic $21;
	set agegroup race_eth married;
	if pct_col = . then delete;
	if agegroup ~= . then characteristic = put(agegroup, agegroup.);
	if race_eth ~= . then characteristic = put(race_eth, race_eth.);
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
	title1 "5313 Lab Task 1";
	title2 "Demographics for Table 1";
run;
ods rtf close;


* Task 2.
* Create a bar chart that displays the percent of males and females in each 
* age group. Create the chart described above in Microsoft Excel or in SAS. 
* Paste it into the .docx file you created in Task 1, and save again. Your 
* chart should include an appropriate title, axis labels, and be formatted for 
* publication.
* ============================================================================;
proc freq data = class2;
	title1 "5313 Lab";
	title2 "Frequency Table for Task 2";
	table gender * agegroup / out = freq outpct;
	format gender gender. 
		   agegroup agegroup.;
run;


* Output to Excel;
* In this DATA step we convert gender and agegroup to character variables. 
* The new values for these character variables are the character strings from 
* our formats. In other words, instead of having formatted numeric variables, 
* we will now have character variables that look like our formats. This is to 
* help with readability after we export the data to Excel.
* ============================================================================;
data freq;
	format gender_c agegroup_c;
	set freq;
	gender_c = put(gender, gender.);
	agegroup_c = put(agegroup, agegroup.);
run;

proc export 
	data = freq
	dbms = xlsx replace
	outfile = "C:\Users\mbc0022\Desktop\lab_task2.xlsx"
	replace;
run;
* Now use the Excel file to make a bar graph in Excel;



* Task 3
* Create a line chart that compares the average monthly temperatures for 1995 
* and 2012. Months should be on the x-axis and average temperature should be 
* on the y-axis. The line graph should have two lines: one for 1995 and one 
* for 2012. Include a graph title, a label for each axis, and format the 
* graph so that it would be publication ready. Create the chart described 
* above in Microsoft Excel or in SAS. Paste it into the .docx file you created 
* in Task 1, and save again.
* ============================================================================;
data temps_1995 (keep = sort_order month average1995);
	set "C:\Users\Mbc0022\Desktop\dfwtemps1995.sas7bdat";
	array temps {31} _numeric_;
	do i = 1 to 31;
		if temps{i} = -99 then temps{i} = .;
	end;
	average1995 = round(mean(of temp_f1-temp_f31),.1);
	sort_order = _N_;
run;

data temps_2012 (keep = sort_order month average2012);
	set "C:\Users\Mbc0022\Desktop\dfwtemps2012.sas7bdat";
	array temps {31} _numeric_;
	do i = 1 to 31;
		if temps{i} = -999 then temps{i} = .;
	end;
	average2012 = round(mean(of temp_f1-temp_f31),.1);
	sort_order = _N_;
run;

data temps_both (drop = sort_order);
	merge temps_1995 temps_2012;
	by sort_order;
run;

proc print data = temps_both;
	title1 "5313 Lab Task 3";
	title2 "Average Temperatures by Month";
run;

proc export 
	data = temps_both
	dbms = xlsx replace
	outfile = "C:\Users\mbc0022\Desktop\lab_task3.xlsx"
	replace;
run;
* Now use the Excel file to make a line graph in Excel;
