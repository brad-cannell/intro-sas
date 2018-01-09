/*************************************************************************************************
Demonstration: Using Arrays to Code More Efficiently

This code is posted for your benefit; however, I highly recommend that you practice typing your
own SAS programs as well. With the SAS programming language, as with all new languages, immersion 
seems to be the best way to learn.

*************************************************************************************************/

options fmtsearch = (class);

*Remember this section of code from homework 4?;
data class.hw43;
	set class.hw42;
	if race = -99 then race = .;
	if veteran = -99 then veteran = .; 
	if weight = -99 then weight = .;
	if feet = -99 then feet = .;
	if inches = -99 then inches = .;
run;


*We can easily code this more efficiently using an array;
data class.hw43;
	set class.hw42;
	array missvars {5} race veteran weight feet inches;
	do i = 1 to 5;
		if missvars{i} = -99 then missvars{i} = .;
	end;
run;

proc print data = class.hw43 noobs;
	var id race veteran weight feet inches;
run;




*Demonstrating how SAS "thinks" about an array;
data class.hw43;
	set class.hw42;
	array missvars {5} race veteran weight feet inches;
	if missvars{1} = -99 then missvars{1} = .;
	if missvars{2} = -99 then missvars{2} = .;
	if missvars{3} = -99 then missvars{3} = .;
	if missvars{4} = -99 then missvars{4} = .;
	if missvars{5} = -99 then missvars{5} = .;
run;

proc print data = class.hw43 noobs;
	var id race veteran weight feet inches;
run;




*Another way to specify deminsions;
data arrays1;
	input last $ first $ gender $ program;
	datalines;
	smith angela female 1
	"" steven male 1
	rodriguez stephanie female .
	martin "" female 3
	johnson lee male 2
	;
run;

