/*************************************************************************************************
Demonstration: Confidence Intervals

NOTE: Results will vary slightly from those in the lecture video because the data changes 
      slightly with every new class.

This code is posted for your benefit; however, I highly recommend that you practice typing your
own SAS programs as well. With the SAS programming language, as with all new languages, immersion 
seems to be the best way to learn.

*************************************************************************************************/

/*
Demonstration using class survey data
*/
libname class "Z:\Dropbox\UNTHSC Admin and Teaching\Courses\5147-Fall 2014\BACH_EPID 5313\Data\Day one survey\5147\";
options fmtsearch = (class);


/*
Estimating mean height and 95% confidence intervals within levels of gender
*/
proc means data=class.classurv15 nmiss mean std stderr clm ;
	var oht;
	class gender;
	label oht = "Height in Inches";
run;


/*
Generating 10,000 random participants. About half male and half female.
*/
data random1 (drop = i x);
	do i=1 to 10000;
   		x = uniform(123456);
   			if x >.5 then male = 1;
   			else male = 0;
   		output;
	end;
run;

proc freq data=random1;
run;


/*
Assigning heights to the generated participants at random (within certain parameters).
*/
data random2;
	set random1;
		if male = 1 then height = round(71 + 4.32*normal(0), .01);
		else if male = 0 then height = round(64.3 + 2.11*normal(0), .01);
run;

proc print data=random2;
run;

proc means data=random2;
	var height;
	class male;
run;

proc sort data=random2;
	by male;
run;

proc sgplot data=random2;
	histogram height;
	density height;
	by male;
run;


/*
Randomly select samples of 100 participants
*/
proc surveyselect data=random2 
	method = srs 
	sampsize = 100
	rep = 1000
	seed = 2015
	out = random3;
run;


/*
Means and 95% CI of estimates
*/
proc means data=random3 mean clm;
	var height;
	class replicate male;
	output 	out = summary
			mean = mean
			lclm = lclm
			uclm = uclm;
run;


/*
Count the number of CI's that do not include the true population mean
*/
data random4;
	set summary;
	if male = . then include_true_mean = .;
	else if male = 0 and lclm < 64.3 and uclm > 64.3 then include_true_mean = 1;
	else if male = 1 and lclm < 71 and uclm > 71 then include_true_mean = 1;
	else include_true_mean = 0;
run;

proc freq data=random4;
	tables include_true_mean;
run;

proc print data=random4;
	where include_true_mean = 0;
run;


/*
Demonstration using class survey data
*/
libname class "Z:\Dropbox\UNTHSC Admin and Teaching\Courses\5147-Fall 2014\BACH_EPID 5313\Data\Day one survey\5147\";
options fmtsearch = (class);


/*
Estimating mean height and 95% confidence intervals within levels of gender
*/
proc means data=class.classurv15 nmiss mean std stderr clm ;
	var oht;
	class gender;
	label oht = "Height in Inches";
run;
