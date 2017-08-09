/*************************************************************************************************
Changing the default behavior of the results viewer window in SAS 9.3

In SAS® 9.3, the ODS HTML destination is turned on by default when using the SAS windowing 
environment. This is part of several changes at start-up discussed in SAS Note 42874.
As part of this change, the HTML file created by ODS has the NEWFILE=NONE option set by default. 
Therefore, all procedure and DATA step output is sent to a single HTML file. When clearing the 
Results window manually by clicking on a node in the Results window and selecting Delete, or by 
issuing the ODSRESULTS;CLEAR command, nodes are deleted from the Results window. However, the HTML 
file remains open and the output from subsequent procedure or DATA steps is appended to any 
previously created HTML output.

*************************************************************************************************/

ods html close;
ods preferences;
ods html newfile = proc;
