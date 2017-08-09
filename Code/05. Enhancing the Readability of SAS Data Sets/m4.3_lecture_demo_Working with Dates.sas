/*************************************************************************************************
Module 4: Enhancing the Readability of SAS Data Sets

More on working with dates:
1. Calculating age from date of birth
2. Calculating age at a certain date
3. Extracting parts of a date
4. Building a single SAS date when parts are in separate variables

This code is posted for your benefit; however, I highly recommend that you practice typing your
own SAS programs as well. With the SAS programming language, as with all new languages, immersion 
seems to be the best way to learn.

*************************************************************************************************/

*Loading the formats for hospital4;
options fmtsearch = (ntrhd);

*Using dob to calculate exact age;
data ntrhd.hospital4;
     set ntrhd.hospital3;
     age = yrdif(dob, date, 'Actual');
run;

proc print data=ntrhd.hospital4;
	title "Date of Birth and Age of Hospital Survey Participants";
	var dob age;
	id id;
run;




*If you want the age as of the person's last birthday;
data ntrhd.hospital5;
     set ntrhd.hospital4;
     age2 = int(yrdif(dob, date, 'Actual'));
run;

proc print data=ntrhd.hospital5;
	title "Date of Birth and Age (at last birthday)";
	title2 "of Hospital Survey Participants";
	var dob age age2;
	id id;
run;




*If you want to round the age to the nearest year;
data ntrhd.hospital6;
     set ntrhd.hospital5;
     age3 = round(yrdif(dob, date, 'Actual'));
run;

proc print data=ntrhd.hospital6;
	title "Date of Birth and Age (Rounded) of Hospital Survey Participants";
	var dob age age2 age3;
	id id;
run;




*What if we want to know their age as of the beginning
of the year (January 1st, 2013)?;
data ntrhd.hospital7;
	set ntrhd.hospital6;
	age4 = yrdif(dob, '01Jan2013'd, 'Actual');
run;

proc print data=ntrhd.hospital7;
	title "Date of Birth, Age at Survey, and Age at Beginning of the Year";
	var dob age age2 age3 age4;
	id id;
run;




*What if we want to know their age as of today?;
data ntrhd.hospital8;
	set ntrhd.hospital7;
	age5 = yrdif(dob, today(), 'Actual');
run;

proc print data=ntrhd.hospital8;
	title "Date of Birth, Age at Survey, & Current Age";
	var dob age age2 age3 age4 age5;
	id id;
run;




*Extracting the day of the week, day of the month, month,
and year from a date;
data ntrhd.hospital9;
	set ntrhd.hospital8;
	dayofweek = weekday(dob);
	dayofmonth = day(dob);
	month = month(dob);
	year = year(dob);
run;

proc print data=ntrhd.hospital9;
	title "Viewing Extracted Parts of Date of Birth";
	var dob dayofweek--year;
	id id;
run;




*Sorting by year of birth;
proc sort data=ntrhd.hospital9;
	by year;
run;

proc print data=ntrhd.hospital9;
	title "Viewing Extracted Parts of Date of Birth";
	title2 "Sorted by Year of Birth";
	var dob dayofweek--year;
	id id;
run;




*Building a SAS date separate month, day, and year variables;
data ntrhd.hospital10;
	set ntrhd.hospital9;
	dob2 = mdy(month, dayofmonth, year);
	format	dob2 mmddyy10.;
run;

proc print data=ntrhd.hospital10;
	title "Viewing Date of Birth";
	title2 "Built from separate month, day, and year variables";
	var dob dayofmonth--dob2;
	id id;
run;
