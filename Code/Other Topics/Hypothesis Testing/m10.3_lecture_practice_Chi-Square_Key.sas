/*************************************************************************************************
Practice: Test for a Difference Between Proportions

This code is posted for your benefit; however, I highly recommend that you practice typing your
own SAS programs as well. With the SAS programming language, as with all new languages, immersion 
seems to be the best way to learn.

*************************************************************************************************/

/*
Run the following data step to create the practice 1 data set, which contains information about 
participants sode preference (Coke or Pepsi) and pet preference (dogs or cats).
*/
data practice1;
	input soda $ animal $ weight;
datalines;
Coke Dog 78
Coke Cat 22
Pepsi Dog 36
Pepsi Cat 64
;
run;


/*
Use the FREQ procedure with the CHISQ option to test for a difference in the distribution of
favorite pets by favorite soda. You will need to add the following statement in your FREQ
procedure: "weight weight;" in order for it to work properly.
*/
proc freq data = practice1;
	tables soda*animal / chisq expected nocol;
	weight weight;
run;


/*
Based on this data, does pet preference significantly differ by soda preference?
Yes, this analysis suggests that there is a statistically significant association (p<0.0001)
between soda preference and pet preference.
*/



