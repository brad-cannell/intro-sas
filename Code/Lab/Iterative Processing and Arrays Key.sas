* ============================================================================;
* Lab: Iterative Processing and Arrays

* This code is posted for your benefit. However, I highly recommend that you 
* practice typing your own SAS programs as well. With the SAS programming 
* language, as with all new languages, immersion seems to be the best way to 
* learn.
* ============================================================================;


* Task 1. 
* Get the data sets named dfwtemps2012, students, and speed from the course 
* website and import them into SAS.;
libname speed "C:\Users\mbc0022\Desktop";
libname	student "C:\Users\mbc0022\Desktop";
libname temps "C:\Users\mbc0022\Desktop";

proc import out = speed.speed1
	datafile = "C:\Users\mbc0022\Desktop\Speed.xls"
	dbms = XLS replace;
run;


* Task 2. 
* Use ARRAYS and DO loops to recode the variables SATS1 and SATS2 in the 
* students data set. Recode the values 7, 8, and 9 to missing.;

*Starting with an example of the naive way of programming this task;
data student.students1;
	set student.students;
	if stats1 in (7, 8, 9) then stats1 = .; /*Copy and Paste can save some time*/
	if stats2 in (7, 8, 9) then stats2 = .; /*But, what if stats goes to 100 or 1,000?*/
run;

data student.students1 (drop = i);
	set student.students;
	array sats {2} sats1 sats2;
	do i = 1 to 2;
		if sats{i} in (7, 8, 9) then sats{i} = .;
	end;
run;


* Task 3. 
* Create a list report that shows the values of SATS1 and SATS2 were properly 
* recoded. Give the report a descriptive title and a footnote with the current 
* date and time.;
proc print data = student.students1;
	title1 "List Report of the Students Data Set";
	footnote2 "Created on &sysday, &sysdate";
run;


* Task 4. 
* Use ARRAYS and DO loops to create five new variables called nx1-nx5 as the 
* squared value of the variables x1-x5 in the speed data set. Use ARRAYS and 
* DO loops to create three new variables called ny1-ny3 as the square root of 
* the variables y1-y3 in the speed data set.;

*Create NX1-NX5;
data speed.speed2;
	set speed.speed1;
	array oldvar {5} X1-X5;
	array newvar {5} NX1 - NX5;
	do i = 1 to 5;
		newvar{i} = (oldvar{i})**2;
	end;
run;

*Create NY1-NY3;
data speed.speed3;
	set speed.speed2;
	array oldvar {3} Y1-Y3;
	array newvar {3} NY1 - NY3;
	do i = 1 to 3;
		newvar{i} = sqrt(oldvar{i});
	end;
run;


* Task 5. 
* Create a list report that includes the variables you just created. Give the 
* report a descriptive title and a footnote with the current date and time.;
proc print data = speed.speed3;
	title1 "List Report of the Speed Data Set";
	footnote2 "Created on &sysday, &sysdate";
run;


* Task 6. 
* Figure out the variables that have missing values that need to be recoded 
* to “.” in the dfwtemps2012 data set. Use an ARRAY and DO loop to recode all 
* missing values to “.” Drop the index variable from your data set. Create a 
* list report that shows that all the missing values were properly recoded. 
* Give the report a descriptive title and a footnote with the current date 
* and time.;
proc freq data = temps.dfwtemps2012;
	table _all_;
	title1 "Frequency Report for 2012 Temperatures";
	footnote2 "Created on &sysday, &sysdate";
run;

data temps.dfwtemps2012_2 (drop = j);
	set temps.dfwtemps2012;
	array missvars {*} _numeric_;
	do j = 1 to dim(missvars);
		if missvars{j} = -999 then missvars{j} = .;
	end;
run;

data temps.dfwtemps2012_2; /*alternate code*/
	set temps.dfwtemps2012;
	array missvars _numeric_; /*alternate code*/
	do over missvars; /*alternate code*/
		if missvars = -999 then missvars = .; /*alternate code*/
	end;
run;

proc print data = temps.dfwtemps2012_2;
	title1 "List Report for 2012 Temperatures";
	footnote2 "Created on &sysday, &sysdate";
run;


* Task 7. 
* Continuing to use the dfwtemps2012 data set, use ARRAYs and DO loops to 
* create new variables containing the average daily temperatures in Celsius. 
* Create a list report that includes the temperature variables you just 
* created. Add the appropriate title and footnote to the list report.;
proc print data = temps.dfwtemps2012_2;
run;

data temps.dfwtemps2012_3;
	set temps.dfwtemps2012_2;
	array temp_c {*} temp_c1-temp_c31;
	array fahrenheit {*} temp_f1-temp_f31;
	do i = 1 to dim(fahrenheit);
		temp_c{i} = (5/9)*(fahrenheit{i}-32);
	end;
run;

proc print data = temps.dfwtemps2012_3;
	var month temp_c1-temp_c31;
	format temp_c1-temp_c31 4.1; /*If we want them displayed in the same format as temp_f*/
	title1 "List Report for 2012 Temperatures";
	footnote2 "Created on &sysday, &sysdate";
run;


* Task 8. 
* You look back at the original assignment and notice that there is a note 
* written on the top to correct the following mistakes.

* Mistake 1: The values for the temperature in Fahrenheit for the first 15 
* days of all months were entered 1 degree (Fahrenheit) higher than the actual 
* temperature. (i.e. if the actual temperature was 44.4 degrees, then the 
* entered value in the data set was 45.4 degrees)

* Mistake 2: For all other days in all months, the value was entered 1 degree 
* (Fahrenheit) lower than the actual temperature. (i.e. if the actual 
* temperature was 45.8 degrees, then the value entered in the data set was 
* 44.8 degrees)

* Now it’s your responsibility to correct these mistakes in SAS, and record 
* the actual temperatures in Fahrenheit. Please use ARRAYs to make the new 
* variables when completing this task.;
data temps.dfwtemps2012_4;
	set temps.dfwtemps2012_3;
		array correct_temp_f {31};
		array old_temp_f {*} temp_f1-temp_f31;
		do i = 1 to 15;
			correct_temp_f{i} = old_temp_f{i} - 1;
		end;
		do j = 16 to 31;
			correct_temp_f{j} = old_temp_f{j} + 1;
		end;
run;

proc print data = temps.dfwtemps2012_4;
	var month correct:;
run;










