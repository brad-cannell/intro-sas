* ============================================================================;
My First SAS Program
[Date]

This is my first SAS program. I have no idea what I'm doing.
* ============================================================================;

* First attempt at SAS code;
* ============================================================================;
data first_dataset; input x1 x2 x3; datalines;
	1 2 3
	1 2 3
	1 2 3
	;
run;


* Improve readability;
* ============================================================================;
data first_dataset;
	input x1 x2 x3;
	datalines;
	1 2 3
	1 2 3
	1 2 3
run;


* First dataset wasn't very interesting. Trying again.
* Creating a dataset that contains the height and weight of two male
* and two female study participants;
* ============================================================================;
data height_and_weight;
	input id $ sex $ ht_in wgt_lbs;
	datalines;
	001 Male 71 190
	002 Male 69 176
	003 Female 64 130
	004 Female 65 154
run;
