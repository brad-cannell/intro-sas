/*************************************************************************************************
Module 3: Creating Libraries and Importing Data

Using proc Contents to view the descriptive portion of a SAS data set.

This code is posted for your benefit; however, I highly recommend that you practice typing your
own SAS programs as well. With the SAS programming language, as with all new languages, immersion 
seems to be the best way to learn.
*************************************************************************************************/

*Without varnum option;
proc contents data=ntrhd.height_and_weight;
run;

*With varnum option;
proc contents data=ntrhd.height_and_weight varnum;
run;
