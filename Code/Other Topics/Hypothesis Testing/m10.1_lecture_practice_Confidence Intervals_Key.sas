/*************************************************************************************************
Practice: Caclulating 95% Confidence Intervals

This code is posted for your benefit; however, I highly recommend that you practice typing your
own SAS programs as well. With the SAS programming language, as with all new languages, immersion 
seems to be the best way to learn.

*************************************************************************************************/

/*
Step 2.
Use the code provided to generate 10,000 random participants, along with their heights.
*/
data random10000 (drop = i x);
	do i=1 to 10000;
   		x = uniform(123456);
   			if x >.5 then male = 1;
   			else male = 0;
			if male = 1 then height = round(71 + 4.32*normal(0), .01);
			else if male = 0 then height = round(64.3 + 2.11*normal(0), .01);
   		output;
	end;
run;


/*
Step 3.
Calculate the mean height and 95% confidence interval for all 10,000 participants (population).
*/
proc means data = random10000 n mean std clm;
	var height;
run;


/*
Step 4.
Use the code provided to draw a random sample of 10 of these participants, and create a
new data set called random10.
*/
proc surveyselect data=random10000 
	method = srs 
	sampsize = 10
	out = random10;
run;


/*
Step 5. 
Calculate the mean height and 95% confidence interval for the 10 participants you just
selected at random.
*/
proc means data = random10 n mean std clm;
	var height;
run;


/*
Step 6.
Use the code provided to draw a random sample of 1,000 of these participants, and create a
new data set called random1000.
*/
proc surveyselect data=random10000 
	method = srs 
	sampsize = 1000
	out = random1000;
run;


/*
Step 7. 
Calculate the mean height and 95% confidence interval for the 1,000 participants you just
selected at random.
*/
proc means data = random1000 n mean std clm;
	var height;
run;


/*
What happens to the mean and 95% confidence limits as the size of your random sample increases?
The confidence limits contract, or become more narrow.
*/
