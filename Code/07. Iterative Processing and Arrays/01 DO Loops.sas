/*************************************************************************************************
Module 6: Iterative Processing and Arrays

Demonstration: Simple Illustration of How DO Loops Work
Demonstration: Using the Output Statement
Demonstration: Modifying the DO Loop
Demonstration: Using DO WHILE and DO UNTIL Loops

This code is posted for your benefit; however, I highly recommend that you practice typing your
own SAS programs as well. With the SAS programming language, as with all new languages, immersion 
seems to be the best way to learn.

*************************************************************************************************/

/*
Demonstration: Simple Illustration of How DO Loops Work
*/
data simple1;
	do i = 1 to 4;
		answer = 1 + i;
	end;
run;

proc print data=simple1 noobs;
run;


/*
Demonstration: Using the Output Statement
*/
data simple2;
	do i = 1 to 4;
		answer = 1 + i;
		output;
	end;
run;

proc print data=simple2 noobs;
run;




*Simple example #3;
data simple3 (drop=i);
	do i = 1 to 4;
		answer = 1 + i;
		output;
	end;
run;

proc print data=simple3 noobs;
run;




*Simple example #4;
data simple4 (drop=i);
	do i = 0 to 10 by 2;
		answer = 1 + i;
		output;
	end;
run;

proc print data=simple4 noobs;
run;




*Simple example #5;
data simple5 (drop=i);
	do i = 0 to 10 by .25;
		answer = 1 + i;
		output;
	end;
run;

proc print data=simple5 noobs;
run;




*Simple example 6;
data simple6 (drop=i);
	do i = 10 to 1 by -1;
		answer = 1 + i;
		output;
	end;
run;

proc print data=simple6 noobs;
run;




*Simple example 7;
data simple7 (drop=i);
	do i = 10, 12, 23, 147;
		answer = 1 + i;
		output;
	end;
run;

proc print data=simple7 noobs;
run;




*Nesting do loops;
data nested;
	do i = 1 to 10;
		do j = i**2;
			output;
		end;
	end;
run;

proc print data=nested noobs;
run;




*Example of using do while;
data simple8;
	do while (answer < 11);
		answer + 1;
		output;
	end;
run;

proc print data=simple8 noobs;
run;




*Example of using do until;
data simple9;
	do until (answer > 9);
		answer + 1;
		output;
	end;
run;

proc print data=simple9 noobs;
run;

