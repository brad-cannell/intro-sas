/*************************************************************************************************
Practice: Using the IF-THEN-ELSE statement

This code is posted for your benefit; however, I highly recommend that you practice typing your
own SAS programs as well. With the SAS programming language, as with all new languages, immersion 
seems to be the best way to learn.

*************************************************************************************************/

*View the data portion of ntrhd.mosquito;
proc print data = ntrhd.mosquito;
run;

*Creating a new data set called practice1 that modifies the trap type for selected observations
in ntrhd.mosquito;
data practice1;
	set ntrhd.mosquito;
	if trap = 121136 then type = 2;
	else if trap = 121100 then type = 2;
	else if trap = 121095 then type = 2;
run;

*View the data portion of practice1;
proc print data = practice1;
run;

*Creating a new data set called practice1 that modifies the trap type for selected observations
in ntrhd.mosquito;
data practice2;
	set practice1;
	if loc = 'DL' then avg_count = 1622;
run;

*View the data portion of practice2;
proc print data = practice2;
run;
