/*************************************************************************************************
Practice: Test for a Difference Between Two Means

This code is posted for your benefit; however, I highly recommend that you practice typing your
own SAS programs as well. With the SAS programming language, as with all new languages, immersion 
seems to be the best way to learn.

*************************************************************************************************/

/*
Step 2.
Use the code provided to generate a random population of 10,000 people, along with their heights.
*/
data random_pop1 (drop = i x);
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
Calculate the mean height for the entire population of males and the mean height for the entire
population of females.
*/
proc means data = random_pop1;
	class male;
	var height;
	title1 "Population Mean Height for Males and Females";
run;


/*
Step 4.
Use the code provided to draw a random sample of 50 people from the population, and create a
new data set called random_subpop1.
*/
proc surveyselect data=random_pop1 noprint
	seed = 2001
	method = srs 
	sampsize = 50
	out = random_subpop1;
run;


/*
Step 5. 
Use PROC TTEST on random_subpop1 to test for a difference in height between males and females.
*/
proc ttest data = random_subpop1;
	class male;
	var height;
	title1 "T-Test for Difference in Mean Height of Males and Females in Random Population 1";
run;


/*
Based on the results of your TTEST, do you conclude that the population height of males and 
females are different? Is this the same conclusion you reached when you compared the entire
population of males and females?

In the entire population males were taller (71"), on average, than females (64"). Based on
the results of our TTEST, using the Satterthwaite method, we conclude that males are taller,
on average, than females.
*/
