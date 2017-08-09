/*************************************************************************************************
Demonstration: Continuous Outcome and Categorical Predictor

This code is posted for your benefit; however, I highly recommend that you practice typing your
own SAS programs as well. With the SAS programming language, as with all new languages, immersion 
seems to be the best way to learn.

*************************************************************************************************/

/*
Using class survey data
*/
options fmtsearch = (class);
libname class "Z:\Dropbox\UNTHSC Admin and Teaching\Courses\5147-Fall 2014\BACH_EPID 5313\Data\Day one survey\5147\";
/*
Merge class data sets to get all needed variables
*/
data class.classurv15;
	merge class.classurv6 class.classurv12;
	id = _N_;
run;


/*
Calculating mean height (continuous) within levels of gender (categorical);
*/
proc means data=class.classurv15 maxdec=2;
	class gender;
	var oht;
run;


/*
Using a format to create classes;
*/
proc format;
	value	agegroup	low-<30 = 'Younger than 30'
						30 - high = '30 and Older';
run;

proc means data=class.classurv15 maxdec=2;
	class age;
	format age agegroup.;
	var salary;
run;


/*
Creating summary data sets using PROC MEANS;
*/
proc means data=class.classurv15 maxdec=2 noprint;
	class gender;
	var oht wt_lbs;
	output 	out = summary
			mean = MeanHT MeanWt;
run;

proc print data=summary;
run;


proc means data=class.classurv15 maxdec=2 noprint;
	class gender;
	var oht wt_lbs;
	output 	out = summary
			mean = 
			median =
			var = 
			std = 
			min = 
			max = / autoname;
run;

proc print data=summary;
run;


/*
Using two class variables with PROC MEANS
*/
proc means data=class.classurv15 mean stderr clm maxdec=2;
	class gender age;
	format age agegroup.;
	var bmi;
run;


/*
Graphically presenting mean BMI by gender and age group
*/
proc sgpanel data = class.classurv15;
	panelby gender;
	vbar age / response = bmi stat = mean limitstat = clm;
	format age agegroup.;
run;


/*
Using PROC UNIVARIATE to produce statistics and plots within levels of gender
*/
proc univariate data=class.classurv15 plot;
	var oht;
	class gender;
run;


/*
Comparing histograms of height by gender
*/
proc sgpanel data = class.classurv15;
	panelby gender;
	histogram oht;
	density oht;
	label oht = "Height in Inches";
run;


/*
Comparing boxplots of height by gender
*/
proc sgplot data = class.classurv15;
	vbox oht / category = gender;
	label oht = "Height in Inches";
run;
