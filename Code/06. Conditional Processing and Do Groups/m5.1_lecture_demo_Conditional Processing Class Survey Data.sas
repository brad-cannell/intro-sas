/*************************************************************************************************
Demonstration: Importing and Modifying Class Survey Data Using IF-THEN-ELSE Statements

This code is posted for your benefit; however, I highly recommend that you practice typing your
own SAS programs as well. With the SAS programming language, as with all new languages, immersion 
seems to be the best way to learn.

*************************************************************************************************/

*Get the class survey data into SAS;
PROC IMPORT OUT= CLASS.SURVEY 
            DATAFILE= "\\hscms8\SAS_Class\mbc0022\Data\Day one survey\Day One Survey.xlsx" 
            DBMS=EXCEL REPLACE;
     RANGE="'5313__5314_Day_One_Survey#csv$'"; 
     GETNAMES=YES;
     MIXED=NO;
     SCANTEXT=YES;
     USEDATE=YES;
     SCANTIME=YES;
RUN;

*Creating id for each participant;
data class.survey2;
	set class.survey;
	id = _N_;
run;

*Make id the first variable in the dataset;
data class.survey3;
	retain id;
	set class.survey2;	
run;

*Data step using keep statement;
data class.survey4;
	set class.survey3;
	keep id Q19_1 Q26 Q27;
run;

*Rename the variables;
data class.survey5;
	set class.survey4;
	rename	Q19_1 = children
			Q26	= gender
			Q27	= color;
	label	Q19_1 = 'Num children in house'
			Q26	= 'Participant gender'
			Q27	= 'Participant favorite color';
run;

*Create formats;
proc format library=class;
	value	gender		1='Male'
						2='female';
				
	value	color		1='Black'
						2='Blue'
						3='Gray'
						4='Green'
						5='Orange'
						6='Pink'
						7='Purple'
						8='Red'
						9='White'
						10='Yellow';
run;

*load formats;
options fmtsearch = (class);

*Apply formats;
data class.survey6;
	set class.survey5;
	format	gender	gender.
			color	color.
			;
run;




*Create groups defined by number of children in household;
data class.survey7;
	set class.survey6;
	if children < 1 then child3cat = 0;
	if children = 1 then child3cat = 1;
	if children > 1 then child3cat = 2;
run;

proc print data = class.survey7;
run;

*Percent of the class with no children;
proc freq data=class.survey7;
	table children;
run;

*Comparing frequencies in children and child3cat;
proc freq data=class.survey7;
	table children child3cat;
run;




*A correct way to create groups defined by number of children in household;
data class.survey7;
	set class.survey6;
	if children = 0 then child3cat = 0;
	if children = 1 then child3cat = 1;
	if children > 1 then child3cat = 2;
run;


*Another way to create groups defined by number of children in household;
data class.survey7;
	set class.survey6;
	if children > . and children < 1 then child3cat = 0;
	if children = 1 then child3cat = 1;
	if children > 1 then child3cat = 2;
run;

*Comparing frequencies in children and child3cat again;
proc freq data=class.survey7;
	table children child3cat;
run;




*Create children in household groups using if-then-else;
data class.survey7;
	set class.survey6;
	if children > . and children < 1 then child3cat = 0;
	else if children = 1 then child3cat = 1;
	else if children > 1 then child3cat = 2;
run;

*Even more efficient version;
data class.survey7;
	set class.survey6;
	if missing(children) then child3cat = .;
	else if children < 1 then child3cat = 0;
	else if children = 1 then child3cat = 1;
	else if children > 1 then child3cat = 2;
run;

*Comparing frequencies in children and child3cat again;
proc freq data=class.survey7;
	table children child3cat;
run;
