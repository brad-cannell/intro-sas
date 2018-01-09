*Ranges;
data range;
	input age;
	datalines;
	20
	21
	40
	37
	28
	22
	32
	31
	35
	40
	22
	29
	31
	34
	20
	25
	27
	32
	32
	22
run;

*format for each half;
proc format;
	value	age	low-24 = 'Less than 25'
			25-29 = '25 to 29'
			30-high = '30 or older';
run;

*Viewing range;
proc print data=range;
	format age age.;
run;


*Ranges2;
data range2;
	input age;
	datalines;
	20.5
	21.6
	40.3
	37.9
	28.8
	22.2
	32.3
	31.4
	35.8
	40.5
	22.4
	29.7
	31.1
	34.1
	20.6
	25.3
	27.4
	32.9
	32.9
	22.5
run;

*Viewing range2;
proc print data=range2;
	format age age.;
run;

*More comprehesive range;
proc format;
	value	age2_	low-<25 = 'Less than 25'
					25-<30 = '25 to less than 30'
					30-high = '30 or older';
run;

*Viewing range2 again;
proc print data=range2;
	format age age2_.;
run;



































