/*************************************************************************************************
Module 4: Enhancing the Readability of SAS Data Sets

Practice: Add Permanent Attributes to the NewEmployees Data Set

This code is posted for your benefit; however, I highly recommend that you practice typing your
own SAS programs as well. With the SAS programming language, as with all new languages, immersion 
seems to be the best way to learn.
*************************************************************************************************/

*Read-in newemps.csv, enhance with LENGTH statement, labels, and formats;
data NewEmployees;
	infile '\\hscms8\SAS_Class\mbc0022\ntrhd\newemps.csv' dsd firstobs=2;
	length First $ 12 Last $ 18 Title $ 25;
	input First $ Last $ Title $ Salary;
	label	First = 'First Name'
			Last = 'Last Name'
			Title = 'Job Title'
			Salary = 'Annual Salary';
	format	Salary dollar7.;
run;

proc print data = NewEmployees label;
run;




*Changing the format of Salary to dollar10.2;
data NewEmployees2;
	infile '\\hscms8\SAS_Class\mbc0022\ntrhd\newemps.csv' dsd firstobs=2;
	length First $ 12 Last $ 18 Title $ 25;
	input First $ Last $ Title $ Salary;
	label	First = 'First Name'
			Last = 'Last Name'
			Title = 'Job Title'
			Salary = 'Annual Salary';
	format	Salary dollar10.2;
run;

proc print data = NewEmployees2 label;
run;
