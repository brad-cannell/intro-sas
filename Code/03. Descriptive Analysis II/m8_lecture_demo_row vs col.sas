/******************************************************************************
Demonstration: Row vs. Column Percents

This code is posted for your benefit; however, I highly recommend that you 
practice typing your own SAS programs as well. With the SAS programming 
language, as with all new languages, immersion seems to be the best way to 
learn.
******************************************************************************/

* Load formats;
proc format;
	value yesno 	1 = "Yes"
					2 = "No";

	value race_eth	1 = "White, non-Hispanic"
					2 = "Black, non-Hispanic"
					3 = "Hispanic";
run;


* Create data set for deomonstration;
data ds;
	do _n_ = 1 to 69;
		race_eth = 1;
		diabetes = 1;
		output;
	end;
	do _n_ = 1 to 12;
		race_eth = 2;
		diabetes = 1;
		output;
	end;
	do _n_ = 1 to 9;
		race_eth = 3;
		diabetes = 1;
		output;
	end;
	do _n_ = 1 to 701;
		race_eth = 1;
		diabetes = 2;
		output;
	end;
	do _n_ = 1 to 118;
		race_eth = 2;
		diabetes = 2;
		output;
	end;
	do _n_ = 1 to 91;
		race_eth = 3;
		diabetes = 2;
		output;
	end;
run;

proc freq data = ds;
	tables race_eth * diabetes / nopercent norow nocol;
	format race_eth race_eth. diabetes yesno.;
run;

/*
In our example data we only see frequencies. If all we want are counts of 
people by race / ethnicity and diabetes status (which we might in some cases),
then this table is useful.

However, often we are really more interested in the relationship between two
categorical variables. 

For example, does the proportion of people with diabetes differ by race and 
ethnicity? 

Similarly, we could ask whether the proportion of people who are of any given 
race and ethnic group differ by diabetes status.

The two proportions described above are called conditional probabilities. We
can find all of these conditional probabilities using the following code:
*/

proc freq data = ds;
	tables race_eth * diabetes;
	format race_eth race_eth. diabetes yesno.;
	title1 "1. Does the proportion of people with diabetes differ by race and ethnicity?";
	title2 "2. Does the proportion of people who are of any given race and ethnic group differ by diabetes status.";
run;

/*
Q1. In the table created above, which percentages (row or column) are helpful 
to answer each question above?
*/

/*
Important point 1:
Whether the row percentages describe the conditional probabilities for race_eth
or diabetes is not fixed. We can change the row percentages to column 
percentages by changing the order of our variables in the tables statement.
*/

proc freq data = ds;
	tables diabetes * race_eth;
	format race_eth race_eth. diabetes yesno.;
	title1 "Switching rows and columns";
run;

/*
Important point 2:
Careful thought about our research question will guide our analysis (i.e., how
we set up and interpret our frequency table).

Question 2:
If we are interested in risk of diabetes, which question makes the most sense?

Question 3:
In that case, which variable is the explanatory / predictor / independent 
variable, and which is the outcome / dependent variable?

Important point 3:
Generally speaking, when your explanatory variable makes up the rows, you will
be interested in the row percentages. When your explanatory variable makes up 
the columns, you will be interested in the column percentages. By convention,
the analysis is often set up such that the explanatory variable make up the 
columns of the frequency table.

Question 4:
How would we answer the research question we selected above?

We can also reach the same conclusions using PROC SURVEYFREQ. We just need to
get used to a slightly different looking report.
*/

proc surveyfreq data = ds;
	tables race_eth * diabetes / row;
	format race_eth race_eth. diabetes yesno.;
	title1;
run;

/*
Notice that when using PROC SURVEYFREQ you must specifically ask for row and /
or column percentages.
*/



/*
Important point 4:
Explaining vs. describing. In the examples above we had a research question
that lead us to choose an outcome and explanatory variable. However, there are
often times - particularly in the context of creating a Table 1 - that we 
aren't so interest in answering a specific research question. Rather, we are
really interested in describing the characteristics of our study population, or
of subgroups of our study population. In those cases, the rule of thumb above
won't always make sense. We'll talk more about how to create a Table 1 in the
module on effectively presenting your results. 
*/





/*****************************************************************************/

/*
Q1:
Row percentages answer the question: does the proportion of people with 
diabetes differ by race and ethnicity? Or put another way, does race_ethnicity
explain diabetes? Or put another way, what is the conditional probability of 
having diabetes if you are of a certain racial and ethnic group?

Column percentages answer the question: does the proportion of people who are 
of any given race and ethnic group differ by diabetes status? or put another
way, does diabetes explain race_ethnicity? Or put another way, what is the 
conditional probability of being in a certain racial and ethic group given
that you have diabetes?
*/

/*
Q2:
"Does the proportion of people with diabetes differ by race and ethnicity?"
probably makes the most sense for most public health applications.
*/

/*
Q3:
Diabetes is the outcome variable and race_ethnicity is the explanatory
variable.
*/

/*
Q4:
When we can compare row percentages for each racial and ethnic group, we see
that 9% of the people in each group have diabetes. This analysis does not 
any evidence of a difference in the probability of having diabetes by race and
ethnicity. However, we must keep in mind that we know nothing about the 
potential biases that may exist in our data, nor does this analysis give us
any information about confounding or effect measure modification.
*/

