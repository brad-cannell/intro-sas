/*************************************************************************
Completing Lab 5
*************************************************************************/
libname lab5 "C:\Users\mbc0022\Desktop";

proc import out = lab5.survey1
	datafile = "C:\Users\mbc0022\Desktop\5313 Survey 5151.xls"
	dbms = xls replace;
run;

proc format;
	value yesno 1 = "Yes"
				0 = "No";
run;

data lab5.survey2;
	set lab5.survey1;
	format Q2 yesno.;
run;
