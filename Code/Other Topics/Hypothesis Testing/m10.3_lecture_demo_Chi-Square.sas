/*************************************************************************************************
Demonstration: Chi-Square Test

NOTE: Results will vary slightly from those in the lecture video because the data changes 
      slightly with every new class.

This code is posted for your benefit; however, I highly recommend that you practice typing your
own SAS programs as well. With the SAS programming language, as with all new languages, immersion 
seems to be the best way to learn.

*************************************************************************************************/
libname class "Z:\Dropbox\UNTHSC Admin and Teaching\Courses\5147-Fall 2014\BACH_EPID 5313\Data\Day one survey\5147\";
options fmtsearch = (class);


/*
Revisit the persdoc by genhealth frequency table.
*/
proc freq data=class.classurv15;
	tables persdoc*genhealth;
run;


/*
Using formats to collapse categories of persdoc and genhealth in order to create a two-by-two 
table
*/
proc format;
	value fpersdoc 0 = "No Personal Doctor"
				   1-2 = "At Least One Personal Doctor";
	value fgenhealth 1-2 = "Excellent, Very Good, or Good"
					 3-high = "Fair or Poor";
run;

proc freq data=class.classurv15;
	tables persdoc*genhealth;
	format persdoc fpersdoc. genhealth fgenhealth.;
run;
					 

/*
Chi-square test for the difference between distributions
*/
proc freq data=class.classurv15;
	tables persdoc*genhealth / chisq expected nocol;
	format persdoc fpersdoc. genhealth fgenhealth.;
run;
