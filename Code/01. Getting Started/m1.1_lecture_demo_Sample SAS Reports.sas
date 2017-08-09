proc format;
	value 	$title	"Laboratory Assistant I" = "I"
					"Laboratory Assistant II" = "II"
					"Laboratory Assistant III" = "III"
					"Laboratory Assistant IV" = "IV"
					"Laboratory Manager" = "M";
run;

data employees;
	set ntrhd.staff(drop=start_date end_date emp_hire_date emp_term_date);
	where job_title contains "Laboratory";
	format job_title $title.;
run;

option ls=70 nodate nonumber label;

ods _all_ close;




/* 1 - HTML report of laboratory employees */
ods html body = "First.htm";
proc print data = employees;
	title "Laboratory Employees";
	footnote;
run;
ods html close;




/* 2 - HTML report of laboratory employees unformatted */
proc sort data = employees
	out = sorted;
	by gender;
run;

proc format;
	value 	$gender	"F" = "Female"
					"M" = "Male";
run;

ods html body = "Second.htm";
proc print data = sorted noobs;
	title "Laboratory Employees";
	footnote;
	format job_title; 
	format gender $gender. salary dollar10.2;
	by gender;
	id gender;
run;
ods html close;




/* 3 - Listing report of laboratory employees unformatted */
ods listing;
proc print data = sorted noobs;
	title "Laboratory Employees";
	footnote;
	format job_title;
	by gender;
	id gender;
run;
ods listing close;




/* 4 - Frequency of laboratory employees by job title */
ods html body = "Fourth.htm";
proc freq data = employees;
	tables job_title;
	format job_title;
run;
ods html close;




/* 5 - Mean salary of laboratory employees by job title */
ods html body = "Fifth.htm";
proc means data = employees nmiss mean std;
	var salary;
	class job_title;
	format job_title;
run;
ods html close;




/* 6 - Univariate report laboratory employees by job title */
ods html body = "Sixth.htm";
proc univariate data = employees;
	var salary;
	where job_title contains "Laboratory";
run;
ods html close;




/* 7 - Bar chart of laboratory employees by job title and gender */
ods html body = "seventh.htm";
proc gchart data = sorted;
	vbar3d job_title / group=gender shape=c;
	where job_title contains "Laboratory";
run;
ods html close;
quit;
