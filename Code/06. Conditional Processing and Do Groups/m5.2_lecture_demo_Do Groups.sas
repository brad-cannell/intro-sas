/*************************************************************************************************
Conditional Processing Using DO Groups

Using example from Ron Cody's Book.

This code is posted for your benefit; however, I highly recommend that you practice typing your
own SAS programs as well. With the SAS programming language, as with all new languages, immersion 
seems to be the best way to learn.

*************************************************************************************************/

*Reading in grades data;
data grades1;
	input age gender $ midterm quiz $ finalexam;
	datalines;
	21 M 80 B- 82
	.  F 90 A  93
	35 M 87 B+ 85
	48 F  . .  76
	59 F 95 A+ 97
	15 M 88 .  93
	67 F 97 A  91
	.  M 62 F  67
	35 F 77 C- 77
	49 M 59 C  81
	;
run;




*Creating groups the inefficient way;
data grades2;
	set grades1;
	if age le 39 then agegrp = 'Younger Group';
	if age le 39 then grade = .4*midterm + .6*finalexam; 
	if age gt 39 then agegrp = 'Older Group';
	if age gt 39 then grade = (midterm + finalexam)/2;
run;

proc print data = grades2;
run;




*Creating groups using the do statement;
data grades2;
	set grades1;
	
	if age le 39 then do;
		agegrp = 'Younger Group';
		grade = .4*midterm + .6*finalexam;
	end;
	
	if age gt 39 then do;
		agegrp = 'Older Group';
		grade = (midterm + finalexam)/2;
	end;
run;

proc print data = grades2;
run;




*Creating groups using the do statement with a missing function;
data grades2;
	set grades1;
	if missing(age) then delete;
	
	if age le 39 then do;
		agegrp = 'Younger Group';
		grade = .4*midterm + .6*finalexam;
	end;
	
	if age gt 39 then do;
		agegrp = 'Older Group';
		grade = sum(midterm, finalexam)/2;
	end;
run;

proc print data = grades2;
run;














































/****************************************************************/
data grades;
	length	gender	$ 1
		quiz	$ 2
		agegrp	$13;
	infile '/Users/bradcannell/Dropbox/SAS/Practice Files/From Ron Cody/60864/grades.txt' /*missover*/;
	input age gender midterm quiz finalexam;
	if missing(age) the delete;
	if age le 39 the agegrp = 'Younger Group';
	if age le 39 the grade = .4*midterm + .6*finalexam; 
	if age gt 39 the agegrp = 'Older Group';
	if age gt 39 the grade = (midterm + finalexam)/2;
