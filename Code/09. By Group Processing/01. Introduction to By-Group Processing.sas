* ============================================================================;
* Introduction to By-Group Processing

* Notes 
	* make an age at baseline variable and carry it forward - expand age across time
	* Create variables obs, final obs, finalage, numobs finalyears
	* Distribute total years across observations
	* Create dichotomous physical abuse variable
	* Create dichotomous verbal abuse variable
	* Create 4 category any abuse variable
	* Create abuse "ever" variables
	* LOCF / LOCB
	* Distribute EVER variables

* This code is posted for your benefit. However, I highly recommend that you 
* practice typing your own SAS programs as well. With the SAS programming 
* language, as with all new languages, immersion seems to be the best way to 
* learn.
* ============================================================================;


* ============================================================================;
* Start by looking a longitudinal data set - The Aging Women's Study;
* ============================================================================;
data aws;
	set "\\Mac\Dropbox\Datasets\Aging Women Study\aging_womens_study.sas7bdat";
run;

proc contents data = aws; 
run;
* 246363 observations and 10 variables;


* Look at the first 20 rows of the aging women's study data;
proc print data = aws (obs = 20);
run;


* ============================================================================;
* Notice that each participant has a variable number of observations and that 
* the timing of their observations are inconsistent and irregularly spaced.;

* A common question to ask in this situation is, "how many observations does 
* each woman have?";

* Currently, what tools do we have to answer that question?; 

* Let's start by trying to figure that out with a very simple example.;
* ============================================================================;
data ds;
	input id days x;
	datalines;
	1 -12 0
	1 0 1
	1 24 1
	2 -3 0
	2 0 0 
	2 117 1
	;
run;

proc print data = ds;
run;


* ============================================================================;
* Like the previous example, the data in this example is in long format. 
* Additionally, the timing of observations are inconsistent and irregularly 
* spaced.;

* In this simple data set, we know that each participant has 3 observations,
* and that mean number of observations per participant is also 3. How can
* we get SAS to tell us that using the methods we already know?;
* ============================================================================;
proc transpose data = ds
	out = ds_wide (drop = _NAME_)
	prefix = x;
	by id;
	id days;
run;

proc print data = ds_wide;
run;


* Notice that negatives are converted to underscores;

data ds_wide_2;
	set ds_wide;
	x_12_2 = missing(x_12);
run;

proc print data = ds_wide_2;
run;


* Now do this iteratively;
data ds_wide_2 (drop = i);
	set ds_wide;
	array vars {*} x_12--x117;
	array miss {5};
	do i = 1 to dim(vars);
		miss{i} = not missing(vars{i});
	end;
	num_obs = sum(of miss1-miss5);
run;

proc print data = ds_wide_2;
run;

proc means data = ds_wide_2;
	var num_obs;
run;


* ============================================================================;
* Now let's try using by group processing instead.
* ============================================================================;
data ds_2;
	set ds;
	by id;
	if first.id = 1 then obs = 1;
	else obs + 1;
run;

proc print data = ds_2;
run;



* ============================================================================;
* What's going on under the hood?
* ============================================================================;
data ds_2;
	set ds;
	by id;
	if first.id = 1 then obs = 1;
	else obs + 1;

	* New code to help us see under the hood;
	if first.id = 1 then first = 1;
	else if first.id ^= 1 then first = 0;
	if last.id = 1 then last = 1;
	else if last.id ^= 1 then last = 0;
run;

proc print data = ds_2;
run;


* ============================================================================;
* We can use this to shorten the code from above and find the mean number of
* observations
* ============================================================================;
data ds_2;
	set ds;
	by id;
	if first.id = 1 then obs = 1;
	else obs + 1;
	if last.id = 1 then last = 1;
run;

proc print data = ds_2;
run;

proc means data = ds_2;
	var obs;
	where last = 1;
run;


* Create obs number;
data aws2;
	set aws;
	by id;
	if first.id = 1 then obs = 0;
	obs = obs + 1;
run;


* Create group number; * Left off here...;

* Carry forward race;

* Carry forward age;





