/*************************************************************************************************
Demonstration: Analyzing Weighted Survey Data

	*Calculating weighted frequencies
	*Calculating weighted means 

This code is posted for your benefit; however, I highly recommend that you practice typing your
own SAS programs as well. With the SAS programming language, as with all new languages, immersion 
seems to be the best way to learn.

*************************************************************************************************/
libname brfss12 "Z:\Dropbox\UNTHSC Admin and Teaching\Courses\5147-Fall 2014\BACH_EPID 5313\Data\2012 BRFSS\";


/*
Importing 2012 BRFSS data for Washington, D.C.
*/
proc import out = brfss12.wdc01
	datafile = 'Z:\Dropbox\UNTHSC Admin and Teaching\Courses\5147-Fall 2014\BACH_EPID 5313\Data\2012 BRFSS\BRFSS_DC.xlsx'
	dbms = xlsx replace;
	sheet = 'BRFSS_DC';
run;

proc contents data = brfss12.wdc01;
run;

proc print data = brfss12.wdc01 (firstobs = 1 obs = 15);
run;


/*
Cleaning data
*/
data brfss12.wdc02;
	set brfss12.wdc01;
	
	if asthma3 = 9 or asthma3 = 7 then asthma = .;
	else if asthma3 = 1 then asthma = 1;
	else if asthma3 = 2 then asthma = 0;
	
	if sex = 9 or sex = 7 then male = .;
	else if sex = 1 then male = 1;
	else if sex = 2 then male = 0;
	
	if children = 88 or children = 99 then children = .;
run;


/*
Calculating frequency of respondents who were ever told that they have asthma
*/
proc surveyfreq data = brfss12.wdc02;
	strata _ststr;
	cluster _psu;
	weight _llcpwt;
	tables asthma;
run;
	
	
proc freq data = brfss12.wdc02;
	tables asthma;
run;


/*
Calculating frequency of respondents who were ever told that they have asthma
by gender
*/
proc surveyfreq data = brfss12.wdc02;
	strata _ststr;
	cluster _psu;
	weight _llcpwt;
	tables male*asthma;
run;
		
proc freq data = brfss12.wdc02;
	tables male*asthma;
run;

proc surveyfreq data = brfss12.wdc02;
	strata _ststr;
	cluster _psu;
	weight _llcpwt;
	tables male*asthma / row;
run;


/*
Calculating mean number of children
*/
proc surveymeans data = brfss12.wdc02;
	strata _ststr;
	cluster _psu;
	weight _llcpwt;
	var children;
run;
	
proc means data = brfss12.wdc02;
	var children;
run;

proc sort data = brfss12.wdc02;
	by male;
run;

proc surveymeans data = brfss12.wdc02;
	strata _ststr;
	cluster _psu;
	weight _llcpwt;
	var children;
	domain male;
run;

proc surveymeans data = brfss12.wdc02;
	strata _ststr;
	cluster _psu;
	weight _llcpwt;
	var children;
	by male;
run;


/*
Testing for differences in means and proportions in weighted survey data.
*/
proc surveyfreq data = brfss12.wdc02;
	strata _ststr;
	cluster _psu;
	weight _llcpwt;
	tables male*asthma / row chisq;
run;






































