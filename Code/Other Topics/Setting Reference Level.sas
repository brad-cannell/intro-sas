/*
Setting reference level for character variable
*/

data test;
input y x1 $ x2;
datalines;
1 usually 1
0 always 2
1 never 1
0 usually 3
1 usually 1
0 sometimes 0
1 usually 1
0 always 1
1 never 1
0 usually 3
1 never 0
0 sometimes 1
;
run;

proc surveylogistic data = test;
	class x1 (ref = 'never' param = ref) x2;
	model y = x1 x2;
run;
