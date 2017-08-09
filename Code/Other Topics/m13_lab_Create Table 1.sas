/******************************************************************************
Module 13: Advanced Programing Topics

Lab: Create Table 1
We've already learned how to do the analysis necessary to create a Table 1. 
In this exercise we will use some slightly more advanced coding methods to 
automate the analysis and reporting process. In the long run, this will save 
programming time and reduce errors.

This code is posted for your benefit; however, I highly recommend that you 
practice typing your own SAS programs as well. With the SAS programming 
language, as with all new languages, immersion seems to be the best way to 
learn.
******************************************************************************/

/*
Task 1. Import the 2012 BRFSS data for Washington, D.C. 
May need to update the semester in the file path.
Also want to load needed formats.
*/
proc import out = brfssdc1
	datafile = "Z:\Dropbox\UNTHSC Admin and Teaching\Courses\5161-Spring 2016\BACH_EPID 5313\Code\13. Advanced Programming Topics/BRFSS_DC.xlsx"
	dbms = xlsx replace;
run;

proc format;
	value	yesno	1 = "Yes"
					2 = "No";
	value	gender	1 = "Male"
					2 = "Female";
	value	marital	1 = "Married"
					2 = "Divorced"
					3 = "Widowed"
					4 = "Separated"
					5 = "Never Married"
					6 = "Unmarried Couple";
run;
/*
Formats are not strictly necessary, but will greatly enhance readability 
later on.
*/

/*
Task 2. Recode all "Don't know / Not Sure" and "Refused" responses to missing
for the following variables: marital, hivtst6, and cvdinfr4. Additionally, keep
only these variables, and the complex survey variables.
*/
data brfssdc2;
	set brfssdc1 (keep = sex marital hivtst6 cvdinfr4 _llcpwt _ststr _psu);
	if marital = 9 then marital =.;
	if hivtst6 in(7, 9) then hivtst6 = .;
	if cvdinfr4 in(7, 9) then cvdinfr4 = .;
run;


/*
Task 3. Use the frequency procedure to estimate the distribution of demographic 
and health characteristics by gender.
*/
proc surveyfreq data = brfssdc2;
	tables sex *(marital hivtst6 cvdinfr4) /  row cl chisq nocellpercent nostd nototal;
	weight _llcpwt;
	strata _ststr;
	cluster _psu;
	format sex gender. marital marital. hivtst6 cvdinfr4 yesno.;
run;

/*
This works, but it requires us to manually type our results into a Word table.
This can be time consuming, and is prone to errors. What we really want is to
output just the results we need, already formatted the way we need them to be,
into a Word document that we can quickly and easily cut and paste from.

There are at least two different ways we can go about doing this:
1. Write our results to the SAS log, then print the log to a Word document.
2. Write our results to a SAS data set, then print a list report to a Word document.

Either option will begin by capturing the output of PROC FREQ using the ODS 
OUTPUT statement.
*/
proc surveyfreq data = brfssdc2;
	tables sex *(marital hivtst6 cvdinfr4) /  row cl chisq nocellpercent nostd nototal;
	weight _llcpwt;
	strata _ststr;
	cluster _psu;
	format sex gender. marital marital. hivtst6 cvdinfr4 yesno.;
	ods output crosstabs = table1; /* Use ODS TRACE ON / OFF, to figure out which table to output */
run;

/*
Now we have all the data values we need in a single SAS data set. The next step
is to make them more easily readable. Spcifically, we want to keep only the 
values we're interested in, round the values to numbers that are easier to read, 
and organize all the values in such a way that we can easily copy and paste 
them into our Word table.
*/


/******************************************************************************
Option 1. Write our results to the SAS log, then print the log to a Word 
document.

Although not necessary from a programming standpoint, we will start by 
reordering and subseting our variables. This is to facilitate understanding 
what we're trying to accomplish.
******************************************************************************/
data table1_2;
	format sex f_marital f_hivtst6 f_cvdinfr4 RowPercent RowLowerCL RowUpperCL; /* order variables - must come before the set statement */
	set table1 (keep = sex f_marital f_hivtst6 f_cvdinfr4 RowPercent RowLowerCL RowUpperCL);
run;

/*
Now you should be able to see how this data set contains the percent and 95%
confidence limits for each sex - characteristic pair we want to include in our
Word table. Although this information is now slightly more concise than the 
default PROC FREQ output, we still aren't able to directly cut and paste into
our Word table.

Below we will use the DATA _null_ statement, and a PUT statement, to write
the results of our data set to the SAS log instead of a new SAS data set.
*/
data _null_;
	set table1_2;
	put sex f_marital rowpercent rowlowercl rowuppercl;
run;

/*
Notice how this writes all the information we need for marital status to the
log. However, it's still hard to read, and we need to find a way to repeat 
the process for each characteristic of interest.

Below we will use ARRAY and DO LOOP processing to write the information we
need for each characteristic to the log. We will also use a FORMAT statement
to make our statistics more readable.
*/
data _null_;
	set table1_2;
	format rowpercent rowlowercl rowuppercl 3.;
	array var {*} f_marital f_hivtst6 f_cvdinfr4;
	do i = 1 to dim(var);
		put sex var{i} rowpercent rowlowercl rowuppercl;
	end;
run;

/*
Better, but still not quite what we want. You may notice that the statistics
we are interested in are repeated the same number of times as there are 
variables in our ARRAY. For example, in line 1 of the SAS log we get the 
result we expect - the value of sex from row 1 of table1_2, the value of 
marital from row 1 of table1_2, the row percent from row 1 of table1_2, 
and the lower and upper CI's from row 1 of table1_2. But in the second row of 
the SAS log we get the value of sex from row 1 of table1_2, the value of
hivtst5 from row 1 of table1_2 the row percent from row 1 of table1_2, 
and the lower and upper CI's from row 1 of table1_2. In reality we just want
output from each row of table1_2 once. And we want that output to reflect
just the variable values that arent' missing. The addition of the conditional
processing statement to our DO LOOP below should take care of our problem.
*/
data _null_;
	set table1_2;
	format rowpercent rowlowercl rowuppercl 3.;
	array var {*} f_marital f_hivtst6 f_cvdinfr4;
	do i = 1 to dim(var);
		if var{i} ^= ' ' then
		put sex var{i} rowpercent rowlowercl rowuppercl;
	end;
run;

/*
We will also add in some additional text in the put statement to further 
enhance the readability of our output. Using the "<variable> =" notation in the 
put statement will cause SAS to display the variable name followed by the 
variable value in the log. We also add the pipe symbol in single quotes. This
is just a stylistic touch and has no programatic meaning. The same is true of
of the : in single quotes.
*/
data _null_;
	set table1_2;
	format rowpercent rowlowercl rowuppercl 3.;
	array var {*} f_marital f_hivtst6 f_cvdinfr4;
	do i = 1 to dim(var);
		if var{i} ^= ' ' then
		put sex= '| ' var{i}= ': ' rowpercent rowlowercl rowuppercl;
	end;
run;

/*
Now we need to format the statistics so that we can copy and paste them 
directly into our table 1. 
The + (-1) is used to removed unwanted trailing spaces.
*/
data _null_;
	set table1_2;
	format rowpercent rowlowercl rowuppercl 3.;
	array var {*} f_marital f_hivtst6 f_cvdinfr4;
	do i = 1 to dim(var);
		if var{i} ^= ' ' then
		put sex= '| ' var{i}= ': ' rowpercent '(' rowlowercl + (-1) '-' rowuppercl + (-1) ')';
	end;
run;

/*
The last step is print the SAS log to a Word document.
Note: You must highlight and run all three parts of the code below together
to produce the desired result.
*/
proc printto log = "C:\Users\mbc0022\Desktop\Table1_option_1.rtf";
run;

data _null_;
	set table1_2;
	format rowpercent rowlowercl rowuppercl 3.;
	array var {*} f_marital f_hivtst6 f_cvdinfr4;
	do i = 1 to dim(var);
		if var{i} ^= ' ' then
		put sex= '| ' var{i}= ': ' rowpercent '(' rowlowercl + (-1) '-' rowuppercl + (-1) ')';
	end;
run;

proc printto;
run;





/******************************************************************************
Option 2. Write our results to a SAS data set, then print a list report to a 
Word document. Although not necessary from a programming standpoint, we will 
reorder and subset our variables to facilitate understanding what we're trying 
to do.
******************************************************************************/
data table1_2;
	format sex f_marital f_hivtst6 f_cvdinfr4 RowPercent RowLowerCL RowUpperCL; /* Order variables - not strictly necessary */
	set table1 (keep = sex f_marital f_hivtst6 f_cvdinfr4 RowPercent RowLowerCL RowUpperCL); /* Keep only variables of interest */
run;

* Alternatively, we could have used PROC SQL to reoder the variables;
proc sql;
	create table table1_2 as
	select sex, f_marital, f_hivtst6, f_cvdinfr4, RowPercent, RowLowerCL, RowUpperCL
	from table1;
quit;

/* 
In table1_2, each variable still occupies its own column in the SAS data set. 
Instead, we want a single column that contains the variable name and variable 
value that each set of statistics corresponds to.
In the code below, we create a new variable called "characteristic" that will
contain the variable names. We also use a LENGTH statement to improve
readability.
Notice that we use the VNAME function to "grab" the variable name and use it
as a value of the new variable, characteristic.
*/
data table1_2;
	format sex f_marital f_hivtst6 f_cvdinfr4 RowPercent RowLowerCL RowUpperCL;
	set table1 (keep = sex f_marital f_hivtst6 f_cvdinfr4 RowPercent RowLowerCL RowUpperCL);
	length characteristic $10;
	if f_marital ^= '' then characteristic = vname(f_marital);
	if f_hivtst6 ^= '' then characteristic = vname(f_hivtst6);
	if f_cvdinfr4 ^= '' then characteristic = vname(f_cvdinfr4);
	value = f_marital;
	if value = ' ' then value = f_hivtst6;
	if value = ' ' then value = f_cvdinfr4;
run;

/*
This works, but the code would quickly become unwieldy if we had many more
variables in our analysis. Let's use DO LOOP processing to make our code more
efficient and versatile.
Additionally, the KEEP option in the DATA statement ensures that our final 
data set inclcudes only the variables we are interested in. It also makes the 
KEEP option in our SET statement unnecessary.
Finally, the FORMAT sex is just to ensure that sex remains the first variable
in the data set.
*/
data table1_2 (keep = sex characteristic value rowpercent rowlowercl rowuppercl);
	format sex;
	length characteristic $10 value $20;
	set table1;
	array var {*} f_marital f_hivtst6 f_cvdinfr4;
	do i = 1 to dim(var);
		if var{i} ^= '' then characteristic = vname(var{i});
		if value = ' ' then value = var{i};
	end;
run;

/* 
Next we need to combine all the statistics into a single character variable.
The put function can be used to convert our numeric row percent to a character value.
The cat function then "smoosh" togther the three values we want.
*/
data table1_2 (keep = sex characteristic value percent_95_ci);
	format sex;
	length characteristic $10 value $20;
	set table1;
	array var {*} f_marital f_hivtst6 f_cvdinfr4;
	do i = 1 to dim(var);
		if var{i} ^= '' then characteristic = vname(var{i});
		if value = ' ' then value = var{i};
	end;
	percent_95_ci = cat(put(rowpercent, 3.), put(rowlowercl, 3.), put(rowuppercl, 3.));
run;

/*
Almost there. Now we just need to add parentheses and proper spacing to the
percent_95_ci variable so that we are able to simply cut and paste our output
into our final table 1. Let's try again.
Must use alt + 255 to insert blank space in front of the open parenthesis.
CATS, as opposed to CAT, will strip all spaces that we don't specifically tell
SAS to include.
*/
data table1_2 (keep = sex characteristic value percent_95_ci);
	format sex;
	length characteristic $10 value $20 percent_95_ci $10;
	set table1;
	array var {*} f_marital f_hivtst6 f_cvdinfr4;
	do i = 1 to dim(var);
		if var{i} ^= '' then characteristic = vname(var{i});
		if value = ' ' then value = var{i};
	end;
	percent_95_ci = cats(put(rowpercent, 3.), 
					' (', 
					put(rowlowercl, 3.),
					'-', 
					put(rowuppercl, 3.),
					')');
run;

/*
That is exactly what we want. Now we just need to print this to a Word document.
*/
ods rtf file = "C:\Users\mbc0022\Desktop\table1_option2.rtf";
proc print data = table1_2;
run;
ods rtf close;

/*
Perfect! We can now easily cut our formatted statistics and paste them directly 
into our Word table. This should save us time and errors.
The one downside to this code is that it is still idiosyncratic to this 
specific analysis and these specific variables. Wouldn't it nice if we code
make this code generalizable to analyses with completely different variables?
For example, we may need to change the group variable, the variables in our
array, or the length of the formats we need to use in the length statement.
We can even make these portions of our code more generalizable with the help of 
SAS macro processing.
Below we turn this code into a MACRO using the %macro notation. In parantheses
are the macro parameters that will be passed to the macro whenever we call it.
The values in the parameters
*/
%macro table1 (set = table1, group = , varlist = , char_length = 10, 
value_length = 20, word_file = "C:\Users\mbc0022\Desktop\table1.rtf");
data table1_2 (keep = &group characteristic value percent_95_ci);
	format &group;
	length characteristic $&char_length value $&value_length percent_95_ci $10;
	set &set;
	array var {*} &varlist;
	do i = 1 to dim(var);
		if var{i} ^= '' then characteristic = vname(var{i});
		if value = ' ' then value = var{i};
	end;
	percent_95_ci = cats(put(rowpercent, 3.), 
					' (', 
					put(rowlowercl, 3.),
					'-', 
					put(rowuppercl, 3.),
					')');
run;

ods rtf file = &word_file;
proc print data = table1_2 noobs;
run;
ods rtf close;
%mend table1;

%table1(group = sex, 
		varlist = f_marital f_hivtst6 f_cvdinfr4,
		word_file = "C:\Users\mbc0022\Desktop\table1_option_2.rtf")

/*
If we want to use this macro in the future with other analyses, we can save it
in a .SAS file, then call it up in future programs using %include.
*/


/*
Now, let's add p-values to our output.
*/
data table1_2 (keep = sex characteristic value percent_95_ci);
	format sex;
	length characteristic $10 value $20 percent_95_ci $10;
	set table1;
	array var {*} f_marital f_hivtst6 f_cvdinfr4;
	do i = 1 to dim(var);
		if var{i} ^= '' then characteristic = vname(var{i});
		if value = ' ' then value = var{i};
	end;
	percent_95_ci = cats(put(rowpercent, 3.), 
					' (', 
					put(rowlowercl, 3.),
					'-', 
					put(rowuppercl, 3.),
					')');
run;









