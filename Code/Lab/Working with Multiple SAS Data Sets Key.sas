* ============================================================================;
* Lab: Working with Multiple SAS Data Sets

* This code is posted for your benefit. However, I highly recommend that you 
* practice typing your own SAS programs as well. With the SAS programming 
* language, as with all new languages, immersion seems to be the best way to 
* learn.
* ============================================================================;

* Task 1. 
* Download Cities SES.xlsx from Github and import all three sheets (Houston, 
* Atlanta, and Charlotte) into SAS as separate SAS data sets. Name the SAS 
* data sets Houston, Atlanta, and Charlotte.;
proc import out = houston
	datafile = "C:\Users\mbc0022\Desktop\City SES.xlsx"
	dbms = xlsx replace;
	sheet = "Houston";
run;

proc import out = atlanta
	datafile = "C:\Users\mbc0022\Desktop\City SES.xlsx"
	dbms = xlsx replace;
	sheet = "Atlanta";
run;

proc import out = charlotte
	datafile = "C:\Users\mbc0022\Desktop\City SES.xlsx"
	dbms = xlsx replace;
	sheet = "Charlotte";
run;


* Task 2. 
* Vertically combine these three data sets. You may either concatenate them 
* using a SAS DATA STEP or append them using PROC APPEND. 

* Use the RENAME option to make the variable names in your output data match 
* the variable names in the Houston data. This new SAS data set should be 
* named Cities.;

* Create a variable in the Cities data set called site. The values of site 
* should be equal to the city that data came from. For example, the value of 
* site for all observations from the Houston data set should be “Houston.”

* First approach - concatenate;
* ============================================================================;
data cities;
	set houston
	    atlanta   (rename = (id = pid gender = sex))
		charlotte (rename = (ses = ses_score));
	
	length site $9;
	if _N_ in (1:5) then site = "Houston";
	else if _N_ in (6:10) then site = "Atlanta";
	else site = "Charlotte";
run;

* Second approach - append;
* Note: PROC APPEND is computationally more efficient if you have very large
* data sets. We do not.;
* ============================================================================;

* First, delete the cities data we created above.;
proc datasets lib = work nolist; 
	delete cities;
quit;

* Now use PROC APPEND;
proc append 
	base = houston 
	data = atlanta (rename = (id = pid gender = sex));
run;

proc append 
	base = houston 
	data = charlotte (rename = (ses = ses_score));
run;

data cities;
	set houston;
	length site $9;
	if _N_ in (1:5) then site = "Houston";
	else if _N_ in (6:10) then site = "Atlanta";
	else site = "Charlotte";
run;


* Task 3. 
* Create a list report that displays the entire Cities data set. Give the 
* report an appropriate title and a footnote with the current date and time.;
* ============================================================================;
title1 "List Report of the Combined Houston - Atlanta - Charlotte Data";
footnote "&sysdate at &systime";
proc print data = cities;
run;


* Task 4. 
* Sort the Cities data set by PID in ascending order.;
* ============================================================================;
proc sort data = cities;
	by pid;
run;

title1 "List Report of the Combined Houston - Atlanta - Charlotte Data";
title2 "Sorted by PID";
footnote "&sysdate at &systime";
proc print data = cities;
run;


* Third approach - SQL;
* We can accomplish Tasks 2-5 in one step.
* You aren't required to know this. Just an FYI.
* First, scroll up to the top of this code and create a clean copy of the 
* Houston data set.;
* ============================================================================;
proc sql;
create table cities as
select *, "Houston" as site
	from houston

union /* Default: concatenate by position. Use var names from first table */

select *, "Atlanta" as site
	from atlanta

union

select *, "Charlotte" as site
	from charlotte
	order by pid;

title1 "Combined Houston - Atlanta - Charlotte Data";
title2 "Sorted by PID";
footnote "&sysdate at &systime";
select *
	from cities;
quit;


* Task 6. 
* Create a boxplot of SES Score by Site.;
* ============================================================================;
title1 "Boxplots of SES Score by Site";
footnote "&sysdate at &systime";
proc sgplot data = cities;
	vbox ses_score / group = site;
run;


* Task 7. 
* Go to the NHANES website. Download the following SAS Transport Files (.xpt) 
* for the year 2013-2014: 
* 1. Demographics
* 	1.1 Demographic Variables and Sample Weights
* 2. Questionnaire
* 	2.1 Medical Conditions
* 	2.2 Smoking - Cigarette Use;

* Task 8. Convert these 3 SAS Transport Files into temporary SAS data sets. 
* To do this, just double click on the transport files (.xpt files you 
* downloaded).

* Task 9. Create a contents report of your work library. Familiarize yourself 
* with the variables in each data set.;
* ============================================================================;
proc datasets lib = work nolist;
	delete houston atlanta charlotte cities;
quit;

title;
proc contents data = work._all_;
run;


* Task 11. 
* Merge the 3 data sets above into a new data set called NHANES.;
* ============================================================================;
data nhanes;
	merge demo_h mcq_h smq_h;
	by seqn;
run;

proc contents data = nhanes;
	ods select attributes;
run;

* Second approach - SQL Join;
* ============================================================================;
proc sql;
create table nhanes_sql as
select * 
	from demo_h as d
		 full join 
		 mcq_h as m
	on d.seqn = m.seqn
		 full join
         smq_h as s
	on d.seqn = s.seqn;
quit;

proc contents data = nhanes_sql;
	ods select attributes;
run;


* Task 13. 
* Download the DFW Temps 2012 data from Github.
* You can do this in a DATA STEP by copying and pasting the file path into 
* the SET statement. You could also create a library, using a LIBNAME 
* statement, that points to the location of that file on your computer.
* ============================================================================;
data temps;
	set "C:\Users\mbc0022\Desktop\dfwtemps2012.sas7bdat";
run;


* Task 14. 
* Use a DATA STEP to reshape the DFW Temps 2012 data from wide to long.
* This will require using ARRAYS and DO LOOPS. Name the reshaped data set 
* temps_long.
* ============================================================================;
data temps_long (keep = month day temp);
	set temps;
	array temps_array {*} temp_f1--temp_f31;
	do i = 1 to dim(temps_array);
		day  = i;
		temp = temps_array{i};
		output;
	end;
run;


* Task 15. 
* Check temps_long for outlying/erroneous temperature values. You could do this 
* in several ways (e.g., PROC MEANS).;
* ============================================================================;
proc means data = temps_long;
	var temp;
run;


* Task 16.
* In the previous task, you should have found several temperature values that 
* were equal to -999. These are definitely errors. Use a DATA STEP to recode 
* these erroneous temperature values to missing.
* ============================================================================;
data temps_long;
	set temps_long;
	if temp = -999 then temp = .;
run;


* Task 17. 
* Use temps_long to create a scatter plot. Map Months to the x-axis and 
* Temperatures to the y-axis.
* ============================================================================;
proc sgplot data = temps_long;
	scatter x = month y = temp;
run;
