/*************************************************************************************************
Module 3: Creating Libraries and Importing Data

Using Proc Contents to view the contents of a library

This code is posted for your benefit; however, I highly recommend that you practice typing your
own SAS programs as well. With the SAS programming language, as with all new languages, immersion 
seems to be the best way to learn.
*************************************************************************************************/

*Without nods option;
proc contents data=ntrhd._all_;
run;

*With nods option;
proc contents data=ntrhd._all_ nods;
run;
