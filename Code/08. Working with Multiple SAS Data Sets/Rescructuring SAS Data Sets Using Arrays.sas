/*************************************************************************************************
Restructuring SAS Data Sets Using Arrays

Examples from Applied Statistics and the SAS Programming Language

Pages 432 - 443

This code is posted for your benefit; however, I highly recommend that you practice typing your
own SAS programs as well. With the SAS programming language, as with all new languages, immersion 
seems to be the best way to learn.

*************************************************************************************************/


DATA DIAGNOSE;
   INPUT ID DX1 DX2 DX3;
DATALINES;
01 3 4 .
02 1 2 3
03 4 5 .
04 7 . .
;
*-----------------------------------------------------------*
  Example 1A: Creating multiple observations from a single   
  observation without using an array                         
*-----------------------------------------------------------*;
DATA NEW_DX1;
   SET DIAGNOSE;
   DX = DX1;
   IF DX NE . THEN OUTPUT;
   DX = DX2;
   IF DX NE . THEN OUTPUT;
   DX = DX3;
   IF DX NE . THEN OUTPUT;
   KEEP ID DX;
RUN;

*-----------------------------------------------------------*
  Example 1B: Creating multiple observations from a single   
  observation using an array                                 
*-----------------------------------------------------------*;
DATA NEW_DX;
   SET DIAGNOSE;
   ARRAY DXARRAY[3] DX1 - DX3;
   DO I = 1 TO 3;
      DX = DXARRAY[I];
      IF DX NE . THEN OUTPUT;
   END;
   KEEP ID DX;
RUN;

PROC FREQ DATA=NEW_DX;
   TABLES DX / NOCUM;
RUN;

DATA ONEPER;
   INPUT ID S1 S2 S3;
DATALINES;
01 3  4  5
02 7  8  9
03 6  5  4
;

*-----------------------------------------------------------*
  Example 2: Creating multiple observations from a single    
  observation using an array                                 
*-----------------------------------------------------------*;
DATA MANYPER;
   SET ONEPER;
   ARRAY S[3];
   DO TIME = 1 TO 3;
      SCORE = S[TIME];
      OUTPUT;
   END;
   KEEP ID TIME SCORE;
RUN;

DATA WT_ONE;
   INPUT ID WT1 - WT6;
DATALINES;
01 155   158   162   149   148   147
02 110   112   114   107   108   109
;
*------------------------------------------------------------*
  Example 3: Using a multi-dimensional array to restructure   
  a data set                                                  
*------------------------------------------------------------*;
DATA WT_MANY;
   SET WT_ONE;
   ARRAY WTS[2,3] WT1-WT6;
   DO COND = 1 TO 2;
      DO TIME = 1 TO 3;
         WEIGHT = WTS[COND,TIME];
         OUTPUT;
      END;
   END;
   DROP WT1-WT6;
RUN;

*------------------------------------------------------------*
  Example 4A: Creating a data set with one observation per    
  subject from a data set with multiple observations per      
  subject. (Caution: This program will not work if there      
  are any missing time values.)                               
*------------------------------------------------------------*;
PROC SORT DATA=MANYPER;
   BY ID TIME;
RUN;
DATA ONEPER;
   ARRAY S[3] S1-S3;
   RETAIN S1-S3;
   SET MANYPER;
   BY ID;
   S[TIME] = SCORE;
   IF LAST.ID THEN OUTPUT;
   KEEP ID S1-S3;
RUN;

DATA MANYPER2;
   INPUT ID TIME SCORE;
DATALINES;
01 1  3
01 2  4
01 3  5
02 1  7
02 3  9
03 1  6
03 2  5
03 3  4
;
*------------------------------------------------------------*
  Example 4B: Creating a data set with one observation per    
  subject from a data set with multiple observations per      
  subject (corrected version)                                 
*------------------------------------------------------------*;
PROC SORT DATA=MANYPER2;
   BY ID TIME;
RUN;
DATA ONEPER;
   ARRAY S[3] S1-S3;
   RETAIN S1-S3;
   SET MANYPER2;
   BY ID;
   IF FIRST.ID THEN DO I = 1 TO 3;
      S[I] = .;
   END;
   S[TIME] = SCORE;
   IF LAST.ID THEN OUTPUT;
   KEEP ID S1-S3;
RUN;

*-----------------------------------------------------------*
  Example 5: Creating a data set with one observation per    
    subject from a data set with multiple observations per    
    subject using a Multi-dimensional array    
*-----------------------------------------------------------*;
PROC SORT DATA=WT_MANY;
   BY ID COND TIME;
RUN;
DATA WT_ONE;
   ARRAY WT[2,3] WT1-WT6;
   RETAIN WT1-WT6;
   SET WT_MANY;
   BY ID;
   IF FIRST.ID THEN
      DO I = 1 TO 2;
         DO J = 1 TO 3;
            WT[I,J] = .;
         END;
      END;
   WT[COND,TIME] = WEIGHT;
   IF LAST.ID THEN OUTPUT;
   KEEP ID WT1-WT6;
RUN;
PROC PRINT DATA=WT_ONE;
   TITLE 'WT_ONE Again';
RUN;



/*************************************************************************************************
From SAS e-course
*************************************************************************************************/
proc print data = ostar.employee_donations;
run;

data rotate (keep = employee_id period amount);
	set ostar.employee_donations (drop = recipients paid_by);
	array contrib{4} qtr1-qtr4;
	do i = 1 to 4;
		if contrib{i} ne . then do;
			period = cats("Qtr", i);
			Amount = contrib{i};
			output;
		end;
	end;
run;

proc print data = rotate;
run;

proc transpose data = ostar.employee_donations
	out = rotate2;
run;

proc print data = rotate2;
run;

proc transpose data = ostar.employee_donations
	out = rotate3 (rename = (col1 = Amount))
	name = Period;
	by employee_id;
run;

proc print data = rotate3;
run;

proc freq data = rotate3;
	where amount ne .;
	tables period / nocum nopct;
	label Period = ;
run;


***Watch modifying and enhancing transpose;
