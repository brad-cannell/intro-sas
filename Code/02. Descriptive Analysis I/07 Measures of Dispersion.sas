* ============================================================================;
* Descriptive Analysis I

* Numerical Descriptions of Numerical Variables

* This code is posted for your benefit; however, I highly recommend that you
* practice typing your own SAS programs as well. With the SAS programming
* language, as with all new languages, immersion seems to be the best way to
* learn.
* ============================================================================;


Demonstrating change in variance;
* ============================================================================;
data example;
	input @1 allsame 2. @4 half6181 2. @7 even6181 2. @10 half5191 2. @13
	      even5191 2.;
	datalines;
71 61 61 51 51
71 61 62 51 52
71 61 63 51 53
71 61 64 51 54
71 61 65 51 55
71 61 66 51 56
71 61 67 51 57
71 61 68 51 58
71 61 69 51 59
71 61 70 51 60
71 61 71 51 61
71 81 72 51 62
71 81 73 51 63
71 81 74 51 64
71 81 75 51 65
71 81 76 51 66
71 81 77 51 67
71 81 78 51 68
71 81 79 51 69
71 81 80 51 70
71 81 81 91 71
.  .  .  91 72
.  .  .  91 73
.  .  .  91 74
.  .  .  91 75
.  .  .  91 76
.  .  .  91 77
.  .  .  91 78
.  .  .  91 79
.  .  .  91 80
.  .  .  91 81
.  .  .  91 82
.  .  .  91 83
.  .  .  91 84
.  .  .  91 85
.  .  .  91 86
.  .  .  91 87
.  .  .  91 88
.  .  .  91 89
.  .  .  91 90
.  .  .  91 91
run;

proc means data=example n mean var std min max maxdec=2;
run;
