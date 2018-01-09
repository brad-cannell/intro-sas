* ============================================================================;
* Lab:Hypothesis Testing

This lab is not longer part of the course.
* ============================================================================;

* Task 1. 
* Some studies of Alzheimer’s disease (AD) have shown an increase in CO2 
* production in patients with the disease. In one such study the following 
* CO2 values were obtained from 16 neocortical biopsy samples from AD patients.
* ============================================================================;
Data alz;
	input co2 @@;
datalines;
1009 1280 1180 1255 1547 2352 1956 1080
1776 1767 1680 2050 1452 2857 3100 1621
;
run;


* Write a SAS program to calculate the mean value of CO2 along with its 
* corresponding 95% confidence interval.;
proc means data = alz mean stderr clm;
	var co2;
run;


* Task 2. 
* Does sensory deprivation have an effect on a person’s alpha-wave frequency? 
* Twenty volunteer subjects were randomly divided into two groups. Subjects 
* in group A were subjected to a 10-day period of sensory deprivation, while 
* subjects in group B served as controls. At the end of the experimental 
* period, the alpha-wave frequency component of subjects’ 
* electroencephalograms was measured. The results were as follows:
* ============================================================================;
data alpha;
 	input subject $ alpha_wave;
 datalines;
 A 10.2
 A 9.5
 A 10.1
 A 10.0
 A 9.8
 A 10.9
 A 11.4
 A 10.8
 A 9.7
 A 10.4
 B 11.0
 B 11.2
 B 10.1
 B 11.4
 B 11.7
 B 11.2
 B 10.8
 B 11.6
 B 10.9
 B 10.9
;
run;


* Write a SAS program to test for a difference in mean alpha wave frequency 
* between groups.;
proc ttest data = alpha;
	class subject;
	var alpha_wave;
run;


* Task 3. 
* The following table shows the time (in minutes) for subjects to feel relief 
* from headache pain:
* ============================================================================;
data medicine;
	input Type $ Mins;
datalines;
A 40
A 42
A 48
A 35
A 62
A 35
T 35
T 37
T 42
T 22
T 38
T 29
;
run;


* Write a SAS program to test for a difference in mean time to relief between 
* medications;
proc ttest data = medicine;
	class type;
	var mins;
run;


* Demonstrating result from regression model;
data medicine;
	set medicine;
	if type = "A" then aspirin = 1;
	if type = "T" then aspirin = 0;
run;

proc reg data = medicine;
	model mins = aspirin;
run;
quit;


* Task 4. 
* Please copy, paste, and run the following SAS code to perform a Chi-Square 
* test:
* ============================================================================;
data wt_ht;
	input wgt $ height $ n;
datalines;
0-150 0-70 156
0-150 70+ 78
150+ 70+ 193
150+ 0-70 112
run;

proc freq data = wt_ht;
	tables wgt*height / expected chisq nocol norow;
	weight n;
run;






