/*************************************************************************************************
Week 10: Check on Learning

	95% Confidence Intervals
	T-test
	Chi-square test 

NOTE: Results will vary slightly from those in the lecture video because the data changes 
      slightly with every new class.

This code is posted for your benefit; however, I highly recommend that you practice typing your
own SAS programs as well. With the SAS programming language, as with all new languages, immersion 
seems to be the best way to learn.

*************************************************************************************************/

/*In a study of the effects of early Alzheimer’s disease on nondeclarative memory, Reber et al. 
used the Category Fluency Test to establish baseline persistence and semantic memory and language 
abilities. The eight subjects in the sample had Category Fluency Test scores of 11, 10, 6, 3, 11, 
10, 9, and 11. Assume that the eight subjects constitute a simple random sample for a normally 
distributed population of similar subjects with early Alzheimer’s disease.*/
data Reber;
	input cft;
	datalines;
	11
	10
	6
	3
	11
	10
	9
	11
run;

*Which of the following programs created the report shown above?; 
proc means data = Reber mean std stderr clm;
	var cft;
run;


*Which of the following programs should you use to recreate the table above with 99% confidence intervals?;
proc means data = Reber alpha=.01 mean std stderr clm;
	var cft;
run;
