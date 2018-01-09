* ============================================================================;
* Practice: Continuous Outcome and Categorical Predictor

* This code is posted for your benefit; however, I highly recommend that you
* practice typing your own SAS programs as well. With the SAS programming
* language, as with all new languages, immersion seems to be the best way to
* learn.
* ============================================================================;

* Use a SET statement in a DATA step to read hsb1.sas7bdat into your work
* library;
* ============================================================================;
data hsb1;
	set "Z:\Dropbox\UNTHSC Admin and Teaching\Courses\5147-Fall 2014\
	BACH_EPID 5313\Data\High School and Beyond\hsb1.sas7bdat";
run;


* Use the SGPLOT procedure to create a side-by-side boxplot for the variable
* math over levels of the variable prog. Which program appears to produce the
* highest math scores?;
* ============================================================================;
proc sgplot data = hsb1;
	vbox math / category = prog;
run;


* Program #2 appears to produce the highest math scores;


* Write a PROC MEANS step to investigate the relationship between math and prog.
* Do the results change your previous conclusion?;
* ============================================================================;
proc means data = hsb1;
	class prog;
	var math;
run;


* The results of PROC MEANS confirm our previous findings. With a mean score of
* 56.7, program #2 appears to produce the highest average math scores;
