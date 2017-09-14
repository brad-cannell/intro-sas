* ============================================================================;
* Lab: Enhancing the Readability of SAS Data Sets

* This code is posted for your benefit. However, I highly recommend that you 
* practice typing your own SAS programs as well. With the SAS programming 
* language, as with all new languages, immersion seems to be the best way to 
* learn.
* ============================================================================;

* Task 1. 
* Create a new permanent SAS data set from the hospital survey data called hosp1. 
* In the same step, use the Hospital Survey Codebook to create SAS labels for 
* all variables in the data set.;

libname hosp "C:\Users\mbc0022\Desktop";

proc import out = hosp.hosp1
	datafile    = "C:\Users\mbc0022\Desktop\Hospital Survey.xlsx"
	dbms        = XLSX replace;
	label	    id = "Participant Identification Number"
			    gender = "Gender"
			    dob = "Date of Birth"
			    income = "Annual Household Income"
			    addate = "Date of Admission"
			    disdate = "Date of Discharge"
			    ins = "Type of Insurance Used"
			    visits = "Vists by Friends and Family"
			    pro1 = "Professionalism of Nursing Staff"
			    pro2 = "Professionalism of Physicians"
			    food = "Quality of Food"
			    clean = "Overall Hospital Cleanliness"
			    check1 = "Check-in Time"
			    check2 = "Check-out Time"
			    reco = "Recommend Hospital";
run;


* Task 2. 
* Using the CONTENTS procedure, produce a report about the contents of the 
* hosp1 data set. 
* Save it as Lab4_Task2.html. Give the report a descriptive title and a 
* footnote with the current date and time.;
ods html file = 'C:\Users\mbc0022\Desktop\Lab4_Task2.html'; 
proc contents data = hosp.hosp1 varnum;
	title1 "Viewing the Descriptor Portion of HOSP1";
	footnote "&sysdate and &systime";
run;
ods html close;


* Task 3. 
* Using the FORMAT procedure, create formats for the following variables: 
* ins, pro1, pro2, food, clean, check1, check2, and reco.;
proc format;
	value	ins	        0 = "No Insurance"
						1 = "Employer"
						2 = "Privately Insured"
						3 = "Medicare"
						4 = "Medicaid"
						5 = "Military"
						6 = "VA"
						7 = "Indian Health Service"
						8 = "Multiple";

	value	likert	    1 = "Excellent"
					    2 = "Good"
					    3 = "No Opinion"
					    4 = "Fair"
					    5 = "Poor";

	value	standard01_	0 = "No"
						1 = "Yes";
run;


* Task 4.  
* Create a list report of the first 10 observations in your data. 
* Make sure to apply the variable labels you created in Task 1, and the formats 
* you created in Task 4. Save it as Lab4_Task4.html.Give the report a 
* descriptive title, and a footnote with the current date and time.;
ods html file = 'C:\Users\mbc0022\Desktop\Lab4_Task4.html'; 
proc print data = hosp.hosp1 (obs = 10) label;
	format 	ins ins. 
			pro1 pro2 food clean likert.
			check1 check2 reco standard01_.; 
	title1 "Viewing the First 10 Observations of HOSP1";
	footnote "&sysdate and &systime";
run;
ods html close;


* Task 5. 
* Run the CONTENTS procedure on the hosp1 data set. 
* Save the report as Lab4_Task5.html. Give the report a descriptive title, 
* and a footnote with the current date and time.;
ods html file = 'C:\Users\mbc0022\Desktop\Lab4_Task5.html'; 
proc contents data = hosp.hosp1 varnum;
	title1 "Viewing the Descriptor Portion of HOSP1";
	footnote "&sysdate and &systime";
run;
ods html close;


* Task 6. 
* In a DATA step create a new data set called hosp2.
* Permanently assign formats for the following variables:
* ins, pro1, pro2, food, clean, check1, check2, and reco.;
data hosp.hosp2;
	set hosp.hosp1;
	format 	ins ins. 
			pro1 pro2 food clean likert.
			check1 check2 reco standard01_.;
run;


* Task 7. 
* Run the CONTENTS procedure on the hosp1 data set. 
* Save the report as Lab4_Task7.html. 
* Give the report a descriptive title and a footnote with the current date and 
* time.;
ods html file = 'C:\Users\mbc0022\Desktop\Lab4_Task7.html'; 
proc contents data = hosp.hosp2;
	title1 "Viewing the Descriptor Portion of HOSP2";
	footnote "&sysdate and &systime";
run;
ods html close;


* Task 8. Create a list report of observations 5 -15 only. 
* Save the report as Lab4_Task8.html. Give the report a descriptive 
* title and a footnote with the current date and time.;
ods html file = 'C:\Users\mbc0022\Desktop\Lab4_Task8.html'; 
proc print data = hosp.hosp2 (firstobs = 5 obs = 15) label;
	title1 "Viewing Observations 5-15 of HOSP2";
	footnote "&sysdate and &systime";
run;
ods html close;

