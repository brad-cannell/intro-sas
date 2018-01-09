/*************************************************************************************************
Module 4: Enhancing the Readability of SAS Data Sets

Practice: Working with Dates in SAS

This code is posted for your benefit; however, I highly recommend that you practice typing your
own SAS programs as well. With the SAS programming language, as with all new languages, immersion 
seems to be the best way to learn.

*************************************************************************************************/

/*
Step 1. Highlight and sumbmit the data step below.
*/
data function_study;
	input id $ sex $ disability $ ht_in wgt_lbs date1 date2;
	datalines;
	001 Male No 71 190 18263 19365
	002 Female No 60 112 18347 19733
	003 Female Yes 64 130 18322 19356
	004 Female No 65 154 18307 18894
	005 Male No 73 173 18927 20300
	006 Male No 69 182 18275 18647
	007 Female No 68 140 18555 19248
	008 Male No 73 185 18265 18649
	009 Male Yes 71 199 18274 19443
	010 Male Yes 66 155 18344 19494
	011 Male No 71 213 18329 19653
	012 Female No 69 151 18444 18719
	013 Female Yes 66 147 18323 19532
	014 Female No 68 196 18268 18551
	015 Male . 75 212 18318 18939
	016 Female No 69 190 18543 18796
	017 Female No 66 194 18294 19074
	018 Male . 71 194 18367 19347
	019 Female No 65 176 18334 19593
	020 Female No 65 102 18779 19659
run;


/*
Step 2. Label the variables date1 and date2, apply formats to the date values, and
create a new calculated variable that contains each participants total exact 
length of follow-up in years.
*/
data function_study2;
	set function_study;
	label	date1 = 'Enrollment Date'
			date2 = 'Final Follow-up';
	format date1 date2 yymmdd10.;
	lof = yrdif(date1, date2, 'Actual');
run;


/*
Step 3. Calculate the average overall length of follow-up for the 20 participants in this study.
*/
title 'Average Length of Follow-up in Physical Function Study';
proc means data = function_study3;
	var lof;
run;


/*
Average length of follow-up is 2.3 years.
*/






