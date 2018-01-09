* ============================================================================;
* Categorical Outcome

* This code is posted for your benefit; however, I highly recommend that you
* practice typing your own SAS programs as well. With the SAS programming
* language, as with all new languages, immersion seems to be the best way to
* learn.
* ============================================================================;


* Using class survey data;
* ============================================================================;
options fmtsearch = (class);

libname class "Z:\Dropbox\UNTHSC Admin and Teaching\Courses\5147-Fall 2014\
BACH_EPID 5313\Data\Day one survey\5147\";

* Merge class data sets to get all needed variables;
data class.classurv15;
	merge class.classurv6 class.classurv12;
	id = _N_;
	if persdoc = 9 then persdoc = .;
run;


* Numerical description of categorical data and outputting to a new data set;
* ============================================================================;
proc freq data = class.classurv15;
	tables bmi4cat / out=test ;
run;

proc print data = test;
run;


* Two-way tables in SAS;
* ============================================================================;
proc freq data = class.classurv15;
	tables persdoc * genhealth;
run;

proc freq data = class.classurv15;
	tables persdoc * genhealth / nocol nopercent;
run;


* Multiple two-way tables in SAS;
* ============================================================================;
proc freq data = class.classurv15;
	tables persdoc * (genhealth gender);
run;


* n-way tables in SAS;
* ============================================================================;
proc freq data = class.classurv15;
	tables persdoc * genhealth * gender;
run;
