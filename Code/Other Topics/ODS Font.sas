/*
Needed to make font larger so that it shows up better in my videos.
Changing the ODS output font using PROC TEMPLATE.
http://support.sas.com/rnd/base/ods/templateFAQ/Template_fonts.html
*/

proc template;
	define style Styles.Custom;
	parent = Styles.Default;
	style fonts from fonts /
		'TitleFont'=("Arial,Helvetica,Helv",4pt,Bold Italic)
		'TitleFont2'=("Arial,Helvetica,Helv",5pt,Bold Italic)
		'StrongFont'=("Arial, Helvetica, Helv",4pt,Bold)
		'EmphasisFont'=("Arial,Helvetica,Helv",3pt,Italic)
		'headingFont'=("Arial, Helvetica, Helv",4pt,Bold)
		'docFont'=("Arial, Helvetica, Helv",8pt)
		'footFont'=("Arial, Helvetica, Helv",4pt)
		font_size=8pt;
	end;
run;
