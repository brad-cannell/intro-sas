* ============================================================================;
* Lab: Analyzing Weighted Survey Data

* This code is posted for your benefit. However, I highly recommend that you 
* practice typing your own SAS programs as well. With the SAS programming 
* language, as with all new languages, immersion seems to be the best way to 
* learn.
* ============================================================================;

* Task 1. 
* Please go to the BRFSS website, download the 2012 BRFSS transport file, and 
* accompanying codebook. Unzip the SAS transport file you just downloaded. 
* Double click the SAS transport file to read it into your work library. Use a 
* data step to store the data in a permanent library. 
* ============================================================================;
data brfss12;
	set llcp2012;
	where _state = 48;
	
	if cvdinfr4 in (7, 9) then cvdinfr4 = .;
	if cvdinfr4 = 2 then cvdinfr4 = 0;

	if sex = 1 then male = 1;
	if sex = 2 then male = 0;

	if avedrnk2 in (77, 99) then avedrnk2 = .;
run;


* Task 2.
* Create a new data set that only contains responses for the state of Texas. 
* Create a frequency report for the variable that measures whether the 
* participant has ever had a myocardial infarction.
* ============================================================================;
proc surveyfreq data = brfss12;
	strata _ststr;
	cluster _psu;
	weight _llcpwt;
	tables CVDINFR4; 
run;


* Task 3.	
* Produce a two-way frequency report of sex by myocardial infarction.
* ============================================================================;
proc surveyfreq data = brfss12;
	strata _ststr;
	cluster _psu;
	weight _llcpwt;
	tables male*CVDINFR4 / row; 
run;


* Task 4.	
* Calculate the mean of number of drinks in the past 30 days by sex.
* ============================================================================;
data brfss12;
	set brfss12;

	real_drinks = avedrnk2;
	if alcday5 = 888 then real_drinks = 0;

run;

proc surveymeans data = brfss12;
	strata _ststr;
	cluster _psu;
	weight _llcpwt;
	var real_drinks;
	domain male;
run;


* Task 5. 
* Please go to the NHANES website. Download the Demographics SAS Transport 
* File (.xpt), and the cardiovascular disease SAS Transport File (.xpt) for 
* the year 2009-2010. Create a two-way frequency table for gender by language 
* of the sample person interview. Assume that language of the sample person 
* interview is a perfect proxy measure of primary language spoken. 
* Additionally, calculate the proportion of the Americans who have ever had 
* severe pain in their chest for more than half an hour.
* ============================================================================;
data nhanes;
	merge demo_f cdq_f;
	by seqn;
	if missing(RIAGENDR) then male = .;
	else if RIAGENDR = 1 then male = 1;
	else male = 0;
run;

proc format;
	value lang	1 = "English"
				2 = "Spanish";
run;

proc surveyfreq data = nhanes;
	strata sdmvstra;
	cluster sdmvpsu;
	weight WTMEC2YR;
	format sialang lang.;
	tables male*sialang / row cl;
run;


*Naive method;
proc surveyfreq data = nhanes;
	strata sdmvstra;
	cluster sdmvpsu;
	weight WTMEC2YR;
	tables cdq008;
run;


*correct method;
proc freq data = nhanes;
	tables cdq001*cdq008 / missing;
run;

data nhanes;
	set nhanes;
	if cdq001 in (7, 9) | cdq008 = 9 then half_hour = .;
	else if cdq001 = 2 | cdq008 = 2 then half_hour = 0;
	else if cdq008 = 1 then half_hour = 1;
run;

proc surveyfreq data = nhanes;
	strata sdmvstra;
	cluster sdmvpsu;
	weight WTMEC2YR;
	tables half_hour;
run;





