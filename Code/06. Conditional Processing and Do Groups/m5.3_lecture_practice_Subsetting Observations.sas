/*************************************************************************************************
Practice: Subset Observations in the DATA Step

This code is posted for your benefit; however, I highly recommend that you practice typing your
own SAS programs as well. With the SAS programming language, as with all new languages, immersion 
seems to be the best way to learn.

*************************************************************************************************/

*Creating a new SAS data set called practice1 that contains a subset of the observations in
 ntrhd.staff;
data practice1;
	set ntrhd.staff;
run;

*Creating list report of practice1;
proc print data = practice1;
run;

