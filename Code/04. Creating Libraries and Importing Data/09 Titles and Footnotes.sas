/*************************************************************************************************
Module 3: Creating Libraries and Importing Data

Adding Titles and Footnote to Reports

This code is posted for your benefit; however, I highly recommend that you practice typing your
own SAS programs as well. With the SAS programming language, as with all new languages, immersion 
seems to be the best way to learn.

*************************************************************************************************/

*Example of list report with titles and footnotes;

title1 'North Texas Regional Health Department';
title2 'New Employees';
footnote3 'Confidential';

proc print data = ntrhd.newemps;
run;

*Example of two reports with titles and footnotes;

proc print data = ntrhd.newemps;
	title1 'North Texas Regional Health Department';
	title2 'New Employees';
	footnote3 'Confidential';
run;

proc contents data = ntrhd.newemps;
run;

*Another Example of two reports with titles and footnotes;

proc print data = ntrhd.newemps;
	title1 'North Texas Regional Health Department';
	title2 'New Employees';
	footnote3 'Confidential';
run;

proc contents data = ntrhd.newemps;
	title1 'Contents Report';
	title2 'NewEmps Data';
	footnote3 'Not Confidential';
run;

*Example of changing titles and footnotes;

proc print data = ntrhd.newemps;
	title1 'North Texas Regional Health Department';
	title3 'New Employees';
run;

proc contents data = ntrhd.newemps;
	title2 'Contents Report';
run;

*Example of canceling titles and footnotes;

proc print data = ntrhd.newemps;
	title1 'North Texas Regional Health Department';
	title3 'New Employees';
run;

proc contents data = ntrhd.newemps;
	title;
	footnote;
run;






