/*************************************************************************************************
Module 3: Creating Libraries and Importing Data

Practice: Create a SAS data set from Delimited Raw Data, and specify variable length

This code is posted for your benefit; however, I highly recommend that you practice typing your
own SAS programs as well. With the SAS programming language, as with all new languages, immersion 
seems to be the best way to learn.
*************************************************************************************************/

*Reading in comma separated value (.csv) files;
data NewEmployees;
	infile '\\hscms8\SAS_Class\mbc0022\ntrhd\newemps.csv' dsd firstobs=2;
	length First $ 12 Last $ 18 Title $ 25;
	input First $ Last $ Title $ Salary;
run;

proc print data = NewEmployees;
run;
