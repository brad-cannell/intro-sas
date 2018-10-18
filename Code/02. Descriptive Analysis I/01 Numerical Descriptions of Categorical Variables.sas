* ============================================================================;
* Descriptive Analysis I

* Numerical Descriptions of Categorical Variables

* This code is posted for your benefit; however, I highly recommend that you
* practice typing your own SAS programs as well. With the SAS programming
* language, as with all new languages, immersion seems to be the best way to
* learn.
* ============================================================================;

data height_and_weight;
	input id $ sex $ ht_in wgt_lbs;
	datalines;
	001 Male 71 190
	002 Male 69 176
	003 Female 64 130
	004 Female 65 154
;
run;

* First procedure: PROC Print;
* Generates list report of height_and_weight data set;
* ============================================================================;
proc print data = height_and_weight;
run;

* Optional SQL alternative;
proc sql;
	select *
	from height_and_weight;
quit;


* List report of id and height from height_and_weight data set;
* ============================================================================;
proc print data = height_and_weight noobs;
	var id ht_in;
run;

* Optional SQL query that returnns id and height from height_and_weight data
* set;
proc sql;
	SELECT id, ht_in
	FROM height_and_weight;
quit;




* Numerical description of categorical variables using PROC FREQ.;
* ============================================================================;
data height_and_weight_20;
	input id $ sex $ ht_in wgt_lbs;
	datalines;
	001 Male 71 190
	002 Male 69 176
	003 Female 64 130
	004 Female 65 154
	005 . 73 173
	006 Male 69 182
	007 Female 68 140
	008 . 73 185
	009 Female 71 157
	010 Male 66 155
	011 Male 71 213
	012 Female 69 151
	013 Female 66 147
	014 Female 68 196
	015 Male 75 212
	016 Female 69 190
	017 Female 66 194
	018 Female 65 176
	019 Female 65 176
	020 Female 65 102
run;

* Most basic possible frequency procedure;
proc freq data = height_and_weight_20;
run;


* Creating a frequency report for selected variables only;
proc freq data = height_and_weight_20;
	table sex;
run;


* Numerical description of categorical data using PROC FREQ with the MISSING
* option;
proc freq data = height_and_weight_20;
	table sex / missing;
run;
