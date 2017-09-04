* ============================================================================;
* Lab: Creating Libraries and Importing Data

* This code is posted for your benefit. However, I highly recommend that you 
* practice typing your own SAS programs as well. With the SAS programming 
* language, as with all new languages, immersion seems to be the best way to 
* learn.
* ============================================================================;

* Task 1.
* Using a LIBNAME statement, create a permanent SAS data set called lab3;
libname lab3 "C:\Users\mbc0022\Desktop";


* Task 2. 
* Store the ncbirth30 data set from your previous homework assignment in the 
* library lab3.;
data lab3.ncbirth30;
	input pid plural sex mage weeks marital racemom hispmom $ gained smoke 
          drink tounces tgrams low premie;
	datalines;
	1 1 1 32 40 1 1 N 38 0 0 111 3146.85 0 0
	2 1 2 32 37 1 1 N 34 0 0 116 3288.6 0 0
	3 1 1 27 39 1 1 N 12 0 0 138 3912.3 0 0
	4 1 1 27 39 1 1 N 15 0 0 136 3855.6 0 0
	5 1 1 25 39 1 1 N 32 0 0 121 3430.35 0 0
	6 1 1 28 43 1 1 N 32 0 0 117 3316.95 0 0
	7 1 2 25 39 1 1 N 75 0 0 143 4054.05 0 0
	8 1 2 15 42 2 1 N 25 0 0 113 3203.55 0 0
	9 1 2 37 41 1 8 N 31 0 0 139 3940.65 0 0
	10 1 2 21 39 1 1 N 28 0 0 120 3402 0 0
	11 1 2 28 37 1 2 N 18 0 0 110 3118.5 0 0
	12 1 2 27 40 2 1 N 37 0 0 124 3515.4 0 0
	13 1 1 26 41 1 1 N 45 0 0 121 3430.35 0 0
	14 1 2 20 41 2 1 N 52 1 0 112 3175.2 0 0
	15 1 2 21 41 2 2 N 15 0 0 105 2976.75 0 0
	16 1 2 19 40 1 1 N 26 1 0 131 3713.85 0 0
	17 1 2 18 36 2 1 P 31 1 0 88 2494.8 1 1
	18 1 2 26 31 2 1 N 40 1 1 93 2636.55 1 1
	19 1 1 24 40 1 1 M 51 0 0 140 3969 0 0
	20 1 1 24 38 1 1 N 45 1 0 105 2976.75 0 0
	21 1 2 17 40 2 2 N . 0 0 121 3430.35 0 0
	22 1 1 36 37 1 1 N 25 0 0 91 2579.85 0 0
	23 1 1 21 30 1 1 N 0 1 1 51 1445.85 1 1
	24 1 1 21 38 1 1 P 20 0 0 72 2041.2 1 0
	25 1 2 26 39 1 1 N 20 0 0 116 3288.6 0 0
	26 1 2 30 38 1 1 N 38 0 0 114 3231.9 0 0
	27 1 2 32 43 2 1 M 15 0 0 114 3231.9 0 0
	28 1 1 18 40 2 2 N 20 0 0 116 3288.6 0 0
	29 1 2 21 39 2 2 N 27 0 0 120 3402 0 0
	;
run;


* Task 3. 
* Use the CONTENTS procedure to produce a report about the contents of the 
* lab3 library.;
ods html file = 'C:\Users\mbc0022\Desktop\Task 4.html'; 
proc contents data=lab3._all_;
title "Viewing the Contents of the Lab3 Library";
run;
ods html close;


* Task 7. Write a new SAS program that that creates three permanent SAS data 
* sets from these raw data sets. All three SAS data sets should be stored in 
* the permanent SAS library called choco.;
libname choco "C:\Users\mbc0022\Desktop\choco";

* Chocolate Study 1.xls;
* May need to import using Microsoft Excel Workbook on PC Files Server;
proc import out=choco.chocolate_study_1
	datafile = "C:\Users\mbc0022\Desktop\choco\Chocolate Study 1.xls"
	dbms = xls replace;
	sheet = 'choco1';
run;

* Chocolate Study 2.csv;
data choco.chocolate_study_2;
	infile "C:\Users\mbc0022\Desktop\choco\Chocolate Study 2.csv" 
		dsd firstobs=2;
	input uin $ last $ first $ age grade school $ parent $ marry $ math1 math2 
          math3 read1 read2 read3 overall choco1 choco2 choco3 extra1 extra2 $ 
          veggie;
run;

* Chocolate Study 3.txt (naive);
data choco.chocolate_study_3;
	infile "C:\Users\mbc0022\Desktop\choco\Chocolate Study 3.txt" firstobs=2;
	input uin $ last $ first $ age grade school $ parent $ marry $ math1 math2 
          math3 read1 read2 read3 overall choco1 choco2 choco3 extra1 extra2 $ 
          veggie;
run;

* Chocolate Study 3.txt (correct);
data choco.chocolate_study_3;
	infile "C:\Users\mbc0022\Desktop\choco\Chocolate Study 3.txt" firstobs=2;
	input @1 uin 5. 
		  @6 last $9. 
		  @15 first $8. 
		  @23 age 4.
		  @27 grade 6.  
		  @33 school $13. 
		  @46 parent $9.
		  @55 marry $9.
		  @64 math1 6.
		  @70 math2 6.
		  @76 math3 6.
		  @82 read1 6.
		  @88 read2 6.
		  @94 read3 6.
		  @100 overall 8. 
		  @108 choco1 7.
		  @115 choco2 7.
		  @122 choco3 7.
		  @129 extra1 7.
		  @136 extra2 $8.
		  @145 veggie 1.;
run;


* Task 8.
* Using the CONTENTS procedure, produce a report about the contents of the 
* chocolate study 1 SAS data set. Give the report a title with a description 
* of what the report is about and a footnote with the current date and time.;
ods html file = 'C:\Users\mbc0022\Desktop\Tasks 8-10.html'; 
proc contents data = choco.chocolate_study_1;
	title1 'Contents of the Chocolate study 1 Data Set';
	footnote "&sysdate and &systime";  
run;


* Task 9. Using the PRINT procedure, produce a list report from chocolate 
* study 1 that includes the following variables (in order): ID number, Last 
* Name, First Name, Choco1, Age, Grade, School. Give the report a title with 
* a description of what the report is about and a footnote with the current 
* date and time.;
proc print data = choco.chocolate_study_1;
	var uin last first choco1 age grade school;
	title1 'Listing of Selected Variables from the Chocolate study 1 Data Set';
	footnote "&sysdate and &systime";
run;
ods html close;


