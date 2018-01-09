/*************************************************************************************************
Module 3: Creating Libraries and Importing Data

Using ODS Statements to Send Output to HTML, PDF, and RTF Files

This code is posted for your benefit; however, I highly recommend that you practice typing your
own SAS programs as well. With the SAS programming language, as with all new languages, immersion 
seems to be the best way to learn.

*************************************************************************************************/

*Creating an html one-way frequency report of the variable "type" within SAS;
proc print data = ntrhd.Height_and_Weight;
run;

*Saving the list report to an external html file;
ods html file = 'C:\Users\mbc0022\Desktop\report 1.html';

proc print data = ntrhd.Height_and_Weight;
run;

ods html close;


*Saving the list report to an external html, pdf, and rtf file;
ods html file = 'C:\Users\mbc0022\Desktop\report 2.html';
ods pdf file = 'C:\Users\mbc0022\Desktop\report 2.pdf';
ods rtf file = 'C:\Users\mbc0022\Desktop\report 2.rtf';

proc print data = ntrhd.Height_and_Weight;
run;

ods _all_ close;


*Submitting another procedure without reopening an ODS destination;
proc print data = ntrhd.Height_and_Weight;
run;


*Reopen the html destination;
ods preferences;
ods html newfile = proc;

proc print data = ntrhd.Height_and_Weight;
run;
