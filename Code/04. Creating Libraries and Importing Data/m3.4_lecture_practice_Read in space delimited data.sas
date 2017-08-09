/*************************************************************************************************
Module 3: Creating Libraries and Importing Data

Practice: Create a SAS data set from delimited raw data

This code is posted for your benefit; however, I highly recommend that you practice typing your
own SAS programs as well. With the SAS programming language, as with all new languages, immersion 
seems to be the best way to learn.
*************************************************************************************************/

*Reading in the .dat file called "donation". Values in this data are delimited by single spaces;
data QtrDonation;
	infile '\\hscms8\SAS_Class\mbc0022\ntrhd\donation.dat';
	input IDNum $ Qtr1 Qtr2 Qtr3 Qtr4;
run;

*View the data portion of the SAS data set "QtrDonation";
proc print data=QtrDonation;
run;
