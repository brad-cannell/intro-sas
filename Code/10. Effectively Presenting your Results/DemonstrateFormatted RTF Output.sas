* ============================================================================;
* Effectively Presenting Your Results

* Demonstration: Creating a Table 1 in Microsoft Word
* Sending preformatted results to an RTF file.

* This code is posted for your benefit. However, I highly recommend that you 
* practice typing your own SAS programs as well. With the SAS programming 
* language, as with all new languages, immersion seems to be the best way to 
* learn.
* ============================================================================;

proc format;
	value	edu	1 = "Less than high school"
				2 = "High school"
				3 = "Some college"
				4 = "Collge graduate";

	value	use	0 = "Non-users"
				1 = "Use other drugs"
				2 = "Use opioid drugs";

	value	sex 1 = "Female"
	            0 = "Male";
run;

* Import data;
* ============================================================================;
data drugs;
	infile "C:\Users\mbc0022\Desktop\drugs.csv" dsd firstobs = 2;
	input age edu female use;
	label age = "Age";
	label edu = "Education";
	label female = "Female";
	label use = "Drug use status";
run;


* Step 1.
* Find mean age and frequencies for education and gender;
* This time add an ods output statement as well;
* ============================================================================;
proc means data = drugs mean clm maxdec = 1;
	var age;
	class use;
	format use use.;
	ods output Summary = drug_means;   /* <- This saves the results as a */
run;								   /* SAS dataset named "drug_means" */
									   /* in the work library            */

proc surveyfreq data = drugs;
	tables use * (edu female) / row cl;
	format edu edu. use use. female sex.;
	ods output CrossTabs = drug_freqs; /* <- This saves the results as a */
run;								   /* SAS dataset named "drug_freqs" */
									   /* in the work library            */


* Alter the datasets we just created to contain only the information we want in
* the format that we want. In this case, we want the "mean (95% CI)" for 
* continuous variables, and the "Percent (95% CI)" for categorical variables.;
* ============================================================================;
proc print data = drug_means;
run;

data drug_means;            /* First, format the means data */
	set drug_means;
	mean_ci = cat(          /* cat function concatenates arguments into a string */
		put(age_Mean, 4.1), /* put function to convert numeric to character */
		" (",               /* This just adds a "(" to the string */
		put(age_LCLM, 4.1), /* The "4.1" after the comma is a format */
		" - ",              /* This just adds a "-" between our CI's */
		put(age_UCLM, 4.1),
		")");
	keep use mean_ci;       /* Just keep the categories and the new mean_ci */
run;

* Send report to RTF destination for easy copy and paste;
ods rtf file = 'C:\Users\mbc0022\Desktop\Means for Table 1.rtf';
proc print data = drug_means;
run;
ods rtf close;

proc print data = drug_freqs;
run;

data drug_freqs2;
	format use f_edu f_female category frequency percent_ci; /* Reorder variables */
	set drug_freqs;
	percent_ci = cat(
		put(RowPercent, 4.1),
		" (",
		put(RowLowerCL, 4.1),
		" - ",
		put(RowUpperCL, 4.1),
		")");
	if use = . then delete;          /* This line and the line below just */
	if RowPercent = 100 then delete; /* clean out some rows we don't need */

	array covars f_edu--f_female;    /* Create array of formatted covariates */
	length category $21;             /* Set length of new category variable */
	do over covars;                  /* Loop over cavariates - put in 1 var*/
		if missing(category) then category = covars;
	end;

	keep use category frequency percent_ci;
run;

* Send report to RTF destination for easy copy and paste;
ods rtf file = 'C:\Users\mbc0022\Desktop\Percents for Table 1.rtf';
proc print data = drug_freqs2;
run;
ods rtf close;
