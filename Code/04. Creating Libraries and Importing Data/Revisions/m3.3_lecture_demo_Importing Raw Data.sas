/*************************************************************************************************
Module 3: Creating Libraries and Importing Data

Reading-In / Importing Data Into SAS

The goal of this lecture is to learn how to read data files into SAS so that we can manipulate it, 
analyze it, and present our results.

This code is posted for your benefit; however, I highly recommend that you practice typing your
own SAS programs as well. With the SAS programming language, as with all new languages, immersion 
seems to be the best way to learn.
*************************************************************************************************/

*Reading in text (.txt) files;
data ht_wt1;
	infile 'C:\Users\mbc0022\Desktop\single 3.txt' firstobs=2;
	input id $ sex $ ht_in wt_lbs BMI_Cat $;
run;









*Reading in comma separated value (.csv) files;
data ht_wt2;
	infile 'C:\Users\mbc0022\Desktop\comma.csv' dsd firstobs=2;
	input id $ sex $ ht_in wt_lbs BMI_Cat;
run;









*Reading in tab-demilited (.txt) files;
data ht_wt3;
	infile 'C:\Users\mbc0022\Desktop\tab.txt' dlm='09'x firstobs=2;
	input id $ sex $ ht_in wt_lbs;
run;









*Reading in raw data with values longer than 8 bytes, using the LENGTH statement;
data ht_wt4;
	infile 'C:\Users\mbc0022\Desktop\single.txt' firstobs=2;
	length id $ 3 BMI_Cat $ 13;
	input id $ sex $ ht_in wt_lbs BMI_Cat $;
run;

*Viewing the data portion of ht_wt4;
proc print data=ht_wt4;
run;









*Importing a Microsoft Excel Spreadsheet (.xls);
proc import out=ht_wt5
	datafile = 'C:\Users\mbc0022\Desktop\excel.xls'
	dbms = xls replace;
	sheet = 'Sheet1';
	getnames = yes;
	mixed = yes;
run;

*Viewing the data portion of ht_wt5;
proc print data = ht_wt5;
run;









*Importing another Microsoft Excel Spreadsheet (.xls);
proc import out=ht_wt6
	datafile = 'C:\Users\mbc0022\Desktop\excel 2.xls'
	dbms = xls replace;
	sheet = 'Sheet1';
	getnames = yes;
	mixed = yes;
run;

*Viewing the data portion of ht_wt6;
proc print data = ht_wt6;
run;

*View the descriptor portion of ht_wt6;
proc contents data = ht_wt6;
	ods select Variables;
run;








*Reading in data with fixed columns using the formatted input method;
data ht_wt7;
	infile 'C:\Users\mbc0022\Desktop\fixed.txt' firstobs=2;
	input @1	id	$3.
	      @5	sex	$6.
	      @12	ht_in	2.
	      @18	wt_lbs	3.
	      @26	dob	mmddyy10.
	      @37	income	dollar7.;
run;

*View the data portion of the SAS data set ht_wt7;
proc print data = ht_wt7;
run;









*Reading in a SAS dataset;
data ht_wt8;
	set 'C:\Users\mbc0022\Desktop\height_and_weight.sas7bdat';
	rename id=subj sex=gender;
run;
