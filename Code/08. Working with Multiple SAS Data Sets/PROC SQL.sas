/******************************************************************************
Module 7: Working with Multiple SAS Data Sets

Using Combining and Reshapting Data Using PROC SQL - Actually, I need to break this up into different programs...

This code is posted for your benefit; however, I highly recommend that you 
practice typing your own SAS programs as well. With the SAS programming 
language, as with all new languages, immersion seems to be the best way to 
learn.
******************************************************************************/

/*
Previously in this module you learned how to...
*/

* Combine vertically (appending, concatenating, interleaving);

*Creating data sets for demonstration;
data advisees;
	input first $ gender $ matric;
	datalines;
	Angela F 2010
	Dawn F 2011
	Aaron M 2011
run;

data advisees_2012;
	input first $ gender $ matric;
	datalines;
	Sruthi F 2012
	Lindsey F 2012
	Natalie F 2012
run;

* Appending/Concatenating SAS data sets with identical variables;
proc sql;
	create table advisees_new as     /* Create the new SAS data set */
		select * from advisees       /* First table to concatenate */
		union                        /* Union clause concatenates */
		select * from advisees_2012; /* Second table to concatenate */

	title1 "View New Advisees";

	select * from advisees_new;      /* Display the new data set */
quit;

* Creating advisees_2013;
data advisees_2013;
	input first $ matric;
	datalines;
	Sara 2013
	Dennis 2013
run;

* Appending to a BASE= data set with an additional variable;

* Creating advisees_2014;
data advisees_2014;
	input first $ matric program $;
	datalines;
	Nathan 2014 MPH
	Gloria 2014 PhD
run;

* Appending a data = data set with an additional variable;



* =========================================================================== ;
* Combine horizontally (one-to-one merge, one-to-many merge);

* =========================================================================== ;
* Restructure long to wide;

* =========================================================================== ;
* Restructure wide to long;
