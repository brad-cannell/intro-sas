/*************************************************************************************************
Module 4: Enhancing the Readability of SAS Data Sets

Using Labels in SAS

This code is posted for your benefit; however, I highly recommend that you practice typing your
own SAS programs as well. With the SAS programming language, as with all new languages, immersion 
seems to be the best way to learn.

*************************************************************************************************/

*Import hospital survey data;

*View the contents of hospital1;
proc contents data=ntrhd.hospital1;
run;

*Add variable labels to hospital1;
data ntrhd.hospital2;
	set ntrhd.hospital1;
	label 	addate = 'Date of admission'
			check1 = 'Check-in Process';
run;

*View the descriptor portion of hospital2;
proc contents data=ntrhd.hospital2;
run;

*View the data portion of the hospital2 data;
proc print data=ntrhd.hospital2;
run;

*View the hospital2 data again;
proc print data=ntrhd.hospital2 label;
run;

*View just the first 10 observations in hospital1;
proc print data=ntrhd.hospital2 (obs=10) label;
run;

*Remove labels;
data hosp;
	set ntrhd.hospital2;
	label	addate = 
			check1 = ;
run;










