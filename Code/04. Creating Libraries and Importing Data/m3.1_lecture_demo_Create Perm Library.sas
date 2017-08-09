/*************************************************************************************************
Module 3: Creating Libraries and Importing Data

Creating Permanent SAS Data Sets

This code creates a SAS library called "ntrhd" that includes a SAS data set called
"height_and_weight"

This code is posted for your benefit; however, I highly recommend that you practice typing your
own SAS programs as well. With the SAS programming language, as with all new languages, immersion 
seems to be the best way to learn.
*************************************************************************************************/

*Example of a valid libref;
libname ntrhd "C:\Users\mbc0022\Desktop\SAS\ntrhd";

data ntrhd.height_and_weight;
	input id $ sex $ ht_in wgt_lbs;
	datalines;
	001 Male 71 190
	002 Male 69 176
	003 Female 64 130
	004 Female 65 154
run;






*Example of deleting a file in its physical location;
data ntrhd.example;
	input x1 x2;
	datalines;
	1 2
	1 2
;
run;
