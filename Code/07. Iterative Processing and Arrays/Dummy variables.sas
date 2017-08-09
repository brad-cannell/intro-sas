/******************************************************************************
Creating Dummy Variables

When analyzing categorical data, SAS will usually understand what you are
trying to accomplish and give you the results you expect - think logistic
regression. However, there may be times when you want to manually create dummy
variables for your analysis - think chi2 analysis on each level of a
categorical variable. This process can be tedious and error prone in SAS.
However, with the use of ARRAYs and DO LOOPs, we can make it less so.

This code is posted for your benefit; however, I highly recommend that you 
practice typing your own SAS programs as well. With the SAS programming 
language, as with all new languages, immersion seems to be the best way to 
learn.
******************************************************************************/

/* 
Create a data set with two categorical variables where:
gender: 1 = male, 2 = female
bmi: 1 = not overweight or obese, 2 = overweight, 3 = obese
*/
data ds;
	input id gender bmi;
	datalines;
	1 1 1
	2 . 1
	3 1 3
	4 2 1
	5 1 2
	6 1 3
	7 2 1
	8 2 3
	9 . 2
	10 2 2
	11 2 1
	12 2 3
	13 1 2
	14 1 1
	15 2 1
	16 2 3
	17 2 2
	18 1 2
	19 1 3
	20 2 2
	;
run;

/*
We could create dummy variables with a series of if-then-else statements.
Notice that if you fail to account for missing values in the code below, you 
will get incorrect results.
*/
data ds_2;
	set ds;

	* Create dummy variables for gender;
	if missing(gender) then male = .;
	else if gender = 1 then male = 1;
	else male = 0;

	if missing(gender) then female = .;
	else if gender = 2 then female = 1;
	else female = 0;

	* Create dummy variables for bmi;
	if missing(bmi) then neither = .;
	else if bmi = 1 then neither = 1;
	else neither = 0;

	if missing(bmi) then ow = .;
	else if bmi = 2 then ow = 1;
	else ow = 0;

	if missing(bmi) then obese = .;
	else if bmi = 3 then obese = 1;
	else obese = 0;

run;

proc print data = ds_2;
run;

/*
This gives us exactly the results we want; however, even with just two
variables, this was a lot of typing. This increases your overall project time
and your liklihood of errors.

We can improve this code using ARRAYs and DO LOOPs.
However, let's step through the process piece by piece.
*/
data ds_2;
	set ds;

	* Create dummy variables for gender;
	array g{2} male female;
	do i = 1 to 2;
		if missing(gender) then g{i} = .;
		else g{i} = 0;
	end;
	if gender ^= . then g{gender} = 1;
run;

proc print data = ds_2;
run;

/*
In the code above we first create an ARRAY with two elements: male and female.
Because these variables don't already exist in our data set, SAS will create
them. Then, SAS will execute the statements inside the DO LOOP on all elements 
of the array (the variables male and female). In this case, that means 
assigning either missing or zero to each value of male and female depending
on whether or not gender is missing in the same row.

Under the DO LOOP we have a conditional processing statement that uses the
ARRAY we created above to replace 0's with 1's where appropriate. For example,
In the first observation gender equals 1. Because 1 is not equal to missing, 
SAS processes the rest of the statement. Because gender = 1, g(gender) = g(1).
Just like inside the DO LOOP g(1) is equal to the first element of the ARRAY g.
Therefore g(1) = male. So, in observation 1, SAS replaces the zero with a 1
for the variable male. The value for female remains unchanged (0) because it 
isn't referenced anywhere in this conditional processing statement. 

In the second observation, the value for gender is missing. Therefore, SAS
does not process the rest of the conditional processing statement.

In the fourth observation, gender equals 2. Because 2 is not equal to missing, 
SAS processes the rest of the conditional processing statement. Because 
gender = 2, g(gender) = g(2), and g(2) is equal to the second element of the 
ARRAY g. Therefore g(2) = female. So, in observation 4, SAS replaces the zero 
with a 1 for the variable female. The value for male remains unchanged (0) 
because it isn't referenced anywhere in this conditional processing statement.

In this case, the code above doesn't save us much typing, but it does reduce
the likelihood of errors. And, if our variable had 5, 10, or 100 possible
categories, we would only need to make small changes to the code above.
*/ 
data ds_2;
	set ds;

	* Create dummy variables for gender;
	array g{2} gender_1-gender_2;
	do i = 1 to 2;
		if missing(gender) then g{i} = .;
		else g{i} = 0;
	end;
	if gender ^= . then g{gender} = 1;
run;

proc print data = ds_2;
run;

/*
For example, we could use sequentially numbered generic names for our dummy 
variables, as I've done below. However, in this case, doing so doesn't save
use much time, and makes our output less meaningful. Therefore, most of the
time I prefer to use more descriptive variable names in the ARRAY element
list.

Now, let's finish our original task by creating dummy variables for BMI as 
well.
*/
data ds_2 (drop = i);
	set ds;

	* Create dummy variables for gender;
	array g{2} male female;
	do i = 1 to 2;
		if missing(gender) then g{i} = .;
		else g{i} = 0;
	end;
	if gender ^= . then g{gender} = 1;

	* Creating dummy variables for BMI;
	array b{3} neither over obese;
	do i = 1 to 3;
		if missing(bmi) then b{i} = .;
		else b{i} = 0;
	end;
	if bmi ^= . then b{bmi} = 1;
run;

proc print data = ds_2;
run;
