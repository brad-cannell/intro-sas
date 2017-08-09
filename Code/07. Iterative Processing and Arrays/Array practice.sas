data prob15_1;
	input (ht1-ht5) (2.) (wt1-wt5) (3.);
	dens1 = wt1 / ht1**2;
	dens2 = wt2 / ht2**2;
	dens3 = wt3 / ht3**2;
	dens4 = wt4 / ht4**2;
	dens5 = wt5 / ht5**2;
datalines;
6862727074150090208230240
64  68  70140   150   170
;

data answers;
	***Passing grades: 65, 70, 60, 75, and 66;
	input id $ score1-score5;
datalines;
001 50 70 62 78 85
002 90 86 87 91 94
003 63 72 58 73 68
;

data passed;
	array pass{5} _temporary_ (65 70 60 75 66);
	array score{5};
	input id $ score{*};
	pass_num = 0;
	do i = 1 to 5;
		if score{i} ge pass{i} then pass_num +1;
	end;
	drop i;
datalines;
001 50 70 62 78 85
002 90 86 87 91 94
003 63 72 58 73 68
;
proc print data = passed;
	id id;
	var pass_num score1-score5;
run;
