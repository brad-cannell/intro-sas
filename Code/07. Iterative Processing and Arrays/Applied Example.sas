/******************************************************************************
Applied Example 1:
Choosing between two smoking cessation programs
******************************************************************************/
data quit_smoke;
	year = _N_;
	policy_population = 120000;
	personal_population = 2000;
	policy_rate = .05;
	personal_rate = .45;
	policy_quit = (policy_population * policy_rate);
run;

proc print data = quit_smoke;
	id year;
run;


data invest;
	do year = 2008 to 2010;
		capital+5000;
		capital+(capital*.045);
	end;
run;

proc print data = invest;
run;

/******************************************************************************
Applied Example 2:
Recoding disability status in the HABLE study
******************************************************************************/
libname hable 'Z:\Dropbox\Research\HABLE\Disability\Data'; * For Brad;

options fmtsearch = (hable);

data example2;
	set hable.hable (keep = Research_ID_Visit disability_1-disability_6);

	* Create disability only variables;
	if disability_1 = 1 and sum(of disability_1-disability_6) = 1 then onlydis1 = 1;
	else if missing(disability_1) then onlydis1 = .;
	else onlydis1 = 0;
	if disability_2 = 1 and sum(of disability_1-disability_6) = 1 then onlydis2 = 1;
	else if missing(disability_2) then onlydis1 = .;
	else onlydis2 = 0;
	if disability_3 = 1 and sum(of disability_1-disability_6) = 1 then onlydis3 = 1;
	else if missing(disability_3) then onlydis1 = .;
	else onlydis3 = 0;
	if disability_4 = 1 and sum(of disability_1-disability_6) = 1 then onlydis4 = 1;
	else if missing(disability_4) then onlydis1 = .;
	else onlydis4 = 0;
	if disability_5 = 1 and sum(of disability_1-disability_6) = 1 then onlydis5 = 1;
	else if missing(disability_5) then onlydis1 = .;
	else onlydis5 = 0;
	if disability_6 = 1 and sum(of disability_1-disability_6) = 1 then onlydis6 = 1;
	else if missing(disability_6) then onlydis1 = .;
	else onlydis6 = 0;
	if sum(of disability_1-disability_6) > 1 then multdis = 1;
	else if sum(of disability_1-disability_6) = 1 & nmiss(of disability_1-disability_6) >= 1 then multdis = .;
	else multdis = 0;

	* Creating the final disability variable;	
	if disability_1 = 1 or disability_2 = 1 or disability_3 = 1 or disability_4 = 1
	or disability_5 = 1 or disability_6 = 1 then disability = 1;							/* Disability */
	else if disability_1 = . or disability_2 = . or disability_3 = . or disability_4 = .
	or disability_5 = . or disability_6 = . then disability = .; 							/* Missing / Unknown */
	else disability = 0;
run;

proc print data = example2;
run;

proc freq data = example2;
	tables disability_1--disability;
run;


* Better way;
data example2 (drop = i);
	set hable.hable (keep = Research_ID_Visit disability_1-disability_6);

	* Create disability only variables;
	array old {6} disability_1-disability_6;
	array new {6} onlydis1-onlydis6;
	do i = 1 to 6;
		if old{i} = 1 and sum(of disability_1-disability_6) = 1 then new{i} = 1;
		else if missing(old{i}) then new{i} = .;
		else new{i} = 0;
	end;
	if sum(of disability_1-disability_6) > 1 then multdis = 1;
	else if sum(of disability_1-disability_6) = 1 & nmiss(of disability_1-disability_6) >= 1 then multdis = .;
	else multdis = 0;

	* Creating the final disability variable;	
	if disability_1 = 1 or disability_2 = 1 or disability_3 = 1 or disability_4 = 1
	or disability_5 = 1 or disability_6 = 1 then disability = 1;							/* Disability */
	else if disability_1 = . or disability_2 = . or disability_3 = . or disability_4 = .
	or disability_5 = . or disability_6 = . then disability = .; 							/* Missing / Unknown */
	else disability = 0;
run;

proc print data = example2;
run;

proc freq data = example2;
	tables disability_1--disability;
run;
