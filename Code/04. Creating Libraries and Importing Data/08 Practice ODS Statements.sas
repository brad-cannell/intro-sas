/*************************************************************************************************
Module 3: Creating Libraries and Importing Data

Practice: Send Output to the PDF and RTF Destinations

This code is posted for your benefit; however, I highly recommend that you practice typing your
own SAS programs as well. With the SAS programming language, as with all new languages, immersion 
seems to be the best way to learn.

*************************************************************************************************/

*Import the supply data if necessary;
proc import out = ntrhd.supplies
	datafile = '\\hscms8\SAS_Class\mbc0022\ntrhd\supplies.xls'
	dbms = xls replace;
	sheet = 'Location 1';
	getnames = yes;
	mixed = yes;
run;

*Create a list report of ntrhd.supplies;
proc print data = ntrhd.supplies;
run;


*Step 2: Create the myprint1.pdf file on the desktop;
ods pdf file = 'C:\Users\mbc0022\Desktop\myprint1.pdf';

proc print data = ntrhd.supplies;
run;

ods pdf close;

*Step 4: Additionally create the myprint1.rtf file on the desktop;
ods pdf file = 'C:\Users\mbc0022\Desktop\myprint1.pdf';
ods rtf file = 'C:\Users\mbc0022\Desktop\myprint1.rtf';

proc print data = ntrhd.supplies;
run;

ods pdf close;
ods rtf close;
