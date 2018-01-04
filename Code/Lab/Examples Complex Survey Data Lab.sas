* ============================================================================;
* Lab: Complex Survey Data Analysis
* 1. Data checking
* 2. Using PROC SURVEYREG
* ============================================================================;

* Load NHANES 2011-2012 Medical Condtions Data (MCQ_G) into work library;
* Load NHANES 2011-2012 Demographic Data (DEMO_G) into work library;
* Get NHANES 2011-2012 Medical Conditions codebook;

* What proportion of Americans have had an asthma attack in the past year?;
* ============================================================================;
data asthma1;
	merge demo_g mcq_g;
	by seqn;
	keep seqn wtint2yr sdmvstra sdmvpsu ridageyr riagendr mcq010 mcq040;
	rename	ridageyr = age
			riagendr = gender
			mcq010 = asthma_ever
			mcq040 = past_year;
run;

* Naive analysis;
proc freq data = asthma1;
	tables past_year;
run;

* Need to recode 9's;
data asthma2;
	set asthma1; 

	if past_year = 9 then past_year = .;
run;

proc freq data = asthma2;
	tables past_year;
run;

proc surveyfreq data = asthma2;
	tables past_year;
	weight wtint2yr;
	strata sdmvstra;
	cluster sdmvpsu;
run;

* Why so many missing?;
* Look at codebook and/or use crosstabs with missing option;
* ============================================================================;
proc freq data = asthma2;
	tables past_year*asthma_ever / missing;
run;

* More data management;
data asthma3;
	set asthma2;

	if asthma_ever = 2 or past_year = 2 then past_year2 = 0;
	else if past_year = 1 then past_year2 = 1;
	else past_year2 =.;
run;

proc surveyfreq data = asthma3;
	tables past_year past_year2;
	weight wtint2yr;
	strata sdmvstra;
	cluster sdmvpsu;
run;




*PROC SURVEYREG to test for difference in means;
* ============================================================================;
proc surveymeans data = asthma3;
	domain past_year2;
	var age;
	weight wtint2yr;
	strata sdmvstra;
	cluster sdmvpsu;
run;

proc surveyreg data = asthma3;
	model age = past_year2;
	weight wtint2yr;
	strata sdmvstra;
	cluster sdmvpsu;
run;
