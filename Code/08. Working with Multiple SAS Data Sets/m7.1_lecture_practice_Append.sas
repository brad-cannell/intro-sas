/*************************************************************************************************
Practice: Appending SAS Data Sets

This code is posted for your benefit; however, I highly recommend that you practice typing your
own SAS programs as well. With the SAS programming language, as with all new languages, immersion 
seems to be the best way to learn.

*************************************************************************************************/

*Creating data sets for practice;
data trial;
	input year N Male;
	datalines;
	2010 501 51
	2011 499 52
	2012 498 49
	2013 502 50
run;

data trial_2014;
	input year N Male;
	datalines;
	2014 500 48
run;

