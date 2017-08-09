/*************************************************************************************************
Demonstration: Two-Sample T-Test

NOTE: Results will vary slightly from those in the lecture video because the data changes 
      slightly with every new class.

This code is posted for your benefit; however, I highly recommend that you practice typing your
own SAS programs as well. With the SAS programming language, as with all new languages, immersion 
seems to be the best way to learn.

*************************************************************************************************/
libname class "Z:\Dropbox\UNTHSC Admin and Teaching\Courses\5147-Fall 2014\BACH_EPID 5313\Data\Day one survey\5147\";
options fmtsearch = (class);


/*
T-test for difference between to independent sample means
*/
proc ttest data = class.classurv15;
	class gender;
	var oht;
	label oht = "Height in Inches";
	title1 "T-Test for Difference in Mean Height of Males and Females in this Class";
run;
