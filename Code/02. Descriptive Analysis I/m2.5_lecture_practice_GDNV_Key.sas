/*************************************************************************************************
Module 2: Descriptive Analysis I

Practice: Graphically Describing Numerical Variables

This code is posted for your benefit; however, I highly recommend that you practice typing your
own SAS programs as well. With the SAS programming language, as with all new languages, immersion 
seems to be the best way to learn.

*************************************************************************************************/

/*
Step 1. Highlight and sumbmit the data step below.
*/
data heights;
	input id uniform actual tails middle lskew rskew;
	datalines;
01 71 75 62 62 65 67
02 71 72 62 63 65 68
03 71 72 62 65 65 70
04 71 72 62 66 64 68
05 71 72 62 67 62 67
06 71 74 62 69 69 69
07 71 69 62 69 65 68
08 71 69 62 69 68 70
09 71 75 62 69 68 69
10 71 75 62 70 70 70
11 71 69 62 70 66 68
12 71 72 62 70 70 67
13 71 72 62 70 67 69
14 71 75 62 70 68 68
15 71 67 62 70 65 67
16 71 67 62 71 72 70
17 71 73 62 71 70 70
18 71 69 62 71 72 70
19 71 67 62 71 72 71
20 71 67 62 71 72 70
21 71 75 64 71 71 72
22 71 72 64 71 71 71
23 71 72 64 71 72 72
24 71 75 66 71 70 71
25 71 70 66 71 71 72
26 71 70 76 71 70 70
27 71 72 76 71 71 72
28 71 73 78 71 72 70
29 71 68 78 71 72 71
30 71 71 78 71 70 72
31 71 67 80 71 71 72
32 71 70 80 71 71 71
33 71 69 80 71 71 71
34 71 64 80 71 71 71
35 71 66 80 71 72 71
36 71 66 80 72 74 75
37 71 65 80 72 71 73
38 71 64 80 72 72 76
39 71 63 80 72 73 72
40 71 66 80 72 73 77
41 71 78 80 72 74 75
42 71 76 80 73 74 75
43 71 78 80 73 74 77
44 71 76 80 73 72 72
45 71 78 80 73 74 74
46 71 77 80 74 74 79
47 71 77 80 74 72 78
48 71 71 80 75 74 79
49 71 80 80 76 71 78
50 71 62 80 79 73 80
run;


/*
Step 2:
Create a summary report with plots for the variable lskew using PROC UNIVARIATE
*/
proc univariate data = heights plot;
	var lskew;
run;

/*
No, the variable lskew does not look normally distributed.
The lower tail in the histogram is elongated.
In the boxplot the median is towards the top of the box (above the mean), the lower whisker is longer than 
the upper whisker, and there are more outliers in the lower range.
The Q-Q plot has a slight downward curve.
The quantitative measure of skewness is -0.9721884.
These observations provide evidence of a non-normal, left skewed distribution.
*/














