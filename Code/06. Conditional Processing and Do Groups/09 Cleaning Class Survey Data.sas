/*************************************************************************************************
Cleaning Class Survey Data

1. Download data as CSV file and codebook from Qualtrics
2. Store in a new folder for each semester

Created: 2014-10-28 by Brad Cannell

Last updated: 2015-09-11 by Brad Cannell

*************************************************************************************************/


* Create class library;
libname class "Z:\Dropbox\UNTHSC Admin and Teaching\Courses\5157 - Fall 2015\BACH_EPID 5313\Data\Day one survey\5157";


* Get the class survey data into SAS;
proc import out = class.survey1
	datafile = "Z:\Dropbox\UNTHSC Admin and Teaching\Courses\5157 - Fall 2015\BACH_EPID 5313\Data\Day one survey\5157\5313_Day_One_Survey__5157__Fall_2015.csv"
	dbms = csv replace;
	datarow = 3;
run;


* Create formats;
proc format;
	value	standard01_	0 = 'No'
						1 = 'Yes';

	value	reason		1 = 'Required for graduation'
						2 = 'Personal interest'
						3 = 'Improve employment opportunities'
						4 = 'To analyze data for my current research';

	value 	reason2_	1 = 'Personal interest'
						2 = 'Improve employment opportunities'
						3 = 'To analyze data for my current research';

	value	packages	1 = 'SAS'
						2 = 'SPSS'
						3 = 'Stata'
						4 = 'R'
						5 = 'Other';
	
	value	genhealth	1 = 'Excellent'
						2 = 'Very Good'
						3 = 'Good'
						4 = 'Fair'
						5 = 'Poor';

	value	seatbelt	1 = 'Always'
						2 = 'Nearly Always'
						3 = 'Sometimes'
						4 = 'Seldom'
						5 = 'Never';
				
	value	persdoc		0 = 'No'
						1 = 'Only one'
						2 = 'More than one';

	value	race		1 = 'White'
						2 = 'Black'
						3 = 'AI/AN'
						4 = 'Asian'
						5 = 'PI'
						6 = 'Other';

	value	marital		1 = 'Married'
						2 = 'Divorced'
						3 = 'Widowed'
						4 = 'Separated'
						5 = 'Never Married';

	value 	employ		1 = 'Empoyed for wages'
						2 = 'Self-employed'
						3 = 'Out of work >= 1'
						4 = 'Out of work < 1'
						5 = 'Homemaker'
						6 = 'Student'
						7 = 'Retired'
						8 = 'Unable to work';
				
	value	income		1 = '0-25'
						2 = '25001-50'
						3 = '50001-75'
						4 = '75001-100'
						5 = '100001-125'
						6 = '125001-150'
						7 = '150001-175'
						8 = '175001-200'
						9 = '200001+';
				
	value	month		1 = 'January'
						2 = 'February'
						3 = 'March'
						4 = 'April'
						5 = 'May'
						6 = 'June'
						7 = 'July'
						8 = 'August'
						9 = 'September'
						10 = 'October'
						11 = 'November'
						12 = 'December';
				
	value	gender		1 = 'Female'
						2 = 'Male';

	value 	color		1 = 'Black'
						2 = 'Blue'
						3 = 'Gray'
						4 = 'Green'
						5 = 'Orange'
						6 = 'Pink'
						7 = 'Purple'
						8 = 'Red'
						9 = 'White'
						10 = 'Yellow';

	value bmi			1 = 'Underweight'
						2 = 'Healthy weight'
						3 = 'Overweight'
						4 = 'Obese';

	value raceth		1 = 'White, non-Hispanic'
						2 = 'Black, non-Hispanic'
						3 = 'Hispanic, any race'
						4 = 'Other race, non-Hispanic';
run;


* Creating id for each participant;
data class.survey2;
	retain id;
	set class.survey1;
	id = _N_;
run;


* Drop unneeded variables;
data class.survey3;
	set class.survey2 (drop = v1--q1 q3_text q5_text locationlatitude--locationaccuracy var44);
run;
	* 28 variables remain;


* Rename and label variables to improve readability;
data class.survey4;
	set class.survey3;
	rename	Q2 = required
			Q3 = reason
			Q4 = stillenroll
			Q5 = reason2
			Q6 = packages
			Q7 = genhealth
			Q8 = menthlth
			Q9 = asthma
			Q10 = seatbelts
			Q11 = physact
			Q12 = sedentary
			Q13 = insurance
			Q14 = persdoc
			Q15 = hispanic
			Q16 = race
			Q17 = veteran
			Q18 = marital
			Q19_1 = children
			Q20 = employment
			Q21_1 = income
			Q22_1 = pounds
			Q23_1 = feet
			Q23_2 = inches
			Q24 = year
			Q25 = month
			Q26 = gender
			Q27 = color;
		
	label	Q2 = required
			Q3 = reason
			Q4 = stillenroll
			Q5 = reason2
			Q6 = packages
			Q7 = genhealth
			Q8 = menthlth
			Q9 = asthma
			Q10 = seatbelts
			Q11 = physact
			Q12 = sedentary
			Q13 = insurance
			Q14 = persdoc
			Q15 = hispanic
			Q16 = race
			Q17 = veteran
			Q18 = marital
			Q19_1 = children
			Q20 = employment
			Q21_1 = income
			Q22_1 = pounds
			Q23_1 = feet
			Q23_2 = inches
			Q24 = year
			Q25 = month
			Q26 = gender
			Q27 = color;
run;


* Clean up physact and sedentary;
data class.survey5;
	set class.survey4;
	physact2 = input(physact, 2.);
	sedentary2 = input(sedentary, 2.);
	if id = 11 then physact2 = 9;
	if id = 20 then physact2 = 7;
	if id = 32 then physact2 = 0;
	if id = 33 then physact2 = 7;
	if id = 50 then physact2 = 13.5;
	if id = 55 then physact2 = 3;
	if id = 59 then physact2 = 0;
	if id = 4 then sedentary2 = .;
	if id = 20 then sedentary2 = 14;
	if id = 25 then sedentary2 = 144;
	if id = 28 then sedentary2 = 105;
	if id = 32 then sedentary2 = 35;
	if id = 33 then sedentary2 = 13.5;
	if id = 46 then sedentary2 = 42;
	if id = 49 then sedentary2 = .;
run;

* Data checking;
proc print data = class.survey5;
	var physact physact2 sedentary sedentary2;
run;


* Recode missing values;
data class.survey6;
	set class.survey5;

	array missing {*} required stillenroll packages genhealth asthma seatbelts
	insurance persdoc race veteran marital employment gender color;
	do i = 1 to dim(missing);
		if missing{i} in(9, 88, 99) then missing{i} = .;
	end;
run;


* Recode the year, feet, and inches variables;
* Create bmi variable;
data class.survey7;
	set class.survey6;
	year = year + 1949;
	feet = feet - 1;
	inches = inches - 1;
	oht = (feet * 12) + inches;
	bmi = (pounds / (oht**2)) * 703;

	if bmi > . and bmi < 18.5 then bmi5cat = 1;
	else if bmi >= 18.5 and bmi < 25 then bmi5cat = 2;
	else if bmi >= 25 and bmi < 30 then bmi5cat = 3;
	else if bmi >= 30 then bmi5cat = 4;

	format bmi 4.1;
run;

* Data checking;
proc print data = class.survey7;
	var feet inches pounds bmi bmi5cat;
	format bmi5cat bmi.;
run;


* Recode race and ethnicity;
data class.survey8;
	set class.survey7;
	if hispanic =1 then raceth = 3;
	else if race = 1 then raceth = 1;
	else if race = 2 then raceth = 2;
	else if race in (3, 4, 5, 6) then raceth = 4;
run;

* Data checking;
proc print data = class.survey8;
	var hispanic race raceth;
	format raceth raceth.;
run;
		
