/******************************************************************************
Lab Assignment 
Module 7: Working with Multiple SAS Data Sets

Using NHANES Data

This code is posted for your benefit; however, I highly recommend that you 
practice typing your own SAS programs as well. With the SAS programming 
language, as with all new languages, immersion seems to be the best way to 
learn.
******************************************************************************/

/*
Task 1. 
Go to the NHANES website. Download the following SAS Transport Files (.xpt) 
for the year 2011-2012: 
	a. Demographics
	b. Examination
		i. Blood Pressure
		ii. Body Measures
	c. Laboratory
		i. Serum Cotinine and Urinary Total NNAL
	d. Questionnaire
		i. Alcohol Use
		ii. Medical Conditions
		iii. Drug Use (Ages 18+)
		iv. All three smoking files.

*/

/*
Task 2.
Convert these 10 SAS Transport Files into temporary SAS data sets.
*/

/*
Do this by opening the folder containing the .xpt files we just downloaded. 
When you double click on those .xpt files, it should create new data sets in 
the work library.
*/


/*
Task 3.
Create a contents report of your work library. Familiarize yourself with the 
variables in each data set.
*/
proc contents data = work._all_;
run;


/*
Task 5. 
Create a new SAS library called NHANES. Merge the 10 data sets above into a 
new data set called NHANES and store it in the library called NHANES. Create a 
contents report to look at the variables in the merged data set with the 
variables in order. 
*/
libname nhanes "C:\Users\mbc0022\Desktop\";

data nhanes.nhanes1;
	merge alq_g Bmx_g Bpx_g Cotnal_g Demo_g Duq_g Mcq_g Smqfam_g Smqrtu_g Smq_g;
	by SEQN;
run;

proc contents data = nhanes.nhanes1 varnum;
run;


/*
Task 6. 
On the NHANES website, save the text file containing the NHANES I Epidemiologic 
Followup Study data set n87int.txt. Copy the SAS input statement from the NHANES 
website and paste it into your SAS program. Create a new SAS data set called 
nhanes.nhefs1987 from n87int.txt. Make sure to drop every variable that starts 
with the word “blank” using the DROP = data set option. 
*/
data nhanes.nhefs1987 (drop = blank:);
infile "Z:\Dropbox\UNTHSC Admin and Teaching\Courses\5147-Fall 2014\BACH_EPID 5313\Data\NHANES\n87int.txt";
INPUT 	@1    SEQNO    $CHAR5.
        @6    BLANK1   $CHAR2.
        @8    PREVINT  $CHAR2.
        @10   SUBSEX   $CHAR2.
        @12   TRACSTAT $CHAR2.
        @14   GRRSLTMO $CHAR6.
        @14   RSLTMO   $CHAR2.
        @16   RSLTDAY  $CHAR2.
        @18   RSLTYR   $CHAR2.
        @20   AGENOW   $CHAR2.
        @22   BASERSLT $CHAR2.
        @24   DCRECD   $CHAR2.
        @26   GRDEATHM $CHAR6.
        @26   DEATHMO  $CHAR2.
        @28   DEATHDAY $CHAR2.
        @30   DEATHYR  $CHAR2.
        @32   BLANK2   $CHAR44.
        @76   ARTHECF  $CHAR2.
        @78   GOUTECF  $CHAR2.
        @80   HEARTATT $CHAR2.
        @82   HEARTOTH $CHAR2.
        @84   BYPASECF $CHAR2.
        @86   PACEECF  $CHAR2.
        @88   STROKE   $CHAR2.
        @90   DIABETES $CHAR2.
        @92   BLOODPRE $CHAR2.
        @94   BPMEDECF $CHAR2.
        @96   BROKENHI $CHAR2.
        @98   CANCER   $CHAR2.
        @100  BRCANCER $CHAR2.
        @102  KIDNEYIF $CHAR2.
        @104  CATARECF $CHAR2.
        @106  LIVARECF $CHAR2.
        @108  WORKIF   $CHAR2.
        @110  RETIREIF $CHAR2.
        @112  MOMALIF  $CHAR2.
        @114  DADALIF  $CHAR2.
        @116  SMOKSTAT $CHAR2.
        @118  LIVBRTH1 $CHAR2.
        @120  PREGIF   $CHAR2.
        @122  UTERUSIF $CHAR2.
        @124  OVARYIF  $CHAR2.
        @126  PERIODIF $CHAR2.
        @128  HORMONES $CHAR2.
        @130  BCPILLIF $CHAR2.
        @132  BCPILL25 $CHAR2.
        @134  GRIDATEM $CHAR6.
        @134  IDATEMM  $CHAR2.
        @136  IDATEDAY $CHAR2.
        @138  IDATEYR  $CHAR2.
        @140  GRCFMONT $CHAR6.
        @140  CFMONTH  $CHAR2.
        @142  CFDAY    $CHAR2.
        @144  CFYEAR   $CHAR2.
        @146  GREXAMMO $CHAR6.
        @146  EXAMMO   $CHAR2.
        @148  EXAMDAY  $CHAR2.
        @150  EXAMYR   $CHAR2.
        @152  GRBIRTHM $CHAR6.
        @152  BIRTHMO  $CHAR2.
        @154  BLANK3   $CHAR2.
        @156  BDATE2   $CHAR2.
        @158  AGEEXAM  $CHAR2.
        @160  AGEIF    $CHAR2.
        @162  AGECF    $CHAR2.
        @164  AGECONT  $CHAR2.
        @166  ELIGECF  $CHAR2.
        @168  GRCONTMO $CHAR6.
        @168  CONTMO   $CHAR2.
        @170  CONTDAY  $CHAR2.
        @172  CONTYR   $CHAR2.
        @174  EFVIT    $CHAR2.
        @176  QDISIF   $CHAR2.
        @178  IFVIT    $CHAR2.
        @180  QDISECF  $CHAR2.
        @182  QVERSION $CHAR2.
        @184  REVRACE  $CHAR2.
        @186  PRELA    $CHAR2.
        @188  BLANK4   $CHAR5.
        @193  RELATOS  $CHAR2.
        @195  BLANK5   $CHAR90.
        @285  LIVEARRG $CHAR2.
        @287  BLANK6   $CHAR50.
        @337  SDIENRHM $CHAR2.
        @339  PRXLIVWD $CHAR2.
        @341  PRXVISTD $CHAR2.
        @343  NHCONTU  $CHAR2.
        @345  SAMENH   $CHAR2.
        @347  NUMSLIVE $CHAR2.
        @349  GRLGTHAL $CHAR4.
        @349  LGTHALNE $CHAR2.
        @351  LGTHUNIT $CHAR2.
        @353  GRRELATO $CHAR26.
        @353  RELTOS1  $CHAR2.
        @355  RELTOS2  $CHAR2.
        @357  RELTOS3  $CHAR2.
        @359  RELTOS4  $CHAR2.
        @361  RELTOS5  $CHAR2.
        @363  RELTOS6  $CHAR2.
        @365  RELTOS7  $CHAR2.
        @367  RELTOS8  $CHAR2.
        @369  RELTOS9  $CHAR2.
        @371  RELTOS10 $CHAR2.
        @373  RELTOS11 $CHAR2.
        @375  RELTOS12 $CHAR2.
        @377  RELTOS13 $CHAR2.
        @379  GRRELSEX $CHAR26.
        @379  RELSEX1  $CHAR2.
        @381  RELSEX2  $CHAR2.
        @383  RELSEX3  $CHAR2.
        @385  RELSEX4  $CHAR2.
        @387  RELSEX5  $CHAR2.
        @389  RELSEX6  $CHAR2.
        @391  RELSEX7  $CHAR2.
        @393  RELSEX8  $CHAR2.
        @395  RELSEX9  $CHAR2.
        @397  RELSEX10 $CHAR2.
        @399  RELSEX11 $CHAR2.
        @401  RELSEX12 $CHAR2.
        @403  RELSEX13 $CHAR2.
        @405  NUMSLVED $CHAR2.
        @407  GRLGTHA2 $CHAR4.
        @407  LGTHALN2 $CHAR2.
        @409  LGTHUNT2 $CHAR2.
        @411  GRRELDOS $CHAR24.
        @411  RELDOS1  $CHAR2.
        @413  RELDOS2  $CHAR2.
        @415  RELDOS3  $CHAR2.
        @417  RELDOS4  $CHAR2.
        @419  RELDOS5  $CHAR2.
        @421  RELDOS6  $CHAR2.
        @423  RELDOS7  $CHAR2.
        @425  RELDOS8  $CHAR2.
        @427  RELDOS9  $CHAR2.
        @429  RELDOS10 $CHAR2.
        @431  RELDOS11 $CHAR2.
        @433  RELDOS12 $CHAR2.
        @435  GRRELDSX $CHAR24.
        @435  RELDSX1  $CHAR2.
        @437  RELDSX2  $CHAR2.
        @439  RELDSX3  $CHAR2.
        @441  RELDSX4  $CHAR2.
        @443  RELDSX5  $CHAR2.
        @445  RELDSX6  $CHAR2.
        @447  RELDSX7  $CHAR2.
        @449  RELDSX8  $CHAR2.
        @451  RELDSX9  $CHAR2.
        @453  RELDSX10 $CHAR2.
        @455  RELDSX11 $CHAR2.
        @457  RELDSX12 $CHAR2.
        @459  MARRSTAT $CHAR2.
        @461  SUBJRACE $CHAR2.
        @463  BLANK7   $CHAR30.
        @493  HISPANIC $CHAR2.
        @495  DOINGMST $CHAR2.
        @497  BLANK8   $CHAR30.
        @527  HRSWKJB1 $CHAR2.
        @529  WORKJOB  $CHAR2.
        @531  HRSWKJB2 $CHAR2.
        @533  STPJBHEA $CHAR2.
        @535  MOMALIVE $CHAR2.
        @537  MOMAGED  $CHAR3.
        @540  DADALIVE $CHAR2.
        @542  DADAGED  $CHAR3.
        @545  GENERAL  $CHAR2.
        @547  PRXMHQD  $CHAR2.
        @549  JOINTS   $CHAR2.
        @551  DREVRTEL $CHAR2.
        @553  FRSTARTH $CHAR2.
        @555  ARTHFLG1 $CHAR2.
        @557  DRARTHR  $CHAR2.
        @559  OSTEOART $CHAR2.
        @561  RHEUMATD $CHAR2.
        @563  OTHRTYPE $CHAR2.
        @565  BLANK9   $CHAR30.
        @595  XRYJOINT $CHAR2.
        @597  FRSTXRAY $CHAR2.
        @599  LASTXRAY $CHAR2.
        @601  GOUT     $CHAR2.
        @603  SINCGOUT $CHAR2.
        @605  FRSTGOUT $CHAR2.
        @607  GOUTFLG1 $CHAR2.
        @609  MEMGOUT1 $CHAR2.
        @611  LASTGOUT $CHAR2.
        @613  MEMGOUT2 $CHAR2.
        @615  ARTHGOUT $CHAR2.
        @617  B17_HOSP $CHAR2.
        @619  HEARTATK $CHAR2.
        @621  EVERATT  $CHAR2.
        @623  FIRSTATT $CHAR2.
        @625  ATTFLAG  $CHAR2.
        @627  SINCEART $CHAR2.
        @629  ATTKYR1  $CHAR2.
        @631  ATTKYR2  $CHAR2.
        @633  ATTKYR3  $CHAR2.
        @635  ATTKYR4  $CHAR2.
        @637  ATTFL2_1 $CHAR2.
        @639  ATTFL2_2 $CHAR2.
        @641  ATTFL2_3 $CHAR2.
        @643  ATTFL2_4 $CHAR2.
        @645  B23_HOSP $CHAR2.
        @647  B24_HOSP $CHAR2.
        @649  ADDBYPAS $CHAR2.
        @651  CORONBYP $CHAR2.
        @653  B27_BYPS $CHAR2.
        @655  PACEMAKR $CHAR2.
        @657  B29_PACE $CHAR2.
        @659  ADDSTRKE $CHAR2.
        @661  CVA      $CHAR2.
        @663  STRKYR1  $CHAR2.
        @665  STRKFLAG $CHAR2.
        @667  ADDISTRK $CHAR2.
        @669  STYR2_1  $CHAR2.
        @671  STYR2_2  $CHAR2.
        @673  STFL2_1  $CHAR2.
        @675  STFL2_2  $CHAR2.
        @677  B35_HOSP $CHAR2.
        @679  STRARMLG $CHAR2.
        @681  STRWALK  $CHAR2.
        @683  STRTALK  $CHAR2.
        @685  STRTRBLE $CHAR2.
        @687  BLANK10  $CHAR30.
        @717  CHECK1   $CHAR2.
        @719  DIABMED  $CHAR2.
        @721  SUGRDIAB $CHAR2.
        @723  DIABYR1  $CHAR2.
        @725  DIABFLAG $CHAR2.
        @727  INSLNDB  $CHAR2.
        @729  ORALDB   $CHAR2.
        @731  B42_HOSP $CHAR2.
        @733  HIGHBLCH $CHAR2.
        @735  BLCHMED  $CHAR2.
        @737  BLCHWIGT $CHAR2.
        @739  BLCHFTFD $CHAR2.
        @741  BLCHCHFD $CHAR2.
        @743  BLCHEXER $CHAR2.
        @745  CHMEDLW  $CHAR2.
        @747  CHWIGTLW $CHAR2.
        @749  CHFTFDLW $CHAR2.
        @751  CHCHFDLW $CHAR2.
        @753  CHEXERLW $CHAR2.
        @755  HBPMEDIC $CHAR2.
        @757  HYPER    $CHAR2.
        @759  HBPYEAR1 $CHAR2.
        @761  HIBPFLAG $CHAR2.
        @763  PRESCMED $CHAR2.
        @765  MEDREGLR $CHAR2.
        @767  HGBLWIGT $CHAR2.
        @769  HGBLSALT $CHAR2.
        @771  HGBLEXER $CHAR2.
        @773  HBWIGTLW $CHAR2.
        @775  HBSALTLW $CHAR2.
        @777  HBEXERLW $CHAR2.
        @779  B48_HIGH $CHAR2.
        @781  BRCANYR  $CHAR2.
        @783  CANCTYPE $CHAR2.
        @785  CANCRSRT $CHAR2.
        @787  B52_CANC $CHAR2.
        @789  CANCCNT  $CHAR2.
        @791  CHECK2   $CHAR2.
        @793  FRACHIP  $CHAR2.
        @795  BRKNHIP  $CHAR2.
        @797  HIPYEAR1 $CHAR2.
        @799  HIPFLAG  $CHAR2.
        @801  ANTHRHIP $CHAR2.
        @803  HIPYR2_1 $CHAR2.
        @805  HIPYR2_2 $CHAR2.
        @807  HIPYR2_3 $CHAR2.
        @809  HIPYR2_4 $CHAR2.
        @811  HYRFL2_1 $CHAR2.
        @813  HYRFL2_2 $CHAR2.
        @815  HYRFL2_3 $CHAR2.
        @817  HYRFL2_4 $CHAR2.
        @819  B61_HOSP $CHAR2.
        @821  OSTEOPOR $CHAR2.
        @823  OSTEOYR  $CHAR2.
        @825  ADBKWRST $CHAR2.
        @827  BRKNWRST $CHAR2.
        @829  WRSTYR1  $CHAR2.
        @831  WRSTYR2  $CHAR2.
        @833  WRSTYR3  $CHAR2.
        @835  WRSTYR4  $CHAR2.
        @837  FALLS    $CHAR2.
        @839  NUMFALLS $CHAR2.
        @841  FALLBKBN $CHAR2.
        @843  FALLHEAD $CHAR2.
        @845  FALLMEDC $CHAR2.
        @847  B70_FALL $CHAR2.
        @849  B71_FLU  $CHAR2.
        @851  KIDNYST  $CHAR2.
        @853  EVERKDNY $CHAR2.
        @855  YRTELKID $CHAR2.
        @857  KIDNEYFG $CHAR2.
        @859  DOCKID   $CHAR2.
        @861  FRSTOLDK $CHAR2.
        @863  B74_HOSP $CHAR2.
        @865  SURGCATR $CHAR2.
        @867  EVERCATR $CHAR2.
        @869  CATRSURG $CHAR2.
        @871  YRCATR1  $CHAR2.
        @873  YRCATR2  $CHAR2.
        @875  CATFLAG1 $CHAR2.
        @877  CATFLAG2 $CHAR2.
        @879  B79_HOSP $CHAR2.
        @881  VASECTMY $CHAR2.
        @883  AGEVASEC $CHAR2.
        @885  B83_HOSP $CHAR2.
        @887  FACIL    $CHAR2.
        @889  RESTCNT  $CHAR2.
        @891  HEALTH   $CHAR2.
        @893  PREVMNHT $CHAR2.
        @895  PREVYRHT $CHAR2.
        @897  SUBDIEHN $CHAR2.
        @899  DTHCAUSE $CHAR3.
        @902  SUBJCOND $CHAR2.
        @904  STAYBED  $CHAR2.
        @906  GRLNGTHB $CHAR4.
        @906  LNGTHBED $CHAR2.
        @908  C2UNIT   $CHAR2.
        @910  USELIMBS $CHAR2.
        @912  PARALMB  $CHAR2.
        @914  AMPUTLMB $CHAR2.
        @916  ARTHLMB  $CHAR2.
        @918  OTHLMB   $CHAR2.
        @920  LIMBOTH1 $CHAR2.
        @922  BLANK11  $CHAR25.
        @947  PARARUL  $CHAR2.
        @949  PARALUL  $CHAR2.
        @951  PARARLL  $CHAR2.
        @953  PARALLL  $CHAR2.
        @955  AMPUTRUL $CHAR2.
        @957  AMPUTLUL $CHAR2.
        @959  AMPUTRLL $CHAR2.
        @961  AMPUTLLL $CHAR2.
        @963  OTLMBRUL $CHAR2.
        @965  OTLMBLUL $CHAR2.
        @967  OTLMBRLL $CHAR2.
        @969  OTLMBLLL $CHAR2.
        @971  LIM_CONT $CHAR2.
        @973  USEEQUIP $CHAR2.
        @975  SPBATH   $CHAR2.
        @977  CANE     $CHAR2.
        @979  ARTLIMBS $CHAR2.
        @981  WALKER   $CHAR2.
        @983  WHEELCHR $CHAR2.
        @985  DEVICES  $CHAR2.
        @987  SPCHAIR  $CHAR2.
        @989  EATDEV   $CHAR2.
        @991  CFREQ    $CHAR2.
        @993  C10A     $CHAR2.
        @995  C10B     $CHAR2.
        @997  C10C     $CHAR2.
        @999  C10D     $CHAR2.
        @1001 C10E     $CHAR2.
        @1003 C11A     $CHAR2.
        @1005 C11B     $CHAR2.
        @1007 C11C     $CHAR2.
        @1009 C11D     $CHAR2.
        @1011 C11E     $CHAR2.
        @1013 C12A     $CHAR2.
        @1015 C12B     $CHAR2.
        @1017 C12C     $CHAR2.
        @1019 C12D     $CHAR2.
        @1021 C12E     $CHAR2.
        @1023 C13A     $CHAR2.
        @1025 C13B     $CHAR2.
        @1027 C13C     $CHAR2.
        @1029 C14A     $CHAR2.
        @1031 C14B     $CHAR2.
        @1033 C14C     $CHAR2.
        @1035 C15A     $CHAR2.
        @1037 C15B     $CHAR2.
        @1039 C15C     $CHAR2.
        @1041 C16A     $CHAR2.
        @1043 C16B     $CHAR2.
        @1045 C16C     $CHAR2.
        @1047 C17A     $CHAR2.
        @1049 C17B     $CHAR2.
        @1051 C17C     $CHAR2.
        @1053 C17D     $CHAR2.
        @1055 C17E     $CHAR2.
        @1057 C18A     $CHAR2.
        @1059 C18B     $CHAR2.
        @1061 C18C     $CHAR2.
        @1063 C18D     $CHAR2.
        @1065 C18E     $CHAR2.
        @1067 C19A     $CHAR2.
        @1069 C19B     $CHAR2.
        @1071 C19C     $CHAR2.
        @1073 C19D     $CHAR2.
        @1075 C19E     $CHAR2.
        @1077 C20A     $CHAR2.
        @1079 C20B     $CHAR2.
        @1081 C20C     $CHAR2.
        @1083 C20D     $CHAR2.
        @1085 C20E     $CHAR2.
        @1087 C21A     $CHAR2.
        @1089 C21B     $CHAR2.
        @1091 C21C     $CHAR2.
        @1093 C22A     $CHAR2.
        @1095 C22B     $CHAR2.
        @1097 C22C     $CHAR2.
        @1099 C22D     $CHAR2.
        @1101 C22E     $CHAR2.
        @1103 C23A     $CHAR2.
        @1105 C23B     $CHAR2.
        @1107 C23C     $CHAR2.
        @1109 C24A     $CHAR2.
        @1111 C24B     $CHAR2.
        @1113 C24C     $CHAR2.
        @1115 C24D     $CHAR2.
        @1117 C24E     $CHAR2.
        @1119 C25A     $CHAR2.
        @1121 C25B     $CHAR2.
        @1123 C25C     $CHAR2.
        @1125 C25D     $CHAR2.
        @1127 C25E     $CHAR2.
        @1129 C26A     $CHAR2.
        @1131 C26B     $CHAR2.
        @1133 C26C     $CHAR2.
        @1135 C26D     $CHAR2.
        @1137 C26E     $CHAR2.
        @1139 C27A     $CHAR2.
        @1141 C27B     $CHAR2.
        @1143 C27C     $CHAR2.
        @1145 C28A     $CHAR2.
        @1147 C28B     $CHAR2.
        @1149 C28C     $CHAR2.
        @1151 C28D     $CHAR2.
        @1153 C28E     $CHAR2.
        @1155 C29A     $CHAR2.
        @1157 C29B     $CHAR2.
        @1159 C29C     $CHAR2.
        @1161 C30A     $CHAR2.
        @1163 C30B     $CHAR2.
        @1165 C30C     $CHAR2.
        @1167 C31A     $CHAR2.
        @1169 C31B     $CHAR2.
        @1171 C31C     $CHAR2.
        @1173 C32A     $CHAR2.
        @1175 C32B     $CHAR2.
        @1177 C32C     $CHAR2.
        @1179 RESPC    $CHAR2.
        @1181 BLANK12  $CHAR42.
        @1223 PRXSMDRD $CHAR2.
        @1225 SMOKE100 $CHAR2.
        @1227 SMOKENOW $CHAR2.
        @1229 SMKPERDY $CHAR3.
        @1232 YRSSMOKE $CHAR2.
        @1234 GRMONTHS $CHAR4.
        @1234 MONTHSTP $CHAR2.
        @1236 YEARSTOP $CHAR2.
        @1238 NUMBSMOK $CHAR3.
        @1241 DIDSMOKE $CHAR2.
        @1243 CSMKNOW  $CHAR2.
        @1245 CSMKPRDY $CHAR3.
        @1248 GRNCSMKM $CHAR4.
        @1248 NCSMKMO  $CHAR2.
        @1250 NCSMKYR  $CHAR2.
        @1252 DRINKYR  $CHAR2.
        @1254 GROFTNBE $CHAR7.
        @1254 OFTNBEER $CHAR2.
        @1256 WKMOBEER $CHAR2.
        @1258 NUMBBEER $CHAR3.
        @1261 GROFTNWI $CHAR7.
        @1261 OFTNWINE $CHAR2.
        @1263 WKMOWINE $CHAR2.
        @1265 NUMBWINE $CHAR3.
        @1268 GROFTNLI $CHAR7.
        @1268 OFTNLIQ  $CHAR2.
        @1270 WKMOLIQ  $CHAR2.
        @1272 NUMBSHOT $CHAR3.
        @1275 EXERPROG $CHAR2.
        @1277 GRE2NUM  $CHAR4.
        @1277 E2NUM    $CHAR2.
        @1279 E2UNIT   $CHAR2.
        @1281 GRE3NUM  $CHAR4.
        @1281 E3NUM    $CHAR2.
        @1283 E3UNIT   $CHAR2.
        @1285 SPORTTIM $CHAR2.
        @1287 GRE5NUM  $CHAR4.
        @1287 E5NUM    $CHAR2.
        @1289 E5UNIT   $CHAR2.
        @1291 ACTVTIM  $CHAR2.
        @1293 WHTCOMPR $CHAR2.
        @1295 WEIGHNOW $CHAR3.
        @1298 GRSDIMEN $CHAR13.
        @1298 SDIMENSN $CHAR2.
        @1300 SHEIGHT  $CHAR2.
        @1302 SWGHT25  $CHAR3.
        @1305 SWGHT40  $CHAR3.
        @1308 SWGHT65  $CHAR3.
        @1311 WREYEGLS $CHAR2.
        @1313 SEESTR   $CHAR2.
        @1315 SEEPRINT $CHAR2.
        @1317 HEARAID  $CHAR2.
        @1319 HEARNORM $CHAR2.
        @1321 WOHRGAID $CHAR2.
        @1323 PRXPGMD  $CHAR2.
        @1325 EVERPREG $CHAR2.
        @1327 PREGNOW1 $CHAR2.
        @1329 FRSTBRTH $CHAR2.
        @1331 SINCPREG $CHAR2.
        @1333 PREGNOW2 $CHAR2.
        @1335 LASTBRTH $CHAR2.
        @1337 LIVEBRTH $CHAR2.
        @1339 MISCARAG $CHAR2.
        @1341 NUMMISS  $CHAR2.
        @1343 HAVEWOMB $CHAR2.
        @1345 AGEREMVD $CHAR2.
        @1347 BOTHOVRY $CHAR2.
        @1349 ONEOVRY  $CHAR2.
        @1351 REMVOVRY $CHAR2.
        @1353 HAVPERD  $CHAR2.
        @1355 AGEPERD  $CHAR2.
        @1357 PERDREG  $CHAR2.
        @1359 CHNGLIFE $CHAR2.
        @1361 HORMONE  $CHAR2.
        @1363 AGEHPILL $CHAR2.
        @1365 GRG20UNI $CHAR9.
        @1365 G20UNITA $CHAR2.
        @1367 HPIL1MOL $CHAR2.
        @1369 HPIL1YRL $CHAR2.
        @1371 G20ATOT  $CHAR3.
        @1374 GRG20    $CHAR9.
        @1374 G20UNITB $CHAR2.
        @1376 HPIL1MOT $CHAR2.
        @1378 HPIL1YRT $CHAR2.
        @1380 G20BTOT  $CHAR3.
        @1383 PILLCHNG $CHAR2.
        @1385 GRG22UNI $CHAR9.
        @1385 G22UNITA $CHAR2.
        @1387 HPIL2MOL $CHAR2.
        @1389 HPIL2YRL $CHAR2.
        @1391 G22ATOT  $CHAR3.
        @1394 GRG22UNB $CHAR9.
        @1394 G22UNITB $CHAR2.
        @1396 HPIL2MOT $CHAR2.
        @1398 HPIL2YRT $CHAR2.
        @1400 G22BTOT  $CHAR3.
        @1403 CURTAKHM $CHAR2.
        @1405 COLORPIL $CHAR2.
        @1407 GRUNIT25 $CHAR4.
        @1407 UNIT25   $CHAR2.
        @1409 LONGCOLR $CHAR2.
        @1411 PROVERA  $CHAR2.
        @1413 CURPROV  $CHAR2.
        @1415 GRUNIT28 $CHAR4.
        @1415 UNIT28   $CHAR2.
        @1417 LONGPIL2 $CHAR2.
        @1419 BRTHPILL $CHAR2.
        @1421 AGELASTP $CHAR2.
        @1423 GRG31UNI $CHAR9.
        @1423 G31UNITA $CHAR2.
        @1425 BPIL1MOL $CHAR2.
        @1427 BPIL1YRL $CHAR2.
        @1429 G31ATOT  $CHAR3.
        @1432 GRG31UNB $CHAR9.
        @1432 G31UNITB $CHAR2.
        @1434 BPIL1MOT $CHAR2.
        @1436 BPIL1YRT $CHAR2.
        @1438 G31BTOT  $CHAR3.
        @1441 BRTHPIL2 $CHAR2.
        @1443 AGEFRSTP $CHAR2.
        @1445 CURPILL  $CHAR2.
        @1447 AGELSTP2 $CHAR2.
        @1449 GRG36UNA $CHAR9.
        @1449 G36UNITA $CHAR2.
        @1451 BPIL2MOL $CHAR2.
        @1453 BPIL2YRL $CHAR2.
        @1455 G36ATOT  $CHAR3.
        @1458 GRG36UNB $CHAR9.
        @1458 G36UNITB $CHAR2.
        @1460 BPIL2MOT $CHAR2.
        @1462 BPIL2YRT $CHAR2.
        @1464 G36BTOT  $CHAR3.
        @1467 GRG37UNI $CHAR6.
        @1467 G37UNIT  $CHAR2.
        @1469 BPIL25MO $CHAR2.
        @1471 BPIL25YR $CHAR2.
        @1473 BEFCHILD $CHAR2.
        @1475 GRG39UNI $CHAR6.
        @1475 G39UNIT  $CHAR2.
        @1477 BPILBCMO $CHAR2.
        @1479 BPILBCYR $CHAR2.
        @1481 TUBETYD  $CHAR2.
        @1483 AGETUBTY $CHAR2.
        @1485 CALCIUM  $CHAR2.
        @1487 GRG43UNI $CHAR4.
        @1487 UNIT43   $CHAR2.
        @1489 LONGCALC $CHAR2.
        @1491 PAPTEST  $CHAR2.
        @1493 LONGPAP  $CHAR2.
        @1495 MANYPAP5 $CHAR2.
        @1497 BRSTEXAM $CHAR2.
        @1499 NUMBRST5 $CHAR2.
        @1501 LONGBRST $CHAR2.
        @1503 EXAMSELF $CHAR2.
        @1505 EVEREXAM $CHAR2.
        @1507 OFTNEXAM $CHAR2.
        @1509 MAMMO    $CHAR2.
        @1511 NUMMAMO5 $CHAR2.
        @1513 LASTMAMO $CHAR2.
        @1515 MEDICARE $CHAR2.
        @1517 HHCF     $CHAR2.
        @1519 BLANK13  $CHAR90.
        @1609 RELAPRX1 $CHAR2.
        @1611 BLANK14  $CHAR128.
        @1739 SUBAST   $CHAR2.
        @1741 NUMAST   $CHAR2.
        @1743 AST1REL  $CHAR2.
        @1745 BLANK15  $CHAR184.
        @1929 PRIMAST  $CHAR2.
        @1931 GRKHEAR  $CHAR140.
        @1931 KHEAR    $CHAR2.
        @1933 KSPEECH  $CHAR2.
        @1935 KLANGU   $CHAR2.
        @1937 KMEMRY   $CHAR2.
        @1939 KINSTIT  $CHAR2.
        @1941 KALZH    $CHAR2.
        @1943 KOTHMENT $CHAR2.
        @1945 BLANK16  $CHAR30.
        @1975 KOTHPHY  $CHAR2.
        @1977 BLANK17  $CHAR30.
        @2007 KOTHHEAL $CHAR2.
        @2009 BLANK18  $CHAR30.
        @2039 KOTHER   $CHAR2.
        @2041 BLANK19  $CHAR30.
        @2071 INFOSATS $CHAR2.
        @2073 BLANK20  $CHAR195.
        @2268 SUBAWARE $CHAR2.
        @2270 QHELDATT $CHAR2.
        @2272 QUPSTDEP $CHAR2.
        @2274 QBORING  $CHAR2.
        @2276 RCAPABLE $CHAR2.
        @2278 RACCURTE $CHAR2.
        @2280 RUNDESST $CHAR2.
        @2282 BADSECT  $CHAR2.
        @2284 BLANK21  $CHAR95.
        @2379 RHRDHRNG $CHAR2.
        @2381 QINTSPAN $CHAR2.
        @2383 BLANK22  $CHAR653.
        @3036 GRCANC1  $CHAR300.
        @3036 BLANK23  $CHAR5.
        @3041 CANCNUM1 $CHAR2.
        @3043 CACRLOC1 $CHAR2.
        @3045 BLANK24  $CHAR30.
        @3075 IC9CANC1 $CHAR3.
        @3078 ANYCANC1 $CHAR2.
        @3080 TODCANC1 $CHAR2.
        @3082 CANCFL1  $CHAR2.
        @3084 B5_HOSP1 $CHAR2.
        @3086 BLANK25  $CHAR5.
        @3091 CANCNUM2 $CHAR2.
        @3093 CACRLOC2 $CHAR2.
        @3095 BLANK26  $CHAR30.
        @3125 IC9CANC2 $CHAR3.
        @3128 ANYCANC2 $CHAR2.
        @3130 TODCANC2 $CHAR2.
        @3132 CANCFL2  $CHAR2.
        @3134 B5_HOSP2 $CHAR2.
        @3136 BLANK27  $CHAR5.
        @3141 CANCNUM3 $CHAR2.
        @3143 CACRLOC3 $CHAR2.
        @3145 BLANK28  $CHAR30.
        @3175 IC9CANC3 $CHAR3.
        @3178 ANYCANC3 $CHAR2.
        @3180 TODCANC3 $CHAR2.
        @3182 CANCFL3  $CHAR2.
        @3184 B5_HOSP3 $CHAR2.
        @3186 BLANK29  $CHAR5.
        @3191 CANCNUM4 $CHAR2.
        @3193 CACRLOC4 $CHAR2.
        @3195 BLANK30  $CHAR30.
        @3225 IC9CANC4 $CHAR3.
        @3228 ANYCANC4 $CHAR2.
        @3230 TODCANC4 $CHAR2.
        @3232 CANCFL4  $CHAR2.
        @3234 B5_HOSP4 $CHAR2.
        @3236 BLANK31  $CHAR5.
        @3241 CANCNUM5 $CHAR2.
        @3243 CACRLOC5 $CHAR2.
        @3245 BLANK32  $CHAR30.
        @3275 IC9CANC5 $CHAR3.
        @3278 ANYCANC5 $CHAR2.
        @3280 TODCANC5 $CHAR2.
        @3282 CANCFL5  $CHAR2.
        @3284 B5_HOSP5 $CHAR2.
        @3286 BLANK33  $CHAR5.
        @3291 CANCNUM6 $CHAR2.
        @3293 CACRLOC6 $CHAR2.
        @3295 BLANK34  $CHAR30.
        @3325 IC9CANC6 $CHAR3.
        @3328 ANYCANC6 $CHAR2.
        @3330 TODCANC6 $CHAR2.
        @3332 CANCFL6  $CHAR2.
        @3334 B5_HOSP6 $CHAR2.
        @3336 BLANK35  $CHAR5.
        @3341 RESTNUM1 $CHAR2.
        @3343 ADSNPLC1 $CHAR2.
        @3345 BLANK36  $CHAR30.
        @3375 ENERFRM1 $CHAR2.
        @3377 BLANK37  $CHAR30.
        @3407 YERENTR1 $CHAR2.
        @3409 NUSCARE1 $CHAR2.
        @3411 SUGRECP1 $CHAR2.
        @3413 NEDHELP1 $CHAR2.
        @3415 RESPCMD1 $CHAR2.
        @3417 COFUSED1 $CHAR2.
        @3419 CNDTNM11 $CHAR2.
        @3421 BLANK38  $CHAR30.
        @3451 CNDTNM21 $CHAR2.
        @3453 BLANK39  $CHAR30.
        @3483 CNDTNM31 $CHAR2.
        @3485 BLANK40  $CHAR30.
        @3515 CNDTNM41 $CHAR2.
        @3517 BLANK41  $CHAR30.
        @3547 CNDTNM51 $CHAR2.
        @3549 BLANK42  $CHAR30.
        @3579 RECODE11 $CHAR2.
        @3581 RECODE21 $CHAR2.
        @3583 RECODE31 $CHAR2.
        @3585 RECODE41 $CHAR2.
        @3587 RECODE51 $CHAR2.
        @3589 RECODE61 $CHAR2.
        @3591 RECODE71 $CHAR2.
        @3593 RECODE81 $CHAR2.
        @3595 RECODE91 $CHAR2.
        @3597 REODE101 $CHAR2.
        @3599 REODE111 $CHAR2.
        @3601 REODE121 $CHAR2.
        @3603 REODE131 $CHAR2.
        @3605 REODE141 $CHAR2.
        @3607 REODE151 $CHAR2.
        @3609 REODE161 $CHAR2.
        @3611 REODE171 $CHAR2.
        @3613 REODE181 $CHAR2.
        @3615 REODE191 $CHAR2.
        @3617 B92NUM1  $CHAR2.
        @3619 B92UNIT1 $CHAR2.
        @3621 OTADMSN1 $CHAR2.
        @3623 BLANK43  $CHAR7.
        @3630 RESTNUM2 $CHAR2.
        @3632 ADSNPLC2 $CHAR2.
        @3634 BLANK44  $CHAR30.
        @3664 ENERFRM2 $CHAR2.
        @3666 BLANK45  $CHAR30.
        @3696 YERENTR2 $CHAR2.
        @3698 NUSCARE2 $CHAR2.
        @3700 SUGRECP2 $CHAR2.
        @3702 NEDHELP2 $CHAR2.
        @3704 RESPCMD2 $CHAR2.
        @3706 COFUSED2 $CHAR2.
        @3708 CNDTNM12 $CHAR2.
        @3710 BLANK46  $CHAR30.
        @3740 CNDTNM22 $CHAR2.
        @3742 BLANK47  $CHAR30.
        @3772 CNDTNM32 $CHAR2.
        @3774 BLANK48  $CHAR30.
        @3804 CNDTNM42 $CHAR2.
        @3806 BLANK49  $CHAR30.
        @3836 CNDTNM52 $CHAR2.
        @3838 BLANK50  $CHAR30.
        @3868 RECODE12 $CHAR2.
        @3870 RECODE22 $CHAR2.
        @3872 RECODE32 $CHAR2.
        @3874 RECODE42 $CHAR2.
        @3876 RECODE52 $CHAR2.
        @3878 RECODE62 $CHAR2.
        @3880 RECODE72 $CHAR2.
        @3882 RECODE82 $CHAR2.
        @3884 RECODE92 $CHAR2.
        @3886 REODE102 $CHAR2.
        @3888 REODE112 $CHAR2.
        @3890 REODE122 $CHAR2.
        @3892 REODE132 $CHAR2.
        @3894 REODE142 $CHAR2.
        @3896 REODE152 $CHAR2.
        @3898 REODE162 $CHAR2.
        @3900 REODE172 $CHAR2.
        @3902 REODE182 $CHAR2.
        @3904 REODE192 $CHAR2.
        @3906 B92NUM2  $CHAR2.
        @3908 B92UNIT2 $CHAR2.
        @3910 OTADMSN2 $CHAR2.
        @3912 SAMEREA2 $CHAR2.
        @3914 BLANK51  $CHAR5.
        @3919 RESTNUM3 $CHAR2.
        @3921 ADSNPLC3 $CHAR2.
        @3923 BLANK52  $CHAR30.
        @3953 ENERFRM3 $CHAR2.
        @3955 BLANK53  $CHAR30.
        @3985 YERENTR3 $CHAR2.
        @3987 NUSCARE3 $CHAR2.
        @3989 SUGRECP3 $CHAR2.
        @3991 NEDHELP3 $CHAR2.
        @3993 RESPCMD3 $CHAR2.
        @3995 COFUSED3 $CHAR2.
        @3997 CNDTNM13 $CHAR2.
        @3999 BLANK54  $CHAR30.
        @4029 CNDTNM23 $CHAR2.
        @4031 BLANK55  $CHAR30.
        @4061 CNDTNM33 $CHAR2.
        @4063 BLANK56  $CHAR30.
        @4093 CNDTNM43 $CHAR2.
        @4095 BLANK57  $CHAR30.
        @4125 CNDTNM53 $CHAR2.
        @4127 BLANK58  $CHAR30.
        @4157 RECODE13 $CHAR2.
        @4159 RECODE23 $CHAR2.
        @4161 RECODE33 $CHAR2.
        @4163 RECODE43 $CHAR2.
        @4165 RECODE53 $CHAR2.
        @4167 RECODE63 $CHAR2.
        @4169 RECODE73 $CHAR2.
        @4171 RECODE83 $CHAR2.
        @4173 RECODE93 $CHAR2.
        @4175 REODE103 $CHAR2.
        @4177 REODE113 $CHAR2.
        @4179 REODE123 $CHAR2.
        @4181 REODE133 $CHAR2.
        @4183 REODE143 $CHAR2.
        @4185 REODE153 $CHAR2.
        @4187 REODE163 $CHAR2.
        @4189 REODE173 $CHAR2.
        @4191 REODE183 $CHAR2.
        @4193 REODE193 $CHAR2.
        @4195 B92NUM3  $CHAR2.
        @4197 B92UNIT3 $CHAR2.
        @4199 OTADMSN3 $CHAR2.
        @4201 BLANK59  $CHAR7.
        @4208 RESTNUM4 $CHAR2.
        @4210 ADSNPLC4 $CHAR2.
        @4212 BLANK60  $CHAR30.
        @4242 ENERFRM4 $CHAR2.
        @4244 BLANK61  $CHAR30.
        @4274 YERENTR4 $CHAR2.
        @4276 NUSCARE4 $CHAR2.
        @4278 SUGRECP4 $CHAR2.
        @4280 NEDHELP4 $CHAR2.
        @4282 RESPCMD4 $CHAR2.
        @4284 COFUSED4 $CHAR2.
        @4286 CNDTNM14 $CHAR2.
        @4288 BLANK62  $CHAR30.
        @4318 CNDTNM24 $CHAR2.
        @4320 BLANK63  $CHAR30.
        @4350 CNDTNM34 $CHAR2.
        @4352 BLANK64  $CHAR30.
        @4382 CNDTNM44 $CHAR2.
        @4384 BLANK65  $CHAR30.
        @4414 CNDTNM54 $CHAR2.
        @4416 BLANK66  $CHAR30.
        @4446 RECODE14 $CHAR2.
        @4448 RECODE24 $CHAR2.
        @4450 RECODE34 $CHAR2.
        @4452 RECODE44 $CHAR2.
        @4454 RECODE54 $CHAR2.
        @4456 RECODE64 $CHAR2.
        @4458 RECODE74 $CHAR2.
        @4460 RECODE84 $CHAR2.
        @4462 RECODE94 $CHAR2.
        @4464 REODE104 $CHAR2.
        @4466 REODE114 $CHAR2.
        @4468 REODE124 $CHAR2.
        @4470 REODE134 $CHAR2.
        @4472 REODE144 $CHAR2.
        @4474 REODE154 $CHAR2.
        @4476 REODE164 $CHAR2.
        @4478 REODE174 $CHAR2.
        @4480 REODE184 $CHAR2.
        @4482 REODE194 $CHAR2.
        @4484 B92NUM4  $CHAR2.
        @4486 B92UNIT4 $CHAR2.
        @4488 OTADMSN4 $CHAR2.
        @4490 BLANK67  $CHAR7.
        @4497 RESTNUM5 $CHAR2.
        @4499 ADSNPLC5 $CHAR2.
        @4501 BLANK68  $CHAR30.
        @4531 ENERFRM5 $CHAR2.
        @4533 BLANK69  $CHAR30.
        @4563 YERENTR5 $CHAR2.
        @4565 NUSCARE5 $CHAR2.
        @4567 SUGRECP5 $CHAR2.
        @4569 NEDHELP5 $CHAR2.
        @4571 RESPCMD5 $CHAR2.
        @4573 COFUSED5 $CHAR2.
        @4575 CNDTNM15 $CHAR2.
        @4577 BLANK70  $CHAR30.
        @4607 CNDTNM25 $CHAR2.
        @4609 BLANK71  $CHAR30.
        @4639 CNDTNM35 $CHAR2.
        @4641 BLANK72  $CHAR30.
        @4671 CNDTNM45 $CHAR2.
        @4673 BLANK73  $CHAR30.
        @4703 CNDTNM55 $CHAR2.
        @4705 BLANK74  $CHAR30.
        @4735 RECODE15 $CHAR2.
        @4737 RECODE25 $CHAR2.
        @4739 RECODE35 $CHAR2.
        @4741 RECODE45 $CHAR2.
        @4743 RECODE55 $CHAR2.
        @4745 RECODE65 $CHAR2.
        @4747 RECODE75 $CHAR2.
        @4749 RECODE85 $CHAR2.
        @4751 RECODE95 $CHAR2.
        @4753 REODE105 $CHAR2.
        @4755 REODE115 $CHAR2.
        @4757 REODE125 $CHAR2.
        @4759 REODE135 $CHAR2.
        @4761 REODE145 $CHAR2.
        @4763 REODE155 $CHAR2.
        @4765 REODE165 $CHAR2.
        @4767 REODE175 $CHAR2.
        @4769 REODE185 $CHAR2.
        @4771 REODE195 $CHAR2.
        @4773 B92NUM5  $CHAR2.
        @4775 B92UNIT5 $CHAR2.
        @4777 OTADMSN5 $CHAR2.
        @4779 BLANK75  $CHAR7.
        @4786 RESTNUM6 $CHAR2.
        @4788 ADSNPLC6 $CHAR2.
        @4790 BLANK76  $CHAR30.
        @4820 ENERFRM6 $CHAR2.
        @4822 BLANK77  $CHAR30.
        @4852 YERENTR6 $CHAR2.
        @4854 NUSCARE6 $CHAR2.
        @4856 SUGRECP6 $CHAR2.
        @4858 NEDHELP6 $CHAR2.
        @4860 RESPCMD6 $CHAR2.
        @4862 COFUSED6 $CHAR2.
        @4864 CNDTNM16 $CHAR2.
        @4866 BLANK78  $CHAR30.
        @4896 CNDTNM26 $CHAR2.
        @4898 BLANK79  $CHAR30.
        @4928 CNDTNM36 $CHAR2.
        @4930 BLANK80  $CHAR30.
        @4960 CNDTNM46 $CHAR2.
        @4962 BLANK81  $CHAR30.
        @4992 CNDTNM56 $CHAR2.
        @4994 BLANK82  $CHAR30.
        @5024 RECODE16 $CHAR2.
        @5026 RECODE26 $CHAR2.
        @5028 RECODE36 $CHAR2.
        @5030 RECODE46 $CHAR2.
        @5032 RECODE56 $CHAR2.
        @5034 RECODE66 $CHAR2.
        @5036 RECODE76 $CHAR2.
        @5038 RECODE86 $CHAR2.
        @5040 RECODE96 $CHAR2.
        @5042 REODE106 $CHAR2.
        @5044 REODE116 $CHAR2.
        @5046 REODE126 $CHAR2.
        @5048 REODE136 $CHAR2.
        @5050 REODE146 $CHAR2.
        @5052 REODE156 $CHAR2.
        @5054 REODE166 $CHAR2.
        @5056 REODE176 $CHAR2.
        @5058 REODE186 $CHAR2.
        @5060 REODE196 $CHAR2.
        @5062 B92NUM6  $CHAR2.
        @5064 B92UNIT6 $CHAR2.
        @5066 OTADMSN6 $CHAR2.
        @5068 BLANK83  $CHAR2.
        @5070 HCFSR01  $CHAR2.
        @5072 HCFSR02  $CHAR2.
        @5074 HCFSR03  $CHAR2.
        @5076 HCFSR04  $CHAR2.
        @5078 HCFSR05  $CHAR2.
        @5080 HCFSR06  $CHAR2.
        @5082 BLANK84  $CHAR2.
        @5084 HCFSR08  $CHAR2.
        @5086 HCFSR09  $CHAR2.
        @5088 HCFSR10  $CHAR2.
        @5090 HCFSR11  $CHAR2.
        @5092 HCFSR12  $CHAR2.
        @5094 HCFSR13  $CHAR2.
        @5096 BLANK85  $CHAR2.
        @5098 HCFSR15  $CHAR2.
        @5100 HCFSR16  $CHAR2.
        @5102 HCFSR17  $CHAR2.
        @5104 HCFSR18  $CHAR2.
        @5106 HCFSR19  $CHAR2.
        @5108 HCFSR20  $CHAR2.
        @5110 HCFSR21  $CHAR2.
        @5112 HCFSR22  $CHAR2.
        @5114 HCFSR23  $CHAR2.
        @5116 HCFSR24  $CHAR2.
        @5118 HCFSR25  $CHAR2.
        @5120 HCFSR26  $CHAR2.
        @5122 HCFSR27  $CHAR2.
        @5124 HCFSR28  $CHAR2.
        @5126 HCFSR29  $CHAR2.
        @5128 HCFSR30  $CHAR2.
        @5130 HCFSR31  $CHAR2.
        @5132 HCFSR32  $CHAR2.
        @5134 HCFSR33  $CHAR2.
        @5136 HCFSR34  $CHAR2.
        @5138 HCFSR35  $CHAR2.
        @5140 HCFSR36  $CHAR2.
        @5142 HCFSR37  $CHAR2.
        @5144 CAUSEDTH $CHAR4.
        @5148 STRATUM  $CHAR2.
        @5150 PSU      $CHAR3.
        @5153 SUBSAMPL $CHAR2.
        @5155 SWGT1    $CHAR6.
        @5161 SWGT2    $CHAR6.
        @5167 SWGT3    $CHAR6.
        @5173 SWGT4    $CHAR6.
        @5179 SWGT5    $CHAR6.
        @5185 SWGT6    $CHAR6.
        ;
*** THIS NEXT STATEMENT ASSIGNS LABELS *** ;                                                                                
LABEL SEQNO    = 'SAMPLE SEQUENCE NUMBER'
      PREVINT  = 'WAS SUBJECT PREVIOUSLY INTERVIEWED'
      SUBSEX   = 'SEX OF SUBJECT'
      TRACSTAT = 'SUBJECT VITAL STATUS'
      GRRSLTMO = 'DATE OF INTERVIEW1987 FOLLOWUP'
      RSLTMO   = 'MONTH'
      RSLTDAY  = 'DAY OF INTERVIEW'
      RSLTYR   = 'YEAR'
      AGENOW   = 'AGE OF SUBJECT AS OF DEC 31, 1986'
      BASERSLT = 'MOST CURRENT RESULT CODE'
      DCRECD   = 'DEATH CERTIFICATE RECEIVED'
      GRDEATHM = 'DATE OF DEATH1987 FOLLOWUP'
      DEATHMO  = 'MONTH'
      DEATHDAY = 'DAY'
      DEATHYR  = 'YEAR'
      ARTHECF  = 'S REPORTED ARTHRITIS ON ECF'
      GOUTECF  = 'S REPORTED GOUT ON ECF'
      HEARTATT = 'S REPORTED HEART ATTACK ON IF/ECF'
      HEARTOTH = 'S REPORTED OTH HEART CONDITION ON IF/ECF'
      BYPASECF = 'S REPORTED CORON BYPASS ON ECF'
      PACEECF  = 'S REPORTED PACEMKR ON ECF'
      STROKE   = 'S REPORTED STROKE ON IF/ECF'
      DIABETES = 'S REPORTED DIABETES ON IF/ECF'
      BLOODPRE = 'S REPORTED HIGH BLOOD PRES ON IF/ECF'
      BPMEDECF = 'S REPORTED HBP MED ON ECF'
      BROKENHI = 'S REPORTED BROKEN HIP ON IF/ECF'
      CANCER   = 'S REPORTED CANCER ON IF/ECF'
      BRCANCER = 'S REPORTED BREAST CANCER ON IF'
      KIDNEYIF = 'S REPORTED KIDNEY DIS OR STNS ON IF'
      CATARECF = 'S REPORTED CATARACT SURGERY ON ECF'
      LIVARECF = 'S REPORTED NH ON ECF'
      WORKIF   = 'S REPORTED WORKING ON IF'
      RETIREIF = 'S REPORTED RETIRED, KEEP HOUSE ON IF'
      MOMALIF  = 'S REPORTED MOTHER ALIVE ON IF'
      DADALIF  = 'S REPORTED FATHER ALIVE ON IF'
      SMOKSTAT = 'S SMOKES NOW, FORMERLY, NEVER ON IF/ECF'
      LIVBRTH1 = 'S REPORTED LIVE BIRTH ON IF'
      PREGIF   = 'S REPORTED PREG ON IF'
      UTERUSIF = 'S REPORTED INTACT UTERUS ON IF OR DK'
      OVARYIF  = 'S HAD ONE, BOTH OR NO OVARIES ON IF'
      PERIODIF = 'S REPORTED HAVING PERIODS ON IF'
      HORMONES = 'S REPORTED TAKING HORMONE PILL ON IF/ECF'
      BCPILLIF = 'S REPORTED TAKING BC PILLS ON IF'
      BCPILL25 = 'S TOOK BCPILLS BFR AGE 25 ON IF/ECF'
      GRIDATEM = 'DATE OF INTERVIEW 1982-1984 FOLLOWUP'
      IDATEMM  = 'MONTH'
      IDATEDAY = 'DAY'
      IDATEYR  = 'YEAR'
      GRCFMONT = 'DATE OF INTERVIEW 1986 FOLLOWUP'
      CFMONTH  = 'MONTH'
      CFDAY    = 'DAY'
      CFYEAR   = 'YEAR'
      GREXAMMO = 'DATE OF NHANES I EXAM'
      EXAMMO   = 'MONTH'
      EXAMDAY  = 'DAY'
      EXAMYR   = 'YEAR'
      GRBIRTHM = 'NHEFS DATE OF BIRTH'
      BIRTHMO  = 'MONTH'
      BDATE2   = 'YEAR'
      AGEEXAM  = 'AGE OF SUBJECT AT NHANESI EXAM'
      AGEIF    = 'AGE OF SUBJECT AT INITIAL FOLLOWUP'
      AGECF    = 'AGE OF SUBJECT AT ECF'
      AGECONT  = 'AGE AT LAST INTERVIEW IF/ECF'
      ELIGECF  = 'ELIGIBLE FOR ECF'
      GRCONTMO = 'DATE OF MOST RECENT INTERVIEW'
      CONTMO   = 'MONTH'
      CONTDAY  = 'DAY'
      CONTYR   = 'YEAR'
      EFVIT    = 'VITAL STATUS 1986 NHEFS'
      QDISIF   = 'QUESTIONNAIRE DISPOSITION AT IF'
      IFVIT    = 'IF VITAL STATUS'
      QDISECF  = 'QUESTIONNAIRE DISPOSITION AT ECF'
      QVERSION = 'TELEPHONE OR MAIL QUESTIONNAIRE'
      REVRACE  = 'REVISED RACE'
      PRELA    = 'PROXY RELATIONSHIP'
      RELATOS  = 'HOW WAS RESPONDENT RELATED TO SUBJECT'
      LIVEARRG = 'S CURRENT LIVING ARRANGEMENT'
      SDIENRHM = 'WAS S IN NH AT TIME OF DEATH'
      PRXLIVWD = 'R LIVED WITH S 1 YR PRIOR TO DEATH'
      PRXVISTD = 'HOW FREQ R VISIT S YR BEFORE DEATH'
      NHCONTU  = 'LIVED IN NH CONTINUOUSLY'
      SAMENH   = 'SAME NH AS ECF'
      NUMSLIVE = "NUMBER OF PEOPLE IN S'S HOUSEHOLD"
      GRLGTHAL = 'HOW LONG HAS SUBJECT LIVED ALONE?'
      LGTHALNE = 'HOW LONG HAD S LIVED ALONE'
      LGTHUNIT = 'TIME PERIOD RESPONDED IN'
      GRRELATO = 'RELATIONSHIP TO S'
      RELTOS1  = '1ST RELATIONSHIP'
      RELTOS2  = '2ND RELATIONSHIP'
      RELTOS3  = '3RD RELATIONSHIP'
      RELTOS4  = '4TH RELATIONSHIP'
      RELTOS5  = '5TH RELATIONSHIP'
      RELTOS6  = '6TH RELATIONSHIP'
      RELTOS7  = '7TH RELATIONSHIP'
      RELTOS8  = '8TH RELATIONSHIP'
      RELTOS9  = '9TH RELATIONSHIP'
      RELTOS10 = '10TH RELATIONSHIP'
      RELTOS11 = '11TH RELATIONSHIP'
      RELTOS12 = '12TH RELATIONSHIP'
      RELTOS13 = '13TH RELATIONSHIP'
      GRRELSEX = 'SEX EA HOUSEHOLD MEM CURRENTLY LIV W/ S'
      RELSEX1  = 'SEX OF 1ST MEMBER'
      RELSEX2  = 'SEX OF 2ND MEMBER'
      RELSEX3  = 'SEX OF 3RD MEMBER'
      RELSEX4  = 'SEX OF 4TH MEMBER'
      RELSEX5  = 'SEX OF 5TH MEMBER'
      RELSEX6  = 'SEX OF 6TH MEMBER'
      RELSEX7  = 'SEX OF 7TH MEMBER'
      RELSEX8  = 'SEX OF 8TH MEMBER'
      RELSEX9  = 'SEX OF 9TH MEMBER'
      RELSEX10 = 'SEX OF 10TH MEMBER'
      RELSEX11 = 'SEX OF 11TH MEMBER'
      RELSEX12 = 'SEX OF 12TH MEMBER'
      RELSEX13 = 'SEX OF 13TH MEMBER'
      NUMSLVED = 'NUMBER OF PEOPLE IN FORMER HOUSEHOLD'
      GRLGTHA2 = 'TIME PERIOD S LIVED ALONE'
      LGTHALN2 = 'NUMBER OF MONTHS/YEARS S LIVED ALONE'
      LGTHUNT2 = 'TIME PERIOD RESPONDED IN'
      GRRELDOS = 'RELATIONSHIP TO S PRIOR TO NURSING HOME'
      RELDOS1  = '1ST RELATIONSHIP'
      RELDOS2  = '2ND RELATIONSHIP'
      RELDOS3  = '3RD RELATIONSHIP'
      RELDOS4  = '4TH RELATIONSHIP'
      RELDOS5  = '5TH RELATIONSHIP'
      RELDOS6  = '6TH RELATIONSHIP'
      RELDOS7  = '7TH RELATIONSHIP'
      RELDOS8  = '8TH RELAITONSHIP'
      RELDOS9  = '9TH RELATIONSHIP'
      RELDOS10 = '10TH RELATIONSHIP'
      RELDOS11 = '11TH RELATIONSHIP'
      RELDOS12 = '12TH RELATIONSHIP'
      GRRELDSX = 'SEX OF M LIVING W/ S PRIOR TO NURSING HM'
      RELDSX1  = 'SEX OF 1ST MEMBER'
      RELDSX2  = 'SEX OF 2ND MEMBER'
      RELDSX3  = 'SEX OF 3RD MEMBER'
      RELDSX4  = 'SEX OF 4TH MEMBER'
      RELDSX5  = 'SEX OF 5TH MEMBER'
      RELDSX6  = 'SEX OF 6TH MEMBER'
      RELDSX7  = 'SEX OF 7TH MEMBER'
      RELDSX8  = 'SEX OF 8TH MEMBER'
      RELDSX9  = 'SEX OF 9TH MEMBER'
      RELDSX10 = 'SEX OF 10TH MEMBER'
      RELDSX11 = 'SEX OF 11TH MEMBER'
      RELDSX12 = 'SEX OF 12TH MEMBER'
      MARRSTAT = 'MARITAL STATUS OF SUBJECT'
      SUBJRACE = 'RACE OF SUBJECT'
      HISPANIC = 'IS S OF HISPANIC ORIGIN'
      DOINGMST = 'WHAT IS S DOING MOST'
      HRSWKJB1 = 'HOURS WORK PER WEEK'
      WORKJOB  = 'WORKED AT ALL LAST 3 MONTHS'
      HRSWKJB2 = 'HOURS WORKED PER WEEK'
      STPJBHEA = 'STOPPED WORKING DUE TO HEALTH'
      MOMALIVE = 'MOTHER LIVING'
      MOMAGED  = 'MOTHER AGE AT DEATH'
      DADALIVE = 'FATHER ALIVE'
      DADAGED  = 'FATHER AGE AT DEATH'
      GENERAL  = 'GENERAL HEALTH OF SUBJECT'
      PRXMHQD  = 'CAN PROXY COMPLETE SECTION B'
      JOINTS   = 'PAIN, SWELLING, STIFF JOINTS'
      DREVRTEL = 'DID S HAVE ARTHRITIS'
      FRSTARTH = 'FIRST TOLD HAD ARTHRITIS'
      ARTHFLG1 = 'ARTHRITIS NOT PREV REP/REP < PREV INT YR'
      DRARTHR  = 'DID DR SAY WHICH TYPE ARTHR S HAD'
      OSTEOART = 'S HAD OSTEO/DEGENERATIVE ARTH'
      RHEUMATD = 'S HAD RHEUMATOID ARTHRITIS'
      OTHRTYPE = 'S HAD SOME OTHER TYPE OF ARTHRITIS'
      XRYJOINT = 'EVER HAD AN X-RAY OF ANY JOINTS'
      FRSTXRAY = 'HOW LONG AGO S FIRST HAD X-RAY'
      LASTXRAY = 'HOW LONG AGO S LAST HAD X-RAY'
      GOUT     = 'DOCTOR CONFIRMED GOUT'
      SINCGOUT = 'ADDITIONAL EPISODE OF GOUT'
      FRSTGOUT = 'WHAT YR WAS S FIRST TOLD ABOUT GOUT'
      GOUTFLG1 = 'GOUT NOT PREV REPORTED, YR < PREV INT YR'
      MEMGOUT1 = 'WAS IT LESS THAN A YEAR AGO'
      LASTGOUT = 'WHAT YR DID S HAVE LAST GOUT EPIS'
      MEMGOUT2 = 'WAS IT LESS THAN A YEAR AGO'
      ARTHGOUT = 'DID DR SAY S HAD ARTHR CAUS BY GOUT'
      B17_HOSP = 'WAS S HOSP FOR GOUT OR ARTHR'
      HEARTATK = 'DID S HAVE ADDITIONAL HEART ATTACK'
      EVERATT  = 'DID DR SAY S HAD A HEART ATTACK'
      FIRSTATT = 'WHAT YR WAS S FIRST TOLD ABOUT HRTA'
      ATTFLAG  = 'HRTA YR IS BEFORE IFUI YR'
      SINCEART = 'HAS S HAD ADDNL HRTA SINCE THEN'
      ATTKYR1  = 'YEAR OF FIRST ADDITIONAL ATTACK'
      ATTKYR2  = 'YEAR OF SECOND ADDITIONAL ATTACK'
      ATTKYR3  = 'YEAR OF THIRD ADDITIONAL ATTACK'
      ATTKYR4  = 'YEAR OF FOURTH ADDITIONAL ATTACK'
      ATTFL2_1 = 'FIRST ADDITIONAL ATTACK FLAG'
      ATTFL2_2 = 'SECOND ADDITIONAL ATTACK FLAG'
      ATTFL2_3 = 'THIRD ADDITIONAL ATTACK FLAG'
      ATTFL2_4 = 'FOURTH ADDITIONAL ATTACK FLAG'
      B23_HOSP = 'WAS S HODP FOR HEART ATTACK'
      B24_HOSP = 'WAS S HOSP FOR ANY OTH HEART COND'
      ADDBYPAS = 'ADDITIONAL BY-PASS SURGERY'
      CORONBYP = 'HAS S EVER HAD CORON BY-PASS SURG'
      B27_BYPS = 'WAS S HOSP FOR CORON BY-PASS SURG'
      PACEMAKR = 'HAD S EVER HAD PACEREPL'
      B29_PACE = 'HAD S BEEN HOSP FOR PACEREPL'
      ADDSTRKE = 'DOCTOR CONFIRMED ADDITIONAL CVA'
      CVA      = 'DOCTOR CONFIRMED CVA'
      STRKYR1  = 'WHAT YR WAS S FIRST TOLD OF STROKE'
      STRKFLAG = 'YEAR IS BEFORE PREVIOUS INTERVIEW'
      ADDISTRK = 'HAD S HAD ADDNL STROKE SINCE THEN'
      STYR2_1  = 'YEAR OF FIRST ADDITIONAL STROKE'
      STYR2_2  = 'YEAR OF SECOND ADDITIONAL STROKE'
      STFL2_1  = 'FIRST ADDITIONAL STROKE FLAG'
      STFL2_2  = 'SECOND ADDITIONAL STROKE FLAG'
      B35_HOSP = 'WAS S HOSPITALIZED FOR A STROKE'
      STRARMLG = 'WEAK ARM AND LEG DUE TO STROKE'
      STRWALK  = 'TROUBLE WALKING DUE TO STROKE'
      STRTALK  = 'TROUBLE TALKING DUE TO STROKE'
      STRTRBLE = 'OTHER TROUBLE DUE TO STROKE'
      CHECK1   = 'CAN PROXY COMPLETE SECTION B'
      DIABMED  = 'S TAKING MEDICATION FOR DIABETES'
      SUGRDIAB = 'DOCTOR CONFIRMED DIABETES'
      DIABYR1  = 'YEAR FIRST TOLD OF DIABETES'
      DIABFLAG = 'DIAB YR IS BEFORE IFUI YR'
      INSLNDB  = 'IS S TAKING INSULIN INJ FOR DIAB'
      ORALDB   = 'IS S TAKING ORAL MEDICATION FOR DIAB'
      B42_HOSP = 'WAS S HOSPITALIZED FOR DIABETES'
      HIGHBLCH = 'DID DR TELL S HAS HIGH BLD CHOLEST'
      BLCHMED  = 'MEDICINE'
      BLCHWIGT = 'WEIGHT'
      BLCHFTFD = 'FAT FOODS'
      BLCHCHFD = 'HIGH CHOLESTEROL FOODS'
      BLCHEXER = 'EXERCISE'
      CHMEDLW  = 'MEDICINE'
      CHWIGTLW = 'WEIGHT'
      CHFTFDLW = 'HIGH FAT FOODS'
      CHCHFDLW = 'HIGH CHOLESTEROL FOODS'
      CHEXERLW = 'EXERCISING'
      HBPMEDIC = 'HAS DR PRESCRIBED MEDICINE FOR HBP'
      HYPER    = 'DOCTOR CONFIRMED HYPERTENSION'
      HBPYEAR1 = 'WHAT YEAR WAS S FIRST TOLD ABOUT HBP'
      HIBPFLAG = 'YEAR ENTERED IS BEFORE PREVIOUS INT DATE'
      PRESCMED = 'HAS DR PRESCRIBED MEDICINE FOR HBP'
      MEDREGLR = 'DOES S TAKE MEDICINE CURRENTLY'
      HGBLWIGT = 'CONTROL WEIGHT'
      HGBLSALT = 'CUT DOWN SALT OR SODIUM'
      HGBLEXER = 'INCREASE EXERCISE'
      HBWIGTLW = 'CURRENTLY CONTROL WEIGHT'
      HBSALTLW = 'CURRENTLY CUT DOWN SALT AND SODIUM'
      HBEXERLW = 'CURRENTLY EXERCISE'
      B48_HIGH = 'WAS S HOSPITALIZED FOR HBP'
      BRCANYR  = 'YEAR TOLD HAD BREAST CANCER'
      CANCTYPE = 'HAS S HAD ANY OTHER CANCER'
      CANCRSRT = 'DOCTOR CONFIRMED CANCER OF ANY SORT'
      B52_CANC = 'WAS S HOSPITALIZED FOR ANY CANC COND'
      CANCCNT  = 'NUMBER OF CANCER SITES/TYPES S HAD'
      CHECK2   = 'CAN PROXY COMPLETE SECTION B'
      FRACHIP  = 'HAS S HAD ADDITIONAL FRACTURED HIP'
      BRKNHIP  = 'DOCTOR CONFIRMED FRACTURED HIP'
      HIPYEAR1 = 'WHAT YR WAS S FIRST TOLD OF FRAC HIP'
      HIPFLAG  = 'FRAC HIP YR IS BEFORE IFUI YR'
      ANTHRHIP = 'ADDITIONAL FRACTURED HIP'
      HIPYR2_1 = 'YEAR OF FIRST ADDTL HIP FRACTURE'
      HIPYR2_2 = 'YEAR OF SECOND ADDTL HIP FRACTURE'
      HIPYR2_3 = 'YEAR OF THIRD ADDTL HIP FRACTURE'
      HIPYR2_4 = 'YEAR OF FOURTH ADDTL HIP FRACTURE'
      HYRFL2_1 = 'FIRST ADDTL HIP FRACTURE FLAG'
      HYRFL2_2 = 'SECOND ADDTL HIP FRACTURE FLAG'
      HYRFL2_3 = 'THIRD ADDTL HIP FRACTURE FLAG'
      HYRFL2_4 = 'FOURTH ADDTL HIP FRACTURE FLAG'
      B61_HOSP = 'HOSPITALIZED FOR FRACTURED HIP'
      OSTEOPOR = 'S EVER HAVE OSTEOPOROSIS'
      OSTEOYR  = 'R TOLD OSTEOPOROSIS'
      ADBKWRST = 'ADDITIONAL BROKEN WRIST'
      BRKNWRST = 'DID S HAVE BROKEN WRIST'
      WRSTYR1  = 'YEAR OF FIRST ADDTL BROKEN WRIST'
      WRSTYR2  = 'YEAR OF SECOND ADDTL BROKEN WRIST'
      WRSTYR3  = 'YEAR OF THIRD ADDTL BORKEN WRIST'
      WRSTYR4  = 'YEAR OF FOURTH ADDTL BROKEN WRIST'
      FALLS    = 'ANY FALLS'
      NUMFALLS = 'NUMBER OF FALLS'
      FALLBKBN = 'BROKEN BONE FROM FALL'
      FALLHEAD = 'HEAD INJURY FROM FALL'
      FALLMEDC = 'MEDICAL HELP FROM FALL'
      B70_FALL = 'HOSPITALIZED FOR FALL'
      B71_FLU  = 'HOSPITALIZED FOR PNEUMONIA'
      KIDNYST  = 'ADDITIONAL KIDNEY DISEASE'
      EVERKDNY = 'EVER HAD A KIDNEY DISEASE'
      YRTELKID = 'YR FIRST TOLD OF KIDNEY DISEASE'
      KIDNEYFG = 'YR ENTERED IS BEFORE PREVIOUS INT DATE'
      DOCKID   = 'EVER HAD KIDNEY INFECTION'
      FRSTOLDK = 'YR FIRST TOLD HAD KIDNEY INFECTION'
      B74_HOSP = 'HOSPITALIZED FOR KIDNEY DISEASE'
      SURGCATR = 'ADDITIONAL CATARACT SURGERY'
      EVERCATR = 'EVER HAD CATARACTS'
      CATRSURG = 'EVER HAVE CATARACT SURGERY'
      YRCATR1  = 'YEAR OF FIRST CATARACT SURGERY'
      YRCATR2  = 'YEAR OF SECOND CATARACT SURGERY'
      CATFLAG1 = 'FIRST CATARACT SURGERY FLAG'
      CATFLAG2 = 'SECOND CATARACT SURGERY FLAG'
      B79_HOSP = 'HOSPITALIZED FOR CATARACT SURG'
      VASECTMY = 'EVER HAD VASECTOMY'
      AGEVASEC = 'AGE HAD VASECTOMY'
      B83_HOSP = 'HOSPITALIZED FOR ANY OTHER REASON'
      FACIL    = 'EVER STAYED AT A FACILITY'
      RESTCNT  = 'NUMBER OF REST SEGMENTS'
      HEALTH   = 'HEALTH CHANGES DURING LAST 12 MONTHS'
      PREVMNHT = 'HLTH CHANGE MO BEFORE NH OR DEATH'
      PREVYRHT = 'HLTH CHANGE YR BEFORE NH OR DEATH'
      SUBDIEHN = 'DIED IN HOSPITAL OR NURSING HOME'
      DTHCAUSE = 'CAUSE OF DEATH'
      SUBJCOND = 'DOCTOR CONFIRMED CAUSE OF DEATH'
      STAYBED  = 'STAY IN BED MOST OF DAY'
      GRLNGTHB = 'TIME PERIOD S WAS BEDRIDDEN'
      LNGTHBED = 'NUMBER OF MONTHS/YEARS BEDRIDDEN'
      C2UNIT   = 'TIME UNIT (MONTHS OR YEARS)'
      USELIMBS = 'PROBLEM THAT PREVENTS USE OF LIMB/S'
      PARALMB  = 'PARALYSIS OF LIMB/S'
      AMPUTLMB = 'AMPUTATION OF LIMB/S'
      ARTHLMB  = 'SEVERE ARTHRITIS OF LIMB/S'
      OTHLMB   = 'OTHER REASON PREVENTS USE OF LIMB/S'
      LIMBOTH1 = 'OTHER REASON'
      PARARUL  = 'PARALYSIS OF RIGHT ARM/HAND'
      PARALUL  = 'PARALYSIS OF LEFT ARM/HAND'
      PARARLL  = 'PAPALYSIS OF RIGHT LEG/FOOT'
      PARALLL  = 'PAPALYSIS OF LEFT LEG/FOOT'
      AMPUTRUL = 'AMPUTATION OF RIGHT ARM/HAND'
      AMPUTLUL = 'AMPUTATION OF LEFT ARM/HAND'
      AMPUTRLL = 'AMPUTATION OF RIGHT LEG/FOOT'
      AMPUTLLL = 'AMPUTATION OF LEFT LEG/FOOT'
      OTLMBRUL = 'INVOLVEMENT OF RIGHT ARM/HAND'
      OTLMBLUL = 'INVOLVEMENT OF LEFT ARM/HAND'
      OTLMBRLL = 'INVOLVEMENT OF RIGHT LEG/FOOT'
      OTLMBLLL = 'INVOLVEMENT OF LEFT LEG/FOOT'
      LIM_CONT = 'ACTIVITIES QUESTIONS DETERMINATOR'
      USEEQUIP = 'DOES S USE SPECIAL EQUIP'
      SPBATH   = 'DOES S USE DEVICES IN BATH'
      CANE     = 'DOES S USE CANE'
      ARTLIMBS = 'DOES S USE ARTIFICIAL LIMB'
      WALKER   = 'DOES S USE WALKER OR CRUTCHES'
      WHEELCHR = 'DOES S USE WHEELCHAIR'
      DEVICES  = 'DOES S USE DEVICES FOR DRESSING'
      SPCHAIR  = 'DOES S USE SPECIAL COMMODE'
      EATDEV   = 'DOES S USE EATING DEVICES'
      CFREQ    = 'ACTIVITIES QUESTIONS DETERMINATOR'
      C10A     = 'CAACTIV1!'
      C10B     = 'DIFFCLTY1!'
      C10C     = 'HELPPRSN1!'
      C10D     = 'HELPAID1!'
      C10E     = 'HELPDIFF1!'
      C11A     = 'CAACTIV2!'
      C11B     = 'DIFFCLTY2!'
      C11C     = 'HELPPRSN2!'
      C11D     = 'HELPAID2!'
      C11E     = 'HELPDIFF2!'
      C12A     = 'CAACTIV3!'
      C12B     = 'DIFFCLTY3!'
      C12C     = 'HELPPRSN3!'
      C12D     = 'HELPAID3!'
      C12E     = 'HELPDIFF3!'
      C13A     = 'CAACTIV4!'
      C13B     = 'DIFFCLTY4!'
      C13C     = 'HELPPRSN4!'
      C14A     = 'CAACTIV5!'
      C14B     = 'DIFFCLTY5!'
      C14C     = 'HELPPRSN5!'
      C15A     = 'CAACTIV6!'
      C15B     = 'DIFFCLTY6!'
      C15C     = 'HELPPRSN6!'
      C16A     = 'CAACTIV7!'
      C16B     = 'DIFFCLTY7!'
      C16C     = 'HELPPRSN7!'
      C17A     = 'CAACTIV8!'
      C17B     = 'DIFFCLTY8!'
      C17C     = 'HELPPRSN8!'
      C17D     = 'DIFFCLTY8!'
      C17E     = 'HELPDIFF8!'
      C18A     = 'CAACTIV9!'
      C18B     = 'DIFFCLTY9!'
      C18C     = 'HELPPRSN9!'
      C18D     = 'HELPAID9!'
      C18E     = 'HELPDIFF9!'
      C19A     = 'CAACTIV10!'
      C19B     = 'DIFFCLTY10!'
      C19C     = 'HELPPRSN10!'
      C19D     = 'HELPAID10!'
      C19E     = 'HEPLDIFF10!'
      C20A     = 'CAACTIV11!'
      C20B     = 'DIFFCLTY11!'
      C20C     = 'HELPPRSN11!'
      C20D     = 'HELPAID11!'
      C20E     = 'HELPDIFF11!'
      C21A     = 'CAACTIV12!'
      C21B     = 'DIFFCLTY12!'
      C21C     = 'HELPPRSN12!'
      C22A     = 'CAAVTIV13!'
      C22B     = 'DIFFCLTY13!'
      C22C     = 'HELPPRSN13!'
      C22D     = 'HELPAID13!'
      C22E     = 'HELPDIFF13!'
      C23A     = 'CAACTIV14!'
      C23B     = 'DIFFICLTY14!'
      C23C     = 'HELPPRSN14!'
      C24A     = 'CAACTIV15!'
      C24B     = 'DIFFCLTY15!'
      C24C     = 'HELPPRSN15!'
      C24D     = 'HELPAID15!'
      C24E     = 'HELPDIFF15!'
      C25A     = 'CAACTIV16!'
      C25B     = 'DIFFCLTY16!'
      C25C     = 'HELPPRSN16!'
      C25D     = 'HELPAID16!'
      C25E     = 'HELPDIFF16!'
      C26A     = 'CAACTIV17!'
      C26B     = 'DIFFCLTY17!'
      C26C     = 'HELPPRSN17!'
      C26D     = 'HELPAID17!'
      C26E     = 'HELPDIFF17!'
      C27A     = 'CAACTIV18!'
      C27B     = 'DIFFCLTY18!'
      C27C     = 'HELPPRSN18!'
      C28A     = 'CAACTIV19!'
      C28B     = 'DIFFCLTY19!'
      C28C     = 'HELPPRSN19!'
      C28D     = 'HELPAID19!'
      C28E     = 'HELPDIFF19!'
      C29A     = 'CAACTIV20!'
      C29B     = 'DIFFCLTY20!'
      C29C     = 'HELPPRSN20!'
      C30A     = 'CAACTIV21!'
      C30B     = 'DIFFCLTY21!'
      C30C     = 'HELPPRSN21!'
      C31A     = 'CAACTIV22!'
      C31B     = 'DIFFCLTY22!'
      C31C     = 'HELPPRSN22!'
      C32A     = 'CAACTIV23!'
      C32B     = 'DIFFCLTY23!'
      C32C     = 'HELPPRSN23!'
      RESPC    = 'ANOTHER PERSON TO ANSWER SECTION C'
      PRXSMDRD = 'PROXY CAN ANSWER SECTION D'
      SMOKE100 = 'EVER SMOKE 100 CIGARETTES A DAY'
      SMOKENOW = 'SMOKE CIGARETTES NOW'
      SMKPERDY = 'HOW MANY CIGARETTES SMOKED PER DAY'
      YRSSMOKE = 'NUMBER OF YEARS SMOKED CIGARETTES'
      GRMONTHS = 'WHEN DID S STOP SMOKING CIGARETTES'
      MONTHSTP = 'MONTH STOPPED SMOKING CIGARETTES'
      YEARSTOP = 'YEAR STOPPED SMOKING CIGARETTES'
      NUMBSMOK = 'NUMBER OF CIGARETTES SMOKED A DAY'
      DIDSMOKE = 'NUMBER OF YEARS SMOKED CIGARETTES'
      CSMKNOW  = 'DOES S SMOKE CIGARETTES NOW'
      CSMKPRDY = 'HOW MANY CIGARETTES SMOKED PER DAY'
      GRNCSMKM = 'WHEN S LAST STOP SMOKING CIGARETTES'
      NCSMKMO  = 'MONTH S STOPPED SMOKING'
      NCSMKYR  = 'YEAR S STOPPED SMOKING'
      DRINKYR  = 'IN THE PAST YEAR, HAD ONE DRINK'
      GROFTNBE = 'HOW OFTEN S DRINK BEER IN PAST YR'
      OFTNBEER = 'ON AVERAGE HOW OFTEN DRINKS BEER'
      WKMOBEER = 'TIME UNIT,BEER (WEEK OR MONTH)'
      NUMBBEER = 'NUMBER OF CANS OF BEER'
      GROFTNWI = 'HOW OFTEN S DRINK WINE IN PAST YR'
      OFTNWINE = 'ON AVERAGE HOW OFTEN DRINKS WINE'
      WKMOWINE = 'TIME UNIT, WINE (WEEK OR MONTH)'
      NUMBWINE = 'NUMBER OF GLASSES OF WINE'
      GROFTNLI = 'HOW OFTEN S DRINK LIQ&NUM OF SHOTS DAILY'
      OFTNLIQ  = 'ON AVERAGE HOW OFTEN DRINKS LIQUOR'
      WKMOLIQ  = 'TIME UNIT, LIQ (WEEK OR MONTH)'
      NUMBSHOT = 'NUMBER OF SHOTS OF LIQUOR'
      EXERPROG = 'DOES S EXERCISE REGULARLY'
      GRE2NUM  = 'MOS/YRS S EXERCISED/PLAYED SPORTS REG'
      E2NUM    = 'NUMBER OF MOS OR YRS REG EXERCISE'
      E2UNIT   = 'TIME UNIT REG EXERCISE (MONTH OR YR)'
      GRE3NUM  = 'HOW OFTEN ACTIVE EXERCISE/SPORTS'
      E3NUM    = 'HOW OFTEN DOES S EXERCISE'
      E3UNIT   = 'TIME UNIT EXERCISE (MONTH OR YR)'
      SPORTTIM = 'HOW MUCH TIME EXERCISE'
      GRE5NUM  = 'HOW OFTEN LIGHT PHYSICAL ACTIVITY'
      E5NUM    = 'HOW OFTEN LIGHT EXERCISE'
      E5UNIT   = 'TIME UNIT LIGHT EXERCISE (MO OR YR)'
      ACTVTIM  = 'HOW MUCH TIME LIGHT EXERCISE'
      WHTCOMPR = 'COMPARE CURRENT WEIGHT WITH 12 MO AGO'
      WEIGHNOW = 'PRESENT WEIGHT'
      GRSDIMEN = 'ADDITIONAL QUESTIONS ON S WEIGHT'
      SDIMENSN = 'SKINNY OR HEAVY WHEN YOUNG'
      SHEIGHT  = 'SHORT OR TALL WHEN YOUNG'
      SWGHT25  = 'USUAL WEIGHT AT AGE 25'
      SWGHT40  = 'USUAL WEIGHT AT AGE 40'
      SWGHT65  = 'USUAL WEIGHT AT AGE 65'
      WREYEGLS = 'WEAR EYEGLASSES OR CONCTACTS'
      SEESTR   = 'SEE FRIEND ACROSS STREET'
      SEEPRINT = 'SEE LETTERS IN ORDINARY PRINT'
      HEARAID  = 'EVER WORN A HEARING AID'
      HEARNORM = 'HEAR NORMAL VOICE ACROSS ROOM'
      WOHRGAID = 'HEAR NORMALLY WITHOUT HEARING AID'
      PRXPGMD  = 'PROXY CAN ANSWER SECTION G'
      EVERPREG = 'EVER PREGNANT'
      PREGNOW1 = 'IS S PREGNANT NOW'
      FRSTBRTH = 'AGE WHEN FIRST CHILD WAS BORN'
      SINCPREG = 'PREGNANT SINCE LAST INT'
      PREGNOW2 = 'IS S PREGNANT NOW'
      LASTBRTH = 'AGE WHEN LAST CHILD WAS BORN'
      LIVEBRTH = 'NUMBER OF LIVE BIRTHS'
      MISCARAG = 'EVER MISCARRIED'
      NUMMISS  = 'NUMBER OF MISCARRAIGES'
      HAVEWOMB = 'DOES S HAVE UTERUS'
      AGEREMVD = 'AGE WHEN UTERUS REMOVED'
      BOTHOVRY = 'DOES S HAVE BOTH OVARIES'
      ONEOVRY  = 'DOES S HAVE ONE OVARY'
      REMVOVRY = 'AGE WHEN LAST OVARY REMOVED'
      HAVPERD  = 'IS S STILL HAVING PERIODS'
      AGEPERD  = 'AGE WHEN HAD LAST PERIOD'
      PERDREG  = 'REGULAR PERIODS'
      CHNGLIFE = 'WHY IRREGULAR'
      HORMONE  = 'HORMONE PILLS TAKEN'
      AGEHPILL = 'AGE LAST TOOK HORMONE PILLS'
      GRG20UNI = 'LONGEST PRD OF TIME S CONT. TOOK HP'
      G20UNITA = 'TIME TOOK H PILLS CONTINUOUSLY'
      HPIL1MOL = 'NUM OF MONTHS CONTINUOUSLY TOOK HP'
      HPIL1YRL = 'NUM OF YEARS CONTINUOUSLY TOOK HP'
      G20ATOT  = 'TOTAL NUMBER OF MONTHS'
      GRG20    = 'YRS/MOS DID S ACTUALLY USE HORMONE PILLS'
      G20UNITB = 'TIME H PILLS ACTUALLY TAKEN'
      HPIL1MOT = 'TOTAL MONTHS TOOK HORMONE PILLS'
      HPIL1YRT = 'TOTAL YRS TOOK HORMONE PILLS'
      G20BTOT  = 'TOTAL NUMBER OF MONTHS'
      PILLCHNG = 'EVER TAKE HORMONE PILLS'
      GRG22UNI = 'TIME PERIOD S CONT. TOOK HORMONE PILLS'
      G22UNITA = 'TIME TOOK H PILLS CONTINUOUSLY'
      HPIL2MOL = 'MONTHS CONINUOUSLY TOOK HORMONE PIL'
      HPIL2YRL = 'YRS CONTINUOUSLY TOOK HORMONE PILLS'
      G22ATOT  = 'TOTAL NUMBER OF MONTHS'
      GRG22UNB = 'YRS OR MOS S ACTUALLY USED HORMONE PILLS'
      G22UNITB = 'TIME H PILLS ACTUALLY TAKEN'
      HPIL2MOT = 'TOTAL MONTHS TOOK HORMONE PILLS'
      HPIL2YRT = 'TOTAL YRS TOOK HORMONE PILLS'
      G22BTOT  = 'TOTAL NUMBER OF MONTHS'
      CURTAKHM = 'CURRENTLY TAKING HORMONE PILLS'
      COLORPIL = 'WHAT COLOR PILL'
      GRUNIT25 = 'PRD OF TIME S TOOK SAME COLOR PILL'
      UNIT25   = 'TIME UNIT'
      LONGCOLR = 'HOW LONG TAKEN THIS COLOR PILL'
      PROVERA  = 'DOES S TAKE PROVERA'
      CURPROV  = 'CURRENTLY TAKING PROVERA'
      GRUNIT28 = 'PRD OF TIME S TOOK PROGESTIN (PROV)'
      UNIT28   = 'TIME PERIOD'
      LONGPIL2 = 'HOW LONG TAKEN PROVERA'
      BRTHPILL = 'BIRTH CONTROL PILLS TAKEN'
      AGELASTP = 'AGE LAST TOOK BIRTH CONTROL PILLS'
      GRG31UNI = 'LONGEST PERIOD OF TIME S CONT TOOK BCP'
      G31UNITA = 'TIME TOOK BC PILLS CONTINUOUSLY'
      BPIL1MOL = 'MONTHS CONT. TOOK BCP'
      BPIL1YRL = 'YEARS CONT. TOOK BCP'
      G31ATOT  = 'TOTAL NUMBER OF MONTHS'
      GRG31UNB = 'YRS OR MOS S ACTUALLY USED BCP'
      G31UNITB = 'TIME BC PILLS ACTUALLY TAKEN'
      BPIL1MOT = 'TOTAL MONTHS TOOK BCP'
      BPIL1YRT = 'TOTAL YEARS TOOK BCP'
      G31BTOT  = 'TOTAL NUMBER OF MONTHS'
      BRTHPIL2 = 'EVER TOOK BIRTH CONTROL PILLS'
      AGEFRSTP = 'AGE FIRST TOOK BIRTH CONTROL PILLS'
      CURPILL  = 'CURRENTLY TAKING BIRTH CONTROL PILLS'
      AGELSTP2 = 'AGE LAST TOOK BIRTH CONTROL PILLS'
      GRG36UNA = 'LONGEST PRD OF TIME S CONT TOOK BCP'
      G36UNITA = 'TIME TOOK BC PILLS CONTINUOUSLY'
      BPIL2MOL = 'MO CONT TOOK BIRTH CONTROL PILLS'
      BPIL2YRL = 'YRS CONT TOOK BIRTH CONTROL PILL'
      G36ATOT  = 'TOTAL NUMBER OF MONTHS'
      GRG36UNB = 'YEARS OR MOS S ACTUALLY USED BCP'
      G36UNITB = 'TIME BC PILLS ACTUALLY TAKEN'
      BPIL2MOT = 'TOTAL MON TOOK BIRTH CONTROL PILLS'
      BPIL2YRT = 'TOTAL YRS TOOK BIRTH CONTROL PILLS'
      G36BTOT  = 'TOTAL NUMBER OF MONTHS'
      GRG37UNI = 'YRS OR MOS S USE BCP BEFORE 25'
      G37UNIT  = 'TIME UNIT (YRS & MOS) USE BCP BFR 25'
      BPIL25MO = 'TOTAL MONTHS TOOK BIRTH CONTROL PILL'
      BPIL25YR = 'YRS TOOK BCP BEFORE 25'
      BEFCHILD = 'BCP BEFORE FIRST CHILD'
      GRG39UNI = 'YRS OR MOS FRST CHILD WAS BORN S USE BCP'
      G39UNIT  = 'TIME UNIT USED BCP BFR FIRST BIRTH'
      BPILBCMO = 'MONTHS TOOK BCP BEFORE FIRST CHILD'
      BPILBCYR = 'YRS TOOK BCP BEFORE FIRST CHILD'
      TUBETYD  = 'EVER HAD TUBES TIED'
      AGETUBTY = 'AGE TUBES TIED'
      CALCIUM  = 'EVER TOOK CALCIUM'
      GRG43UNI = 'PERIOD OF TIME S TOOK CALCIUM REG'
      UNIT43   = 'TIME UNIT'
      LONGCALC = 'HOW LONG TOOK CALCIUM'
      PAPTEST  = 'EVER HAD PAP TEST'
      LONGPAP  = 'HOW LONG SINCE PAP TEST (YRS)'
      MANYPAP5 = 'HOW MANY PAP TESTS IN LAST 5 YRS'
      BRSTEXAM = 'DR EVER EXAMINED BREASTS'
      NUMBRST5 = 'NUM OF EXAMS IN LAST 5 YRS'
      LONGBRST = 'HOW LONG SINCE BREAST EXAM (YRS)'
      EXAMSELF = 'KNOW HOW TO SELF-EXAM BREASTS'
      EVEREXAM = 'HAS S EXAMINED BREASTS'
      OFTNEXAM = 'HOW OFTEN EXAM BREASTS A YEAR'
      MAMMO    = 'EVER HAD A MAMMOGRAM'
      NUMMAMO5 = 'NUM TIMES HAD MAMMOGRAM IN LST 5 YRS'
      LASTMAMO = 'WHEN DID S HAVE LAST MAMMOGRAM'
      MEDICARE = 'IS S COVERED BY MEDICARE'
      HHCF     = 'WERE THERE HOSPTLIZATIONS ON HHCF CHART'
      RELAPRX1 = 'R RELATIONSHIP TO S'
      SUBAST   = 'DID SUBJ RECEIVE ASSISTANCE W/INTERVW'
      NUMAST   = 'NUMBER OF ASSISTANTS'
      AST1REL  = '1ST ASSISTANT RELATIONSHIP TO SUBJ'
      PRIMAST  = 'WAS SUBJECT OR ASST PRIMARY RESPONDT'
      GRKHEAR  = 'REASONS FOR HELP FROM ASSISTANT OR PROXY'
      KHEAR    = 'HEARING REASON FOR HELP'
      KSPEECH  = 'SPEECH REASON FOR HELP'
      KLANGU   = 'LANGUAGE REASON FOR HELP'
      KMEMRY   = 'MEMORY, SENILITY REASON FOR HELP'
      KINSTIT  = 'INSTITUTIONALIZATION REASON FOR HELP'
      KALZH    = 'ALZHEIMER REASON FOR HELP'
      KOTHMENT = 'OTH MENTAL CONDITION REASON FOR HELP'
      KOTHPHY  = 'OTHR PHYSICAL ILLNESS REASON FOR HELP'
      KOTHHEAL = 'OTHER NON-HEALTH REASON FOR HELP'
      KOTHER   = 'OTHER REASON FOR HELP'
      INFOSATS = 'INFO FROM SUBJECT/PROXY SATISFACTORY'
      SUBAWARE = 'DESCRIBE SUBJECT AWARENESS LEVEL'
      QHELDATT = 'R ATTENTION HELD'
      QUPSTDEP = 'R UPSET OR DEPRESSED'
      QBORING  = 'R BORED OR UNINTERESTED'
      RCAPABLE = 'R INTELLECTUALLY CAPABLE'
      RACCURTE = 'R ANSWERS REASONABLY ACCURATE'
      RUNDESST = 'R UNDERSTOOD THE QUESTIONS'
      BADSECT  = 'WAS THERE AN UPSETTING SECTION'
      RHRDHRNG = 'R HARD OF HEARING'
      QINTSPAN = 'INTERVIEW CONDUCTED IN SPANISH'
      GRCANC1  = 'TYPES OF CA REPORTED FOR S BY R'
      CANCNUM1 = 'FREQUENCY COUNT FLAG'
      CACRLOC1 = 'WHERE WAS CANCER/WHAT TYPE WAS IT'
      IC9CANC1 = 'ICD9 CODE FOR CANCER'
      ANYCANC1 = 'ANY OTHER TYPES OF CANCER'
      TODCANC1 = 'YEAR S FIRST TOLD ABOUT CANCER'
      CANCFL1  = 'CA YR IS BEFORE IFUI YR'
      B5_HOSP1 = 'WAS S HOSPITALIZED FOR CANCER'
      CANCNUM2 = 'FREQUENCY COUNT FLAG'
      CACRLOC2 = 'WHERE WAS CANCER/WHAT TYPE WAS IT'
      IC9CANC2 = 'ICD9 CODE FOR CANCER'
      ANYCANC2 = 'ANY OTHER TYPES OF CANCER'
      TODCANC2 = 'YEAR S FIRST TOLD ABOUT CANCER'
      CANCFL2  = 'CA YR IS BEFORE IFUI YR'
      B5_HOSP2 = 'WAS S HOSPITALIZED FOR CANCER'
      CANCNUM3 = 'FREQUENCY COUNT FLAG'
      CACRLOC3 = 'WHERE WAS CANCER/WHAT TYPE WAS IT'
      IC9CANC3 = 'ICD9 CODE FOR CANCER'
      ANYCANC3 = 'ANY OTHER TYPES OF CANCER'
      TODCANC3 = 'YEAR S FIRST TOLD ABOUT CANCER'
      CANCFL3  = 'CA YR IS BEFORE IFUI YR'
      B5_HOSP3 = 'WAS S HOSPITALIZED FOR CANCER'
      CANCNUM4 = 'FREQUENCY COUNT FLAG'
      CACRLOC4 = 'WHERE WAS CANCER/WHAT TYPE WAS IT'
      IC9CANC4 = 'ICD9 CODE FOR CANCER'
      ANYCANC4 = 'ANY OTHER TYPES OF CANCER'
      TODCANC4 = 'YEAR S FIRST TOLD ABOUT CANCER'
      CANCFL4  = 'CA YR IS BEFORE IFUI YR'
      B5_HOSP4 = 'WAS S HOSPITALIZED FOR CANCER'
      CANCNUM5 = 'FREQUENCY COUNT FLAG'
      CACRLOC5 = 'WHERE WAS CANCER/WHAT TYPE WAS IT'
      IC9CANC5 = 'ICD9 CODE FOR CANCER'
      ANYCANC5 = 'ANY OTHER TYPES OF CANCER'
      TODCANC5 = 'YEAR S FIRST TOLD ABOUT CANCER'
      CANCFL5  = 'CA YR IS BEFORE IFUI YR'
      B5_HOSP5 = 'WAS S HOSPITALIZED FOR CANCER'
      CANCNUM6 = 'FREQUENCY COUNT FLAG'
      CACRLOC6 = 'WHERE WAS CANCER/WHAT TYPE WAS IT'
      IC9CANC6 = 'ICD9 CODE FOR CANCER'
      ANYCANC6 = 'ANY OTHER TYPES OF CANCER'
      TODCANC6 = 'YEAR S FIRST TOLD ABOUT CANCER'
      CANCFL6  = 'CA YR IS BEFORE IFUI YR'
      B5_HOSP6 = 'WAS S HOSPITALIZED FOR CANCER'
      RESTNUM1 = 'FREQUENCY COUNT FLAG'
      ADSNPLC1 = 'TYPE OF FACILITY'
      ENERFRM1 = 'PLACE FROM WHICH ENTERED FACILITY'
      YERENTR1 = 'YEAR ENTERED FACILITY'
      NUSCARE1 = 'REQUIRED SKILLED NURSING CARE'
      SUGRECP1 = 'RECUPERATING FROM SURGERY'
      NEDHELP1 = 'NEEDED HELP WITH BATH, EAT, DRESS'
      RESPCMD1 = 'REQUIRED MEDICAL OR PHYSICAL THERAPY'
      COFUSED1 = 'TOO CONFUSED TO LIVE INDEPENDENTLY'
      CNDTNM11 = 'FIRST REASON FOR ENTERING NH'
      CNDTNM21 = 'SECOND REASON FOR ENTERING NH'
      CNDTNM31 = 'THIRD REASON FOR ENTERING NH'
      CNDTNM41 = 'FOURTH REASON FOR ENTERING NH'
      CNDTNM51 = 'FIFTH REASON FOR ENTERING NH'
      RECODE11 = 'DID S HAVE ALZHEIMER DISEASE'
      RECODE21 = 'DID S HAVE CANCER'
      RECODE31 = 'DID S HAVE DEPRESSION'
      RECODE41 = 'WAS S FRAIL/OLD'
      RECODE51 = 'DID S HAVE HARDENING OF ARTERIES'
      RECODE61 = 'WAS S INCONTINENT'
      RECODE71 = 'NO MEDICAL CONDITION'
      RECODE81 = 'WAS S SENILE'
      RECODE91 = 'DID S HAVE STROKE'
      REODE101 = 'DID S HAVE ALCOHOLISM'
      REODE111 = 'DID S HAVE ARTHRITIS'
      REODE121 = 'DISRUPTIVE BEHAVIOR'
      REODE131 = 'FRACTURE OTHER THAN HIP'
      REODE141 = 'DID S HAVE HEART ATTACK/OTH HEART COND'
      REODE151 = 'DID S HAVE HIP FRACTURE'
      REODE161 = 'DID S HAVE MENTAL ILLNESS'
      REODE171 = 'DID S HAVE OSTEOPOROSIS'
      REODE181 = 'DID S HAVE PARKINSON DISEASE'
      REODE191 = 'DID S HAVE OTHER-SPECIFIED DISEASE'
      B92NUM1  = 'LENGTH OF STAY'
      B92UNIT1 = 'TIME UNIT (WEEKS, MONTHS OR YEARS)'
      OTADMSN1 = 'ANY OTHER ADMISSIONS'
      RESTNUM2 = 'FREQUENCY COUNT FLAG'
      ADSNPLC2 = 'TYPE OF FACILITY'
      ENERFRM2 = 'PLACE FROM WHICH ENTERED FACILITY'
      YERENTR2 = 'YEAR ENTERED FACILITY'
      NUSCARE2 = 'REQUIRED SKILLED NURSING CARE'
      SUGRECP2 = 'RECUPERATING FROM SURGERY'
      NEDHELP2 = 'NEEDED HELP WITH BATH, EAT, DRESS'
      RESPCMD2 = 'REQUIRED MEDICAL OR PHYSICAL THERAPY'
      COFUSED2 = 'TOO CONFUSED TO LIVE INDEPENDENTLY'
      CNDTNM12 = 'FIRST REASON FOR ENTERING NH'
      CNDTNM22 = 'SECOND REASON FOR ENTERING NH'
      CNDTNM32 = 'THIRD REASON FOR ENTERING NH'
      CNDTNM42 = 'FOURTH REASON FOR ENTERING NH'
      CNDTNM52 = 'FIFTH REASON FOR ENTERING NH'
      RECODE12 = 'DID S HAVE ALZHEIMER DISEASE'
      RECODE22 = 'DID S HAVE CANCER'
      RECODE32 = 'DID S HAVE DEPRESSION'
      RECODE42 = 'WAS S FRAIL/OLD'
      RECODE52 = 'DID S HAVE HARDENING OF ARTERIES'
      RECODE62 = 'WAS S INCONTINENT'
      RECODE72 = 'NO MEDICAL CONDITION'
      RECODE82 = 'WAS S SENILE'
      RECODE92 = 'DID S HAVE STROKE'
      REODE102 = 'DID S HAVE ALCOHOLISM'
      REODE112 = 'DID S HAVE ARTHRITIS'
      REODE122 = 'DISRUPTIVE BEHAVIOR'
      REODE132 = 'FRACTURE OTHER THAN HIP'
      REODE142 = 'DID S HAVE HEART ATTACK/OTH HEART COND'
      REODE152 = 'DID S HAVE HIP FRACTURE'
      REODE162 = 'DID S HAVE MENTAL ILLNESS'
      REODE172 = 'DID S HAVE OSTEOPOROSIS'
      REODE182 = 'DID S HAVE PARKINSON DISEASE'
      REODE192 = 'DID S HAVE OTHER-SPECIFIED DISEASE'
      B92NUM2  = 'LENGTH OF STAY'
      B92UNIT2 = 'TIME UNIT (WEEKS, MONTHS OR YEARS)'
      OTADMSN2 = 'ANY OTHER ADMISSIONS'
      SAMEREA2 = 'SEC. ADMISSION SAME AS FIRST ADMISSION'
      RESTNUM3 = 'FREQUENCY COUNT FLAG'
      ADSNPLC3 = 'TYPE OF FACILITY'
      ENERFRM3 = 'PLACE FROM WHICH ENTERED FACILITY'
      YERENTR3 = 'YEAR ENTERED FACILITY'
      NUSCARE3 = 'REQUIRED SKILLED NURSING CARE'
      SUGRECP3 = 'RECUPERATING FROM SURGERY'
      NEDHELP3 = 'NEEDED HELP WITH BATH, EAT, DRESS'
      RESPCMD3 = 'REQUIRED MEDICAL OR PHYSICAL THERAPY'
      COFUSED3 = 'TOO CONFUSED TO LIVE INDEPENDENTLY'
      CNDTNM13 = 'FIRST REASON FOR ENTERING NH'
      CNDTNM23 = 'SECOND REASON FOR ENTERING NH'
      CNDTNM33 = 'THIRD REASON FOR ENTERING NH'
      CNDTNM43 = 'FOURTH REASON FOR ENTERING NH'
      CNDTNM53 = 'FIFTH REASON FOR ENTERING NH'
      RECODE13 = 'DID S HAVE ALZHEIMER DISEASE'
      RECODE23 = 'DID S HAVE CANCER'
      RECODE33 = 'DID S HAVE DEPRESSION'
      RECODE43 = 'WAS S FRAIL/OLD'
      RECODE53 = 'DID S HAVE HARDENING OF ARTERIES'
      RECODE63 = 'WAS S INCONTINENT'
      RECODE73 = 'NO MEDICAL CONDITION'
      RECODE83 = 'WAS S SENILE'
      RECODE93 = 'DID S HAVE STROKE'
      REODE103 = 'DID S HAVE ALCOHOLISM'
      REODE113 = 'DID S HAVE ARTHRITIS'
      REODE123 = 'DISRUPTIVE BEHAVIOR'
      REODE133 = 'FRACTURE OTHER THAN HIP'
      REODE143 = 'DID S HAVE HEART ATTACK/OTH HEART COND'
      REODE153 = 'DID S HAVE HIP FRACTURE'
      REODE163 = 'DID S HAVE MENTAL ILLNESS'
      REODE173 = 'DID S HAVE OSTEOPOROSIS'
      REODE183 = 'DID S HAVE PARKINSON DISEASE'
      REODE193 = 'DID S HAVE OTHER-SPECIFIED DISEASE'
      B92NUM3  = 'LENGTH OF STAY'
      B92UNIT3 = 'TIME UNIT (WEEKS, MONTHS OR YEARS)'
      OTADMSN3 = 'ANY OTHER ADMISSIONS'
      RESTNUM4 = 'FREQUENCY COUNT FLAG'
      ADSNPLC4 = 'TYPE OF FACILITY'
      ENERFRM4 = 'PLACE FROM WHICH ENTERED FACILITY'
      YERENTR4 = 'YEAR ENTERED FACILITY'
      NUSCARE4 = 'REQUIRED SKILLED NURSING CARE'
      SUGRECP4 = 'RECUPERATING FROM SURGERY'
      NEDHELP4 = 'NEEDED HELP WITH BATH, EAT, DRESS'
      RESPCMD4 = 'REQUIRED MEDICAL OR PHYSICAL THERAPY'
      COFUSED4 = 'TOO CONFUSED TO LIVE INDEPENDENTLY'
      CNDTNM14 = 'FIRST REASON FOR ENTERING NH'
      CNDTNM24 = 'SECOND REASON FOR ENTERING NH'
      CNDTNM34 = 'THIRD REASON FOR ENTERING NH'
      CNDTNM44 = 'FOURTH REASON FOR ENTERING NH'
      CNDTNM54 = 'FIFTH REASON FOR ENTERING NH'
      RECODE14 = 'DID S HAVE ALZHEIMER DISEASE'
      RECODE24 = 'DID S HAVE CANCER'
      RECODE34 = 'DID S HAVE DEPRESSION'
      RECODE44 = 'WAS S FRAIL/OLD'
      RECODE54 = 'DID S HAVE HARDENING OF ARTERIES'
      RECODE64 = 'WAS S INCONTINENT'
      RECODE74 = 'NO MEDICAL CONDITION'
      RECODE84 = 'WAS S SENILE'
      RECODE94 = 'DID S HAVE STROKE'
      REODE104 = 'DID S HAVE ALCOHOLISM'
      REODE114 = 'DID S HAVE ARTHRITIS'
      REODE124 = 'DISRUPTIVE BEHAVIOR'
      REODE134 = 'FRACTURE OTHER THAN HIP'
      REODE144 = 'DID S HAVE HEART ATTACK/OTH HEART COND'
      REODE154 = 'DID S HAVE HIP FRACTURE'
      REODE164 = 'DID S HAVE MENTAL ILLNESS'
      REODE174 = 'DID S HAVE OSTEOPOROSIS'
      REODE184 = 'DID S HAVE PARKINSON DISEASE'
      REODE194 = 'DID S HAVE OTHER-SPECIFIED DISEASE'
      B92NUM4  = 'LENGTH OF STAY'
      B92UNIT4 = 'TIME UNIT (WEEKS, MONTHS OR YEARS)'
      OTADMSN4 = 'ANY OTHER ADMISSIONS'
      RESTNUM5 = 'FREQUENCY COUNT FLAG'
      ADSNPLC5 = 'TYPE OF FACILITY'
      ENERFRM5 = 'PLACE FROM WHICH ENTERED FACILITY'
      YERENTR5 = 'YEAR ENTERED FACILITY'
      NUSCARE5 = 'REQUIRED SKILLED NURSING CARE'
      SUGRECP5 = 'RECUPERATING FROM SURGERY'
      NEDHELP5 = 'NEEDED HELP WITH BATH, EAT, DRESS'
      RESPCMD5 = 'REQUIRED MEDICAL OR PHYSICAL THERAPY'
      COFUSED5 = 'TOO CONFUSED TO LIVE INDEPENDENTLY'
      CNDTNM15 = 'FIRST REASON FOR ENTERING NH'
      CNDTNM25 = 'SECOND REASON FOR ENTERING NH'
      CNDTNM35 = 'THIRD REASON FOR ENTERING NH'
      CNDTNM45 = 'FOURTH REASON FOR ENTERING NH'
      CNDTNM55 = 'FIFTH REASON FOR ENTERING NH'
      RECODE15 = 'DID S HAVE ALZHEIMER DISEASE'
      RECODE25 = 'DID S HAVE CANCER'
      RECODE35 = 'DID S HAVE DEPRESSION'
      RECODE45 = 'WAS S FRAIL/OLD'
      RECODE55 = 'DID S HAVE HARDENING OF ARTERIES'
      RECODE65 = 'WAS S INCONTINENT'
      RECODE75 = 'NO MEDICAL CONDITION'
      RECODE85 = 'WAS S SENILE'
      RECODE95 = 'DID S HAVE STROKE'
      REODE105 = 'DID S HAVE ALCOHOLISM'
      REODE115 = 'DID S HAVE ARTHRITIS'
      REODE125 = 'DISRUPTIVE BEHAVIOR'
      REODE135 = 'FRACTURE OTHER THAN HIP'
      REODE145 = 'DID S HAVE HEART ATTACK/OTH HEART COND'
      REODE155 = 'DID S HAVE HIP FRACTURE'
      REODE165 = 'DID S HAVE MENTAL ILLNESS'
      REODE175 = 'DID S HAVE OSTEOPOROSIS'
      REODE185 = 'DID S HAVE PARKINSON DISEASE'
      REODE195 = 'DID S HAVE OTHER-SPECIFIED DISEASE'
      B92NUM5  = 'LENGTH OF STAY'
      B92UNIT5 = 'TIME UNIT (WEEKS, MONTHS OR YEARS)'
      OTADMSN5 = 'ANY OTHER ADMISSIONS'
      RESTNUM6 = 'FREQUENCY COUNT FLAG'
      ADSNPLC6 = 'TYPE OF FACILITY'
      ENERFRM6 = 'PLACE FROM WHICH ENTERED FACILITY'
      YERENTR6 = 'YEAR ENTERED FACILITY'
      NUSCARE6 = 'REQUIRED SKILLED NURSING CARE'
      SUGRECP6 = 'RECUPERATING FROM SURGERY'
      NEDHELP6 = 'NEEDED HELP WITH BATH, EAT, DRESS'
      RESPCMD6 = 'REQUIRED MEDICAL OR PHYSICAL THERAPY'
      COFUSED6 = 'TOO CONFUSED TO LIVE INDEPENDENTLY'
      CNDTNM16 = 'FIRST REASON FOR ENTERING NH'
      CNDTNM26 = 'SECOND REASON FOR ENTERING NH'
      CNDTNM36 = 'THIRD REASON FOR ENTERING NH'
      CNDTNM46 = 'FOURTH REASON FOR ENTERING NH'
      CNDTNM56 = 'FIFTH REASON FOR ENTERING NH'
      RECODE16 = 'DID S HAVE ALZHEIMER DISEASE'
      RECODE26 = 'DID S HAVE CANCER'
      RECODE36 = 'DID S HAVE DEPRESSION'
      RECODE46 = 'WAS S FRAIL/OLD'
      RECODE56 = 'DID S HAVE HARDENING OF ARTERIES'
      RECODE66 = 'WAS S INCONTINENT'
      RECODE76 = 'NO MEDICAL CONDITION'
      RECODE86 = 'WAS S SENILE'
      RECODE96 = 'DID S HAVE STROKE'
      REODE106 = 'DID S HAVE ALCOHOLISM'
      REODE116 = 'DID S HAVE ARTHRITIS'
      REODE126 = 'DISRUPTIVE BEHAVIOR'
      REODE136 = 'FRACTURE OTHER THAN HIP'
      REODE146 = 'DID S HAVE HEART ATTACK/OTH HEART COND'
      REODE156 = 'DID S HAVE HIP FRACTURE'
      REODE166 = 'DID S HAVE MENTAL ILLNESS'
      REODE176 = 'DID S HAVE OSTEOPOROSIS'
      REODE186 = 'DID S HAVE PARKINSON DISEASE'
      REODE196 = 'DID S HAVE OTHER-SPECIFIED DISEASE'
      B92NUM6  = 'LENGTH OF STAY'
      B92UNIT6 = 'TIME UNIT (WEEKS, MONTHS OR YEARS)'
      OTADMSN6 = 'ANY OTHER ADMISSIONS'
      HCFSR01  = 'ONE STAY RECORD 86 NHEFS-ARTHRITIS'
      HCFSR02  = 'ONE STAY RECORD 86 NHEFS-GOUT'
      HCFSR03  = 'ONE STAY RECORD 86 NHEFS-HEART ATTACK'
      HCFSR04  = 'ONE STAY RECORD 86 NHEFS-HEART COND'
      HCFSR05  = 'ONE STAY 86 NHEFS-CORONARY BYPASS SURG'
      HCFSR06  = 'ONE STAY RECORD 86 NHEFS-PACEMAKER'
      HCFSR08  = 'ONE STAY RECORD 86 NHEFS-STROKE/CVA'
      HCFSR09  = 'ONE STAY RECORD 86 NHEFS-DIABETES'
      HCFSR10  = 'ONE STAY 86 NHEFS-HIGH BLOOD PRESSURE'
      HCFSR11  = 'ONE STAY RECORD 86 NHEFS-SKIN CANCER'
      HCFSR12  = 'ONE STAY RECORD 86 NHEFS-FRACTURED HIP'
      HCFSR13  = 'ONE STAY RECORD 86 NHEFS-OTHER FRAC'
      HCFSR15  = 'ONE STAY RECORD 86 NHEFS-SURGERY'
      HCFSR16  = 'ONE STAY RECORD 86 NHEFS-DO NOT KNOW'
      HCFSR17  = 'ONE STAY 86 NHEFS-NOT ASCERTAINED'
      HCFSR18  = 'ONE STAY 86 NHEFS-TESTS/OBSERVATION/EXAM'
      HCFSR19  = 'ONE STAY 86 NHEFS-DIGESTIVE/ENDOCRINE'
      HCFSR20  = 'ONE STAY 86 NHEFS-RESPIRATORY'
      HCFSR21  = 'ONE STAY RECORD 86 NHEFS-INFECTION'
      HCFSR22  = 'ONE STAY 86 NHEFS-KIDNEY/BLADDER/URINARY'
      HCFSR23  = 'ONE STAY RECORD 86 NHEFS-DEBILITY/PAIN'
      HCFSR24  = 'ONE STAY 86 NHEFS-MALE REPRODUCTIVE COND'
      HCFSR25  = 'ONE STAY 86 NHEFS-MUSCULOSKELETAL/INJURY'
      HCFSR26  = 'ONE STAY RECORD 86 NHEFS-CIRCULATORY'
      HCFSR27  = 'ONE STAY 86 NHEFS-FEMALE REPRODUCTIVE'
      HCFSR28  = 'ONE STAY RECORD 86 NHEFS-MENTAL ILLNESS'
      HCFSR29  = 'ONE STAY RECORD 86 NHEFS-NEUROLOGIC'
      HCFSR30  = 'ONE STAY 86 NHEFS-NUTRITION/DEHYDRATION'
      HCFSR31  = 'ONE STAY 86 NHEFS-BLEEDING/BLOOD DIS'
      HCFSR32  = 'ONE STAY RECORD 86 NHEFS-SKIN CONDITION'
      HCFSR33  = 'ONE STAY 86 NHEFS-CONDITION NOT CODED'
      HCFSR34  = 'ONE STAY 86 NHEFS-NURS HOME ADMISSION'
      HCFSR35  = 'ONE STAY 86 NHEFS-HOSPITALIZED AT DEATH'
      HCFSR36  = 'ONE STAY RECORD 86 NHEFS-EYE DISORDERS'
      HCFSR37  = 'ONE STAY RECORD 86 NHEFS-FALLS'
      CAUSEDTH = 'UNDERLYING CAUSE OF DEATH'
      STRATUM  = 'STRATUM'
      PSU      = 'PSEUDO PRIMARY SAMPLING UNIT'
      SUBSAMPL = 'NHANES I SUBSAMPLE'
      SWGT1    = 'DETAILED SAMPLE PERSONS--LOCATION 1-35'
      SWGT2    = 'ALL SAMPLE PERSONS--LOCATION 1-35'
      SWGT3    = 'DETAILED SAMPLE PERSONS--LOCATION 1-65'
      SWGT4    = 'ALL SAMPLE PERSONS--LOCATION 1-65'
      SWGT5    = 'DETAILED SAMPLE PERSONS--LOCATION 66-100'
      SWGT6    = 'DETAILED SAMPLE PERSONS--LOCATION 1-100'
      ;
run;


/*
Task 7. 
On the NHANES website, save the text file containing the NHANES I Epidemiologic 
Followup Study data set N92int.txt. Copy the SAS input statement from the 
NHANES website and paste it into your SAS program. Create a new SAS data set 
called nhanes.nhefs1992 from N92int.txt. Make sure to drop every variable that 
starts with the word “blank” using the DROP = data set option. Rename the 
sample sequence number variable so that it has the same name in 
nhanes.nhefs1987 and nhanes.nhefs1992.
*/
data nhanes.nhefs1992 (rename = (HANESEQ = SEQNO) drop = blank:);
infile "Z:\Dropbox\UNTHSC Admin and Teaching\Courses\5147-Fall 2014\BACH_EPID 5313\Data\NHANES\N92int.txt";
INPUT 	@1    HANESEQ  $CHAR5.
        @6    BLANK1   $CHAR2.
        @8    LINTSTAT $CHAR2.
        @10   LINTDATE $CHAR6.
        @16   BLANK2   $CHAR1.
        @17   LSSEX    $CHAR2.
        @19   LNDOB    $CHAR6.
        @25   BLANK3   $CHAR2.
        @27   LNURSING $CHAR2.
        @29   LMARITAL $CHAR2.
        @31   LWORKHST $CHAR2.
        @33   LWRKDATE $CHAR4.
        @37   LMOMDEAD $CHAR2.
        @39   LDADDEAD $CHAR2.
        @41   LARTH    $CHAR2.
        @43   LARTHYR  $CHAR2.
        @45   LARTHTYP $CHAR2.
        @47   LARTHXRY $CHAR2.
        @49   LGOUT    $CHAR2.
        @51   LARTGOUT $CHAR2.
        @53   LHATTACK $CHAR2.
        @55   LHRTCOND $CHAR2.
        @57   LCBPSURG $CHAR2.
        @59   LPACEMAK $CHAR2.
        @61   LSTROKE  $CHAR2.
        @63   LDIABETE $CHAR2.
        @65   LHICHOL  $CHAR2.
        @67   LHIGHBP  $CHAR2.
        @69   LHIBPMED $CHAR2.
        @71   LCANCER  $CHAR2.
        @73   LBRSTCAN $CHAR2.
        @75   LBCANCYR $CHAR2.
        @77   LSKNCANC $CHAR2.
        @79   LBROKHIP $CHAR2.
        @81   LBKHIPYR $CHAR2.
        @83   LOSTEO   $CHAR2.
        @85   LBRKWRST $CHAR2.
        @87   LKIDNEY  $CHAR2.
        @89   LUTI     $CHAR2.
        @91   LCATRACT $CHAR2.
        @93   LCATSURG $CHAR2.
        @95   LVASECT  $CHAR2.
        @97   LSMOKER  $CHAR2.
        @99   LWTAGE12 $CHAR2.
        @101  LHTAGE12 $CHAR2.
        @103  LWTAGE25 $CHAR2.
        @105  LWTAGE40 $CHAR2.
        @107  LWTAGE65 $CHAR2.
        @109  LCALCIUM $CHAR2.
        @111  LHEARAID $CHAR2.
        @113  LPREG    $CHAR2.
        @115  LUTERUS  $CHAR2.
        @117  LUTERAGE $CHAR2.
        @119  LOVARIES $CHAR2.
        @121  LONEOVAR $CHAR2.
        @123  LOVARAGE $CHAR2.
        @125  LMENSTAT $CHAR2.
        @127  LPROVERA $CHAR2.
        @129  LHORMONE $CHAR2.
        @131  LHORMAGE $CHAR2.
        @133  LORALCON $CHAR2.
        @135  LAGEOC25 $CHAR2.
        @137  LLENOC25 $CHAR2.
        @139  LLIVEBTH $CHAR2.
        @141  LOCBFBTH $CHAR2.
        @143  LFEMSTER $CHAR2.
        @145  LPAPSMER $CHAR2.
        @147  BLANK3b  $CHAR6.
        @153  LASTSPAN $CHAR2.
        @155  LPHOSP   $CHAR2.
        @157  LNAGE    $CHAR2.
        @159  RSLTDATE $CHAR6.
        @159  RSLTMO   $CHAR2.
        @161  RSLTDY   $CHAR2.
        @163  RSLTYR   $CHAR2.
        @165  GPIDAT87 $CHAR6.
        @165  IDATMM87 $CHAR2.
        @167  IDATDY87 $CHAR2.
        @169  IDATYR87 $CHAR2.
        @171  GPIDAT86 $CHAR6.
        @171  IDATMM86 $CHAR2.
        @173  IDATDY86 $CHAR2.
        @175  IDATYR86 $CHAR2.
        @177  GPIDAT82 $CHAR6.
        @177  IDATMM82 $CHAR2.
        @179  IDATDY82 $CHAR2.
        @181  IDATYR82 $CHAR2.
        @183  GPEXDATE $CHAR6.
        @183  EXAMMON  $CHAR2.
        @185  EXAMDAY  $CHAR2.
        @187  EXAMYEAR $CHAR2.
        @189  MAINRSLT $CHAR2.
        @191  QDIS87   $CHAR2.
        @193  QDIS86   $CHAR2.
        @195  QDIS82   $CHAR2.
        @197  RESPTYPE $CHAR2.
        @199  HCHARFLG $CHAR2.
        @201  QVERSION $CHAR2.
        @203  NAGE     $CHAR3.
        @206  AGE87    $CHAR2.
        @208  AGE86    $CHAR2.
        @210  AGE82    $CHAR2.
        @212  EXAMAGE  $CHAR2.
        @214  TRACSTAT $CHAR2.
        @216  VITLST87 $CHAR2.
        @218  VITLST86 $CHAR2.
        @220  VITLST82 $CHAR2.
        @222  ELIGECF  $CHAR2.
        @224  REVRACE  $CHAR2.
        @226  DCRECD   $CHAR2.
        @228  BLANK4   $CHAR42.
        @270  PROXRELA $CHAR2.
        @272  BLANK5   $CHAR40.
        @312  PROXRELI $CHAR2.
        @314  PROXRELD $CHAR2.
        @316  DAGE     $CHAR2.
        @318  DOD      $CHAR8.
        @318  NEWDODMO $CHAR2.
        @320  NEWDODDA $CHAR2.
        @322  NEWDODYR $CHAR4.
        @326  BLANK6   $CHAR12.
        @338  AGE92    $CHAR2.
        @340  BLANK7   $CHAR9.
        @349  LIVEARRG $CHAR2.
        @351  BLANK8   $CHAR50.
        @401  SDIENRHM $CHAR2.
        @403  PRXLIVWD $CHAR2.
        @405  PRXVISTD $CHAR2.
        @407  NHCONTU  $CHAR2.
        @409  SAMENH   $CHAR2.
        @411  NUMSLIVE $CHAR2.
        @413  BLANK9   $CHAR2.
        @415  SPSEXDIS $CHAR2.
        @417  NUMSPDIS $CHAR2.
        @419  BLANK10  $CHAR2.
        @421  GPLGTHAL $CHAR4.
        @421  LGTHALNE $CHAR2.
        @423  LGTHUNIT $CHAR2.
        @425  NUMSLVED $CHAR2.
        @427  BLANK11  $CHAR2.
        @429  GPLGTHA2 $CHAR4.
        @429  LGTHALN2 $CHAR2.
        @431  LGTHUNT2 $CHAR2.
        @433  MARRSTAT $CHAR2.
        @435  SUBJRACE $CHAR2.
        @437  BLANK12  $CHAR30.
        @467  HISPANIC $CHAR2.
        @469  DOINGMST $CHAR2.
        @471  BLANK13  $CHAR30.
        @501  HRSWKJB1 $CHAR2.
        @503  WORKJOB  $CHAR2.
        @505  HRSWKJB2 $CHAR2.
        @507  EXPTWORK $CHAR2.
        @509  EXFULPAR $CHAR2.
        @511  CUTHOURS $CHAR2.
        @513  YRTOLD   $CHAR2.
        @515  STPJBHEA $CHAR2.
        @517  GPLASTWK $CHAR4.
        @517  MOLASTWK $CHAR2.
        @519  YRLASTWK $CHAR2.
        @521  A22DISF  $CHAR2.
        @523  MOMALIVE $CHAR2.
        @525  MOMAGED  $CHAR3.
        @528  DADALIVE $CHAR2.
        @530  DADAGED  $CHAR3.
        @533  PRXMHQD  $CHAR2.
        @535  GENERAL  $CHAR2.
        @537  JOINTS   $CHAR2.
        @539  DREVRTEL $CHAR2.
        @541  FRSTARTH $CHAR2.
        @543  B4DISF   $CHAR2.
        @545  DRARTHR  $CHAR2.
        @547  OSTEOART $CHAR2.
        @549  RHEUMATD $CHAR2.
        @551  OTHRTYPE $CHAR2.
        @553  BLANK14  $CHAR30.
        @583  XRYJOINT $CHAR2.
        @585  FRSTXRAY $CHAR2.
        @587  BLANK15  $CHAR4.
        @591  LASTXRAY $CHAR2.
        @593  BLANK16  $CHAR2.
        @595  GOUT     $CHAR2.
        @597  SINCGOUT $CHAR2.
        @599  FRSTGOUT $CHAR2.
        @601  B12DISF  $CHAR2.
        @603  BLANK17  $CHAR2.
        @605  MEMGOUT1 $CHAR2.
        @607  BLANK18  $CHAR2.
        @609  LASTGOUT $CHAR2.
        @611  B14DISF  $CHAR2.
        @613  BLANK19  $CHAR2.
        @615  MEMGOUT2 $CHAR2.
        @617  BLANK20  $CHAR4.
        @621  ARTHGOUT $CHAR2.
        @623  HOSPGOUT $CHAR2.
        @625  HEARTATK $CHAR2.
        @627  EVERATT  $CHAR2.
        @629  FIRSTATT $CHAR2.
        @631  B20DISF  $CHAR2.
        @633  SINCEART $CHAR2.
        @635  ATTKYR1  $CHAR2.
        @637  ATTKYR2  $CHAR2.
        @639  ATTKYR3  $CHAR2.
        @641  ATTKYR4  $CHAR2.
        @643  B22DISF1 $CHAR2.
        @645  B22DISF2 $CHAR2.
        @647  B22DISF3 $CHAR2.
        @649  B22DISF4 $CHAR2.
        @651  HOSPHATK $CHAR2.
        @653  HOSPHOTH $CHAR2.
        @655  ADDBYPAS $CHAR2.
        @657  CORONBYP $CHAR2.
        @659  HOSPBYPS $CHAR2.
        @661  PACEMAKR $CHAR2.
        @663  HOSPPACE $CHAR2.
        @665  ADDSTRKE $CHAR2.
        @667  CVA      $CHAR2.
        @669  STRKYR1  $CHAR2.
        @671  B32DISF  $CHAR2.
        @673  ADDISTRK $CHAR2.
        @675  STYR2_1  $CHAR2.
        @677  STYR2_2  $CHAR2.
        @679  B34DISF1 $CHAR2.
        @681  B34DISF2 $CHAR2.
        @683  HOSPSTRK $CHAR2.
        @685  CANRESP1 $CHAR2.
        @687  STRARMLG $CHAR2.
        @689  STRWALK  $CHAR2.
        @691  STRTALK  $CHAR2.
        @693  STRTRBLE $CHAR2.
        @695  BLANK21  $CHAR30.
        @725  DIABMED  $CHAR2.
        @727  SUGRDIAB $CHAR2.
        @729  DIABYR1  $CHAR2.
        @731  B39DISF  $CHAR2.
        @733  INSLNDB  $CHAR2.
        @735  ORALDB   $CHAR2.
        @737  HOSPDIAB $CHAR2.
        @739  HIGHBLCH $CHAR2.
        @741  BLCHNOW  $CHAR2.
        @743  BLCHYR   $CHAR2.
        @745  BLANK22  $CHAR2.
        @747  BLCHMED1 $CHAR2.
        @749  BLCHMED2 $CHAR2.
        @751  HYPER    $CHAR2.
        @753  HBPYEAR1 $CHAR2.
        @755  B49DISF  $CHAR2.
        @757  PRESCMED $CHAR2.
        @759  MEDREGLR $CHAR2.
        @761  HOSPHBP  $CHAR2.
        @763  WGHTCONT $CHAR2.
        @765  WGHTREAS $CHAR2.
        @767  BRCANCER $CHAR2.
        @769  BRCANYR  $CHAR2.
        @771  B56DISF  $CHAR2.
        @773  SKINCANC $CHAR2.
        @775  SKCANMM  $CHAR2.
        @777  SKCANOT  $CHAR2.
        @779  SKCANYR1 $CHAR2.
        @781  B59DISF  $CHAR2.
        @783  HOSPSKN1 $CHAR2.
        @785  SKCANYR2 $CHAR2.
        @787  B61DISF  $CHAR2.
        @789  SKCANNUM $CHAR2.
        @791  HOSPSKN2 $CHAR2.
        @793  CANCTYPE $CHAR2.
        @795  CANCRSRT $CHAR2.
        @797  HOSPCAN1 $CHAR2.
        @799  CANCCNT  $CHAR2.
        @801  OSURCAN  $CHAR2.
        @803  OSURCNT  $CHAR2.
        @805  FHADCANC $CHAR2.
        @807  CRELCNT  $CHAR2.
        @809  HIPYEAR1 $CHAR2.
        @811  B74DISF  $CHAR2.
        @813  FRACHIP  $CHAR2.
        @815  CANRESP2 $CHAR2.
        @817  BRKNHIP  $CHAR2.
        @819  HIPYEAR2 $CHAR2.
        @821  B77DISF  $CHAR2.
        @823  ANTHRHIP $CHAR2.
        @825  HIPYR2_1 $CHAR2.
        @827  HIPYR2_2 $CHAR2.
        @829  HIPYR2_3 $CHAR2.
        @831  HIPYR2_4 $CHAR2.
        @833  B79DISF1 $CHAR2.
        @835  B79DISF2 $CHAR2.
        @837  B79DISF3 $CHAR2.
        @839  B79DISF4 $CHAR2.
        @841  HOSPFRAC $CHAR2.
        @843  OSTEOPOR $CHAR2.
        @845  OSTEOYR  $CHAR2.
        @847  B82DISF  $CHAR2.
        @849  ADBKWRST $CHAR2.
        @851  BRKNWRST $CHAR2.
        @853  WRSTYR1  $CHAR2.
        @855  WRSTYR2  $CHAR2.
        @857  WRSTYR3  $CHAR2.
        @859  WRSTYR4  $CHAR2.
        @861  B85DISF1 $CHAR2.
        @863  B85DISF2 $CHAR2.
        @865  B85DISF3 $CHAR2.
        @867  B85DISF4 $CHAR2.
        @869  FALLS    $CHAR2.
        @871  NUMFALLS $CHAR2.
        @873  FALLBKBN $CHAR2.
        @875  FALLHEAD $CHAR2.
        @877  FALLMEDC $CHAR2.
        @879  HOSPFALL $CHAR2.
        @881  VFALL    $CHAR2.
        @883  HOSPFLU  $CHAR2.
        @885  KIDNYST  $CHAR2.
        @887  EVERKDNY $CHAR2.
        @889  YRTELKID $CHAR2.
        @891  B93DISF  $CHAR2.
        @893  KIDINFEC $CHAR2.
        @895  DOCKID   $CHAR2.
        @897  FRSTOLDK $CHAR2.
        @899  B96DISF  $CHAR2.
        @901  HOSPKIDN $CHAR2.
        @903  HERNIA   $CHAR2.
        @905  HIHERNIA $CHAR2.
        @907  RUPTURE  $CHAR2.
        @909  VENTRAL  $CHAR2.
        @911  UMBIL    $CHAR2.
        @913  OTHRHERN $CHAR2.
        @915  BLANK23  $CHAR30.
        @945  HERNYR1  $CHAR2.
        @947  B100DISF $CHAR2.
        @949  HERNSURG $CHAR2.
        @951  HERNYR_1 $CHAR2.
        @953  HERNYR_2 $CHAR2.
        @955  HERNYR_3 $CHAR2.
        @957  HERNYR_4 $CHAR2.
        @959  B102DIS1 $CHAR2.
        @961  B102DIS2 $CHAR2.
        @963  B102DIS3 $CHAR2.
        @965  B102DIS4 $CHAR2.
        @967  HERNYR2  $CHAR2.
        @969  B103DISF $CHAR2.
        @971  SURGCATR $CHAR2.
        @973  EVERCATR $CHAR2.
        @975  CATRSURG $CHAR2.
        @977  YRCATR1  $CHAR2.
        @979  YRCATR2  $CHAR2.
        @981  B107DIS1 $CHAR2.
        @983  B107DIS2 $CHAR2.
        @985  HOSPCATR $CHAR2.
        @987  VASECTMY $CHAR2.
        @989  AGEVASEC $CHAR2.
        @991  B110DISF $CHAR2.
        @993  HOSPOTHR $CHAR2.
        @995  HOSPCNT  $CHAR2.
        @997  FACIL    $CHAR2.
        @999  RESTCNT  $CHAR2.
        @1001 STAYFAC1 $CHAR2.
        @1003 STAYFAC2 $CHAR2.
        @1005 HEALTH   $CHAR2.
        @1007 PREVMNHT $CHAR2.
        @1009 PREVYRHT $CHAR2.
        @1011 SUBDIENH $CHAR2.
        @1013 DTHCAUSE $CHAR2.
        @1015 SUBJCOND $CHAR2.
        @1017 BLANK24  $CHAR4.
        @1021 CANRANS  $CHAR2.
        @1023 BLANK25  $CHAR2.
        @1025 STAYBED  $CHAR2.
        @1027 GPLNGTHB $CHAR4.
        @1027 LNGTHBED $CHAR2.
        @1029 BEDUNIT  $CHAR2.
        @1031 USELIMBS $CHAR2.
        @1033 PARALMB  $CHAR2.
        @1035 AMPUTLMB $CHAR2.
        @1037 ARTHLMB  $CHAR2.
        @1039 OTHLMB   $CHAR2.
        @1041 BLANK26  $CHAR25.
        @1066 PARARUL  $CHAR2.
        @1068 PARALUL  $CHAR2.
        @1070 PARARLL  $CHAR2.
        @1072 PARALLL  $CHAR2.
        @1074 AMPUTRUL $CHAR2.
        @1076 AMPUTLUL $CHAR2.
        @1078 AMPUTRLL $CHAR2.
        @1080 AMPUTLLL $CHAR2.
        @1082 OTLMBRUL $CHAR2.
        @1084 OTLMBLUL $CHAR2.
        @1086 OTLMBRLL $CHAR2.
        @1088 OTLMBLLL $CHAR2.
        @1090 LIM_CONT $CHAR2.
        @1092 USEEQUIP $CHAR2.
        @1094 SPBATH   $CHAR2.
        @1096 CANE     $CHAR2.
        @1098 ARTLIMBS $CHAR2.
        @1100 WALKER   $CHAR2.
        @1102 WHEELCHR $CHAR2.
        @1104 DEVICES  $CHAR2.
        @1106 SPCHAIR  $CHAR2.
        @1108 EATDEV   $CHAR2.
        @1110 CFREQ    $CHAR2.
        @1112 DRESSA   $CHAR2.
        @1114 DRESSB   $CHAR2.
        @1116 DRESSC   $CHAR2.
        @1118 DRESSD   $CHAR2.
        @1120 DRESSE   $CHAR2.
        @1122 STANDUPA $CHAR2.
        @1124 STANDUPB $CHAR2.
        @1126 STANDUPC $CHAR2.
        @1128 STANDUPD $CHAR2.
        @1130 STANDUPE $CHAR2.
        @1132 INTOBEDA $CHAR2.
        @1134 INTOBEDB $CHAR2.
        @1136 INTOBEDC $CHAR2.
        @1138 INTOBEDD $CHAR2.
        @1140 INTOBEDE $CHAR2.
        @1142 MEALSA   $CHAR2.
        @1144 MEALSB   $CHAR2.
        @1146 MEALSC   $CHAR2.
        @1148 CUTMEATA $CHAR2.
        @1150 CUTMEATB $CHAR2.
        @1152 CUTMEATC $CHAR2.
        @1154 LIFTCUPA $CHAR2.
        @1156 LIFTCUPB $CHAR2.
        @1158 LIFTCUPC $CHAR2.
        @1160 OPNMILKA $CHAR2.
        @1162 OPNMILKB $CHAR2.
        @1164 OPNMILKC $CHAR2.
        @1166 WALKOUTA $CHAR2.
        @1168 WALKOUTB $CHAR2.
        @1170 WALKOUTC $CHAR2.
        @1172 WALKOUTD $CHAR2.
        @1174 WALKOUTE $CHAR2.
        @1176 WALKINA  $CHAR2.
        @1178 WALKINB  $CHAR2.
        @1180 WALKINC  $CHAR2.
        @1182 WALKIND  $CHAR2.
        @1184 WALKINE  $CHAR2.
        @1186 STAIRSA  $CHAR2.
        @1188 STAIRSB  $CHAR2.
        @1190 STAIRSC  $CHAR2.
        @1192 STAIRSD  $CHAR2.
        @1194 STAIRSE  $CHAR2.
        @1196 BATHTUBA $CHAR2.
        @1198 BATHTUBB $CHAR2.
        @1200 BATHTUBC $CHAR2.
        @1202 BATHTUBD $CHAR2.
        @1204 BATHTUBE $CHAR2.
        @1206 WASHBODA $CHAR2.
        @1208 WASHBODB $CHAR2.
        @1210 WASHBODC $CHAR2.
        @1212 TOILETA  $CHAR2.
        @1214 TOILETB  $CHAR2.
        @1216 TOILETC  $CHAR2.
        @1218 TOILETD  $CHAR2.
        @1220 TOILETE  $CHAR2.
        @1222 DOHAIRA  $CHAR2.
        @1224 DOHAIRB  $CHAR2.
        @1226 DOHAIRC  $CHAR2.
        @1228 REACHA   $CHAR2.
        @1230 REACHB   $CHAR2.
        @1232 REACHC   $CHAR2.
        @1234 REACHD   $CHAR2.
        @1236 REACHE   $CHAR2.
        @1238 BENDA    $CHAR2.
        @1240 BENDB    $CHAR2.
        @1242 BENDC    $CHAR2.
        @1244 BENDD    $CHAR2.
        @1246 BENDE    $CHAR2.
        @1248 OPENJARA $CHAR2.
        @1250 OPENJARB $CHAR2.
        @1252 OPENJARC $CHAR2.
        @1254 OPENJARD $CHAR2.
        @1256 OPENJARE $CHAR2.
        @1258 USEPENA  $CHAR2.
        @1260 USEPENB  $CHAR2.
        @1262 USEPENC  $CHAR2.
        @1264 EXITCARA $CHAR2.
        @1266 EXITCARB $CHAR2.
        @1268 EXITCARC $CHAR2.
        @1270 EXITCARD $CHAR2.
        @1272 EXITCARE $CHAR2.
        @1274 ERRANDSA $CHAR2.
        @1276 ERRANDSB $CHAR2.
        @1278 ERRANDSC $CHAR2.
        @1280 LITEJOBA $CHAR2.
        @1282 LITEJOBB $CHAR2.
        @1284 LITEJOBC $CHAR2.
        @1286 LIFTBAGA $CHAR2.
        @1288 LIFTBAGB $CHAR2.
        @1290 LIFTBAGC $CHAR2.
        @1292 HEVYJOBA $CHAR2.
        @1294 HEVYJOBB $CHAR2.
        @1296 HEVYJOBC $CHAR2.
        @1298 PRXSMDRD $CHAR2.
        @1300 SMOKE100 $CHAR2.
        @1302 SMOKENOW $CHAR2.
        @1304 SMKPERDY $CHAR3.
        @1307 YRSSMOKE $CHAR2.
        @1309 GPMONTHS $CHAR4.
        @1309 MONTHSTP $CHAR2.
        @1311 YEARSTOP $CHAR2.
        @1313 NUMBSMOK $CHAR3.
        @1316 DIDSMOKE $CHAR2.
        @1318 CSMKNOW  $CHAR2.
        @1320 CSMKPRDY $CHAR3.
        @1323 GPNCSMKM $CHAR4.
        @1323 NCSMKMO  $CHAR2.
        @1325 NCSMKYR  $CHAR2.
        @1327 D10DISF  $CHAR2.
        @1329 DRINKYR  $CHAR2.
        @1331 OFTNBEER $CHAR2.
        @1333 WKMOBEER $CHAR2.
        @1335 BLANK27  $CHAR1.
        @1336 NUMBBEER $CHAR2.
        @1338 OFTNWINE $CHAR2.
        @1340 WKMOWINE $CHAR2.
        @1342 BLANK28  $CHAR1.
        @1343 NUMBWINE $CHAR2.
        @1345 OFTNLIQ  $CHAR2.
        @1347 VDRINKFG $CHAR2.
        @1349 WKMOLIQ  $CHAR2.
        @1351 BLANK29  $CHAR1.
        @1352 NUMBSHOT $CHAR2.
        @1354 EXERPROG $CHAR2.
        @1356 GPE2NUM  $CHAR4.
        @1356 EXERNUM1 $CHAR2.
        @1358 EXERUNT1 $CHAR2.
        @1360 E2DISF   $CHAR2.
        @1362 GPE3NUM  $CHAR2.
        @1362 EXERNUM2 $CHAR2.
        @1364 EXERUNT2 $CHAR2.
        @1366 SPORTTIM $CHAR2.
        @1368 GPE5NUM  $CHAR4.
        @1368 EXERNUM3 $CHAR2.
        @1370 EXERUNT3 $CHAR2.
        @1372 ACTVTIM  $CHAR2.
        @1374 WHTCOMPR $CHAR2.
        @1376 WEIGHNOW $CHAR3.
        @1379 GPSDIMEN $CHAR12.
        @1379 SDIMENSN $CHAR2.
        @1381 SHEIGHT  $CHAR2.
        @1383 SWGHT25  $CHAR3.
        @1386 SWGHT40  $CHAR3.
        @1389 SWGHT65  $CHAR3.
        @1392 CALCIUM  $CHAR2.
        @1394 LONGCALC $CHAR2.
        @1396 BLANK30  $CHAR2.
        @1398 CALPAST5 $CHAR2.
        @1400 CALCNOW  $CHAR2.
        @1402 WREYEGLS $CHAR2.
        @1404 SEESTR   $CHAR2.
        @1406 SEEPRINT $CHAR2.
        @1408 HEARAID  $CHAR2.
        @1410 HEARNORM $CHAR2.
        @1412 WOHRGAID $CHAR2.
        @1414 PRXPGMD  $CHAR2.
        @1416 EVERPREG $CHAR2.
        @1418 PREGNOW1 $CHAR2.
        @1420 FRSTBRTH $CHAR2.
        @1422 G3DISF   $CHAR2.
        @1424 SINCPREG $CHAR2.
        @1426 PREGNOW2 $CHAR2.
        @1428 LASTBRTH $CHAR2.
        @1430 G6DISF   $CHAR2.
        @1432 LIVEBRTH $CHAR2.
        @1434 MISCARAG $CHAR2.
        @1436 NUMMISS  $CHAR2.
        @1438 HAVEWOMB $CHAR2.
        @1440 AGEREMVD $CHAR2.
        @1442 G11DISF  $CHAR2.
        @1444 BLANK31  $CHAR2.
        @1446 BOTHOVRY $CHAR2.
        @1448 ONEOVRY  $CHAR2.
        @1450 REMVOVRY $CHAR2.
        @1452 G14DISF  $CHAR2.
        @1454 HAVPERD  $CHAR2.
        @1456 AGEPERD  $CHAR2.
        @1458 G16DISF  $CHAR2.
        @1460 PERDREG  $CHAR2.
        @1462 CHNGLIFE $CHAR2.
        @1464 HORMONE  $CHAR2.
        @1466 AGEHPIL1 $CHAR2.
        @1468 G20DISF  $CHAR2.
        @1470 CURTAKHM $CHAR2.
        @1472 AGEHPILL $CHAR2.
        @1474 G22DISF  $CHAR2.
        @1476 GPUNITL  $CHAR9.
        @1476 HPUNITL  $CHAR2.
        @1478 HPIL1MOL $CHAR2.
        @1480 HPIL1YRL $CHAR2.
        @1482 HPILTOTL $CHAR3.
        @1485 GPUNITT  $CHAR9.
        @1485 HPUNITT  $CHAR2.
        @1487 HPIL1MOT $CHAR2.
        @1489 HPIL1YRT $CHAR2.
        @1491 HPILTOTT $CHAR3.
        @1494 BLANK32  $CHAR2.
        @1496 COLORPIL $CHAR2.
        @1498 GPUNITCL $CHAR4.
        @1498 UNITCOLR $CHAR2.
        @1500 LONGCOLR $CHAR2.
        @1502 G26DISF  $CHAR2.
        @1504 PATCHEVR $CHAR2.
        @1506 PATCHAGF $CHAR2.
        @1508 G28DISF  $CHAR2.
        @1510 PATCHNOW $CHAR2.
        @1512 PATCHAGL $CHAR2.
        @1514 G30DISF  $CHAR2.
        @1516 BLANK33  $CHAR2.
        @1518 PROVERA  $CHAR2.
        @1520 PROVNOW1 $CHAR2.
        @1522 GPUNITP1 $CHAR4.
        @1522 PRO1UNIT $CHAR2.
        @1524 PROVMOYR $CHAR2.
        @1526 PROVNOW2 $CHAR2.
        @1528 GPUNITP2 $CHAR9.
        @1528 PRO2UNIT $CHAR2.
        @1530 PROVMON  $CHAR2.
        @1532 PROVYR   $CHAR2.
        @1534 PROVTOTL $CHAR3.
        @1537 BRTHPILL $CHAR2.
        @1539 AGEFRSTP $CHAR2.
        @1541 G37DISF  $CHAR2.
        @1543 CURPILL  $CHAR2.
        @1545 AGELASTP $CHAR2.
        @1547 G39DISF  $CHAR2.
        @1549 BLANK34  $CHAR2.
        @1551 GPUNITLP $CHAR9.
        @1551 BPUNITL  $CHAR2.
        @1553 BPIL1MOL $CHAR2.
        @1555 BPIL1YRL $CHAR2.
        @1557 BPILTOTL $CHAR3.
        @1560 GPUNITTP $CHAR9.
        @1560 BPUNITT  $CHAR2.
        @1562 BPIL1MOT $CHAR2.
        @1564 BPIL1YRT $CHAR2.
        @1566 BPILTOTT $CHAR3.
        @1569 BLANK35  $CHAR4.
        @1573 GPUNIT25 $CHAR6.
        @1573 BPUNIT25 $CHAR2.
        @1575 BPIL25MO $CHAR2.
        @1577 BPIL25YR $CHAR2.
        @1579 BPIL25TL $CHAR3.
        @1582 BEFCHILD $CHAR2.
        @1584 GPUNITBC $CHAR6.
        @1584 BPUNITBC $CHAR2.
        @1586 BPILBCMO $CHAR2.
        @1588 BPILBCYR $CHAR2.
        @1590 BPILBCTL $CHAR3.
        @1593 TUBETYD  $CHAR2.
        @1595 AGETUBTY $CHAR2.
        @1597 G46DISF  $CHAR2.
        @1599 PAPTEST  $CHAR2.
        @1601 LONGPAP  $CHAR2.
        @1603 G48DISF  $CHAR2.
        @1605 MANYPAP5 $CHAR2.
        @1607 MEDICAR2 $CHAR2.
        @1609 BLANK36  $CHAR18.
        @1627 MEDICARE $CHAR2.
        @1629 BLANK37  $CHAR18.
        @1647 MEDICAID $CHAR2.
        @1649 MILITARY $CHAR2.
        @1651 PRIVATE  $CHAR2.
        @1653 EMPUNION $CHAR2.
        @1655 OTHPROG  $CHAR2.
        @1657 BLANK38  $CHAR30.
        @1687 WAGES    $CHAR2.
        @1689 SSRR     $CHAR2.
        @1691 SSI      $CHAR2.
        @1693 UNEMPLOY $CHAR2.
        @1695 AFDC     $CHAR2.
        @1697 SAVINGS  $CHAR2.
        @1699 DIVIDEND $CHAR2.
        @1701 CHLDSUP  $CHAR2.
        @1703 OTHSUP   $CHAR2.
        @1705 PINCOME  $CHAR9.
        @1714 TINCOME  $CHAR9.
        @1723 BLANK39  $CHAR331.
        @2054 SUBAST   $CHAR2.
        @2056 NUMAST   $CHAR2.
        @2058 AST1REL  $CHAR2.
        @2060 BLANK40  $CHAR60.
        @2120 AST2REL  $CHAR2.
        @2122 BLANK41  $CHAR62.
        @2184 PRIMAST  $CHAR2.
        @2186 BLANK42  $CHAR25.
        @2211 WHYPROX  $CHAR2.
        @2213 GPKHEAR  $CHAR40.
        @2213 KHEAR    $CHAR2.
        @2215 KSPEECH  $CHAR2.
        @2217 KLANGU   $CHAR2.
        @2219 KMEMRY   $CHAR2.
        @2221 KINSTIT  $CHAR2.
        @2223 KALZH    $CHAR2.
        @2225 KOTHMENT $CHAR2.
        @2227 BLANK43  $CHAR30.
        @2257 KOTHPHY  $CHAR2.
        @2259 BLANK44  $CHAR30.
        @2289 KOTHHEAL $CHAR2.
        @2291 BLANK45  $CHAR30.
        @2321 KOTHER   $CHAR2.
        @2323 BLANK46  $CHAR30.
        @2353 INFOSATS $CHAR2.
        @2355 BLANK47  $CHAR195.
        @2550 SUBAWARE $CHAR2.
        @2552 QHELDATT $CHAR2.
        @2554 QUPSTDEP $CHAR2.
        @2556 QBORING  $CHAR2.
        @2558 RCAPABLE $CHAR2.
        @2560 RACCURTE $CHAR2.
        @2562 RUNDESST $CHAR2.
        @2564 BADSECT  $CHAR2.
        @2566 BLANK48  $CHAR95.
        @2661 RHRDHRNG $CHAR2.
        @2663 QINTSPAN $CHAR2.
        @2665 BLANK49  $CHAR159.
        @2824 PERSNM1  $CHAR2.
        @2826 CURREL1  $CHAR2.
        @2828 CURRSX1  $CHAR2.
        @2830 PREVRL1  $CHAR2.
        @2832 PREVSX1  $CHAR2.
        @2834 BLANK50  $CHAR5.
        @2839 PERSNM2  $CHAR2.
        @2841 CURREL2  $CHAR2.
        @2843 CURRSX2  $CHAR2.
        @2845 PREVRL2  $CHAR2.
        @2847 PREVSX2  $CHAR2.
        @2849 BLANK51  $CHAR5.
        @2854 PERSNM3  $CHAR2.
        @2856 CURREL3  $CHAR2.
        @2858 CURRSX3  $CHAR2.
        @2860 PREVRL3  $CHAR2.
        @2862 PREVSX3  $CHAR2.
        @2864 BLANK52  $CHAR5.
        @2869 PERSNM4  $CHAR2.
        @2871 CURREL4  $CHAR2.
        @2873 CURRSX4  $CHAR2.
        @2875 PREVRL4  $CHAR2.
        @2877 PREVSX4  $CHAR2.
        @2879 BLANK53  $CHAR5.
        @2884 PERSNM5  $CHAR2.
        @2886 CURREL5  $CHAR2.
        @2888 CURRSX5  $CHAR2.
        @2890 PREVRL5  $CHAR2.
        @2892 PREVSX5  $CHAR2.
        @2894 BLANK54  $CHAR5.
        @2899 PERSNM6  $CHAR2.
        @2901 CURREL6  $CHAR2.
        @2903 CURRSX6  $CHAR2.
        @2905 PREVRL6  $CHAR2.
        @2907 PREVSX6  $CHAR2.
        @2909 BLANK55  $CHAR5.
        @2914 PERSNM7  $CHAR2.
        @2916 CURREL7  $CHAR2.
        @2918 CURRSX7  $CHAR2.
        @2920 PREVRL7  $CHAR2.
        @2922 PREVSX7  $CHAR2.
        @2924 BLANK56  $CHAR5.
        @2929 PERSNM8  $CHAR2.
        @2931 CURREL8  $CHAR2.
        @2933 CURRSX8  $CHAR2.
        @2935 PREVRL8  $CHAR2.
        @2937 PREVSX8  $CHAR2.
        @2939 BLANK57  $CHAR5.
        @2944 PERSNM9  $CHAR2.
        @2946 CURREL9  $CHAR2.
        @2948 CURRSX9  $CHAR2.
        @2950 PREVRL9  $CHAR2.
        @2952 PREVSX9  $CHAR2.
        @2954 BLANK58  $CHAR5.
        @2959 PERSNM10 $CHAR2.
        @2961 CURREL10 $CHAR2.
        @2963 CURRSX10 $CHAR2.
        @2965 PREVRL10 $CHAR2.
        @2967 PREVSX10 $CHAR2.
        @2969 BLANK59  $CHAR5.
        @2974 PERSNM11 $CHAR2.
        @2976 CURREL11 $CHAR2.
        @2978 CURRSX11 $CHAR2.
        @2980 PREVRL11 $CHAR2.
        @2982 PREVSX11 $CHAR2.
        @2984 BLANK60  $CHAR5.
        @2989 PERSNM12 $CHAR2.
        @2991 CURREL12 $CHAR2.
        @2993 CURRSX12 $CHAR2.
        @2995 PREVRL12 $CHAR2.
        @2997 PREVSX12 $CHAR2.
        @2999 BLANK61  $CHAR5.
        @3004 PERSNM13 $CHAR2.
        @3006 CURREL13 $CHAR2.
        @3008 CURRSX13 $CHAR2.
        @3010 PREVRL13 $CHAR2.
        @3012 PREVSX13 $CHAR2.
        @3014 BLANK62  $CHAR5.
        @3019 PERSNM14 $CHAR2.
        @3021 CURREL14 $CHAR2.
        @3023 CURRSX14 $CHAR2.
        @3025 PREVRL14 $CHAR2.
        @3027 PREVSX14 $CHAR2.
        @3029 BLANK63  $CHAR5.
        @3034 PERSNM15 $CHAR2.
        @3036 CURREL15 $CHAR2.
        @3038 CURRSX15 $CHAR2.
        @3040 PREVRL15 $CHAR2.
        @3042 PREVSX15 $CHAR2.
        @3044 BLANK64  $CHAR5.
        @3049 PERSNM16 $CHAR2.
        @3051 CURREL16 $CHAR2.
        @3053 CURRSX16 $CHAR2.
        @3055 PREVRL16 $CHAR2.
        @3057 PREVSX16 $CHAR2.
        @3059 BLANK65  $CHAR5.
        @3064 PERSNM17 $CHAR2.
        @3066 CURREL17 $CHAR2.
        @3068 CURRSX17 $CHAR2.
        @3070 PREVRL17 $CHAR2.
        @3072 PREVSX17 $CHAR2.
        @3074 BLANK66  $CHAR5.
        @3079 PERSNM18 $CHAR2.
        @3081 CURREL18 $CHAR2.
        @3083 CURRSX18 $CHAR2.
        @3085 PREVRL18 $CHAR2.
        @3087 PREVSX18 $CHAR2.
        @3089 BLANK67  $CHAR5.
        @3094 PERSNM19 $CHAR2.
        @3096 CURREL19 $CHAR2.
        @3098 CURRSX19 $CHAR2.
        @3100 PREVRL19 $CHAR2.
        @3102 PREVSX19 $CHAR2.
        @3104 BLANK68  $CHAR5.
        @3109 CANCNUM1 $CHAR2.
        @3111 CANCRLC1 $CHAR2.
        @3113 BLANK69  $CHAR30.
        @3143 ICD9CNC1 $CHAR3.
        @3146 TOLDCNC1 $CHAR2.
        @3148 B68DISF1 $CHAR2.
        @3150 HOSPCN21 $CHAR2.
        @3152 BLANK70  $CHAR5.
        @3157 CANCNUM2 $CHAR2.
        @3159 CANCRLC2 $CHAR2.
        @3161 BLANK71  $CHAR30.
        @3191 ICD9CNC2 $CHAR3.
        @3194 TOLDCNC2 $CHAR2.
        @3196 B68DISF2 $CHAR2.
        @3198 HOSPCN22 $CHAR2.
        @3200 BLANK72  $CHAR5.
        @3205 CANCNUM3 $CHAR2.
        @3207 CANCRLC3 $CHAR2.
        @3209 BLANK73  $CHAR30.
        @3239 ICD9CNC3 $CHAR3.
        @3242 TOLDCNC3 $CHAR2.
        @3244 B68DISF3 $CHAR2.
        @3246 HOSPCN23 $CHAR2.
        @3248 BLANK74  $CHAR5.
        @3253 CANCNUM4 $CHAR2.
        @3255 CANCRLC4 $CHAR2.
        @3257 BLANK75  $CHAR30.
        @3287 ICD9CNC4 $CHAR3.
        @3290 TOLDCNC4 $CHAR2.
        @3292 B68DISF4 $CHAR2.
        @3294 HOSPCN24 $CHAR2.
        @3296 BLANK76  $CHAR5.
        @3301 OSURNUM1 $CHAR2.
        @3303 OSURTYPE $CHAR2.
        @3305 BLANK77  $CHAR30.
        @3335 ICD9OSU1 $CHAR3.
        @3338 OSURYR1  $CHAR2.
        @3340 BLANK78  $CHAR5.
        @3345 OSURNUM2 $CHAR2.
        @3347 OSURTYP2 $CHAR2.
        @3349 BLANK79  $CHAR30.
        @3379 ICD9OSU2 $CHAR3.
        @3382 OSURYR2  $CHAR2.
        @3384 BLANK80  $CHAR5.
        @3389 OSURNUM3 $CHAR2.
        @3391 OSURTYP3 $CHAR2.
        @3393 BLANK81  $CHAR30.
        @3423 ICD9OSU3 $CHAR3.
        @3426 OSURYR3  $CHAR2.
        @3428 BLANK82  $CHAR5.
        @3433 CRELNUM1 $CHAR2.
        @3435 FREL1    $CHAR2.
        @3437 BLANK83  $CHAR25.
        @3462 FCANLNG1 $CHAR2.
        @3464 FCANBST1 $CHAR2.
        @3466 FCANCLN1 $CHAR2.
        @3468 FCANRCM1 $CHAR2.
        @3470 FCANPNC1 $CHAR2.
        @3472 FCANBDR1 $CHAR2.
        @3474 FCANPST1 $CHAR2.
        @3476 FCANCRV1 $CHAR2.
        @3478 FCANEDO1 $CHAR2.
        @3480 FCANLUK1 $CHAR2.
        @3482 FCANNDL1 $CHAR2.
        @3484 FCANSMC1 $CHAR2.
        @3486 FCANOVY1 $CHAR2.
        @3488 FCANKDY1 $CHAR2.
        @3490 FCANMLN1 $CHAR2.
        @3492 FCANNML1 $CHAR2.
        @3494 FCANNSC1 $CHAR2.
        @3496 FCANBNE1 $CHAR2.
        @3498 FCANLVR1 $CHAR2.
        @3500 FCANBRN1 $CHAR2.
        @3502 FCANTHR1 $CHAR2.
        @3504 FCANORL1 $CHAR2.
        @3506 FCANGLN1 $CHAR2.
        @3508 FCANESH1 $CHAR2.
        @3510 FCANLRX1 $CHAR2.
        @3512 FCANTHD1 $CHAR2.
        @3514 FCANFSP1 $CHAR2.
        @3516 FCANGSO1 $CHAR2.
        @3518 FCANBDY1 $CHAR2.
        @3520 FCANBMR1 $CHAR2.
        @3522 FCANHKN1 $CHAR2.
        @3524 FCANTST1 $CHAR2.
        @3526 FCANOT11 $CHAR2.
        @3528 BLANK84  $CHAR30.
        @3558 FCANOT21 $CHAR2.
        @3560 BLANK85  $CHAR30.
        @3590 FCANOT31 $CHAR2.
        @3592 BLANK86  $CHAR30.
        @3622 CANCOR11 $CHAR2.
        @3624 CANCOR21 $CHAR2.
        @3626 CANCOR31 $CHAR2.
        @3628 CANCOR41 $CHAR2.
        @3630 CANCOR51 $CHAR2.
        @3632 CANCOR61 $CHAR2.
        @3634 CANCOR71 $CHAR2.
        @3636 CANCOR81 $CHAR2.
        @3638 CANCOR91 $CHAR2.
        @3640 CANCR101 $CHAR2.
        @3642 ICD9CR11 $CHAR3.
        @3645 ICD9CR21 $CHAR3.
        @3648 ICD9CR31 $CHAR3.
        @3651 ICD9CR41 $CHAR3.
        @3654 ICD9CR51 $CHAR3.
        @3657 ICD9CR61 $CHAR3.
        @3660 ICD9CR71 $CHAR3.
        @3663 ICD9CR81 $CHAR3.
        @3666 ICD9CR91 $CHAR3.
        @3669 ICD9C101 $CHAR3.
        @3672 BLANK87  $CHAR5.
        @3677 CRELNUM2 $CHAR2.
        @3679 FREL2    $CHAR2.
        @3681 BLANK88  $CHAR25.
        @3706 FCANLNG2 $CHAR2.
        @3708 FCANBST2 $CHAR2.
        @3710 FCANCLN2 $CHAR2.
        @3712 FCANRCM2 $CHAR2.
        @3714 FCANPNC2 $CHAR2.
        @3716 FCANBLD2 $CHAR2.
        @3718 FCANPST2 $CHAR2.
        @3720 FCANCRV2 $CHAR2.
        @3722 FCANEDO2 $CHAR2.
        @3724 FCANLUK2 $CHAR2.
        @3726 FCANNDL2 $CHAR2.
        @3728 FCANSMC2 $CHAR2.
        @3730 FCANOVY2 $CHAR2.
        @3732 FCANKDY2 $CHAR2.
        @3734 FCANMLN2 $CHAR2.
        @3736 FCANNML2 $CHAR2.
        @3738 FCANNSC2 $CHAR2.
        @3740 FCANBNE2 $CHAR2.
        @3742 FCANLVR2 $CHAR2.
        @3744 FCANBRN2 $CHAR2.
        @3746 FCANTHR2 $CHAR2.
        @3748 FCANORL2 $CHAR2.
        @3750 FCANGLN2 $CHAR2.
        @3752 FCANESH2 $CHAR2.
        @3754 FCANLRX2 $CHAR2.
        @3756 FCANTHD2 $CHAR2.
        @3758 FCANFSP2 $CHAR2.
        @3760 FCANGSO2 $CHAR2.
        @3762 FCANBDY2 $CHAR2.
        @3764 FCANBMR2 $CHAR2.
        @3766 FCANHKN2 $CHAR2.
        @3768 FCANTST2 $CHAR2.
        @3770 FCANOT12 $CHAR2.
        @3772 BLANK89  $CHAR30.
        @3802 FCANOT22 $CHAR2.
        @3804 BLANK90  $CHAR30.
        @3834 FCANOT32 $CHAR2.
        @3836 BLANK91  $CHAR30.
        @3866 CANCOR12 $CHAR2.
        @3868 CANCOR22 $CHAR2.
        @3870 CANCOR32 $CHAR2.
        @3872 CANCOR42 $CHAR2.
        @3874 CANCOR52 $CHAR2.
        @3876 CANCOR62 $CHAR2.
        @3878 CANCOR72 $CHAR2.
        @3880 CANCOR82 $CHAR2.
        @3882 CANCOR92 $CHAR2.
        @3884 CANCR102 $CHAR2.
        @3886 ICD9CR12 $CHAR3.
        @3889 ICD9CR22 $CHAR3.
        @3892 ICD9CR32 $CHAR3.
        @3895 ICD9CR42 $CHAR3.
        @3898 ICD9CR52 $CHAR3.
        @3901 ICD9CR62 $CHAR3.
        @3904 ICD9CR72 $CHAR3.
        @3907 ICD9CR82 $CHAR3.
        @3910 ICD9CR92 $CHAR3.
        @3913 ICD9C102 $CHAR3.
        @3916 BLANK92  $CHAR5.
        @3921 CRELNUM3 $CHAR2.
        @3923 FREL3    $CHAR2.
        @3925 BLANK93  $CHAR25.
        @3950 FCANLNG3 $CHAR2.
        @3952 FCANBST3 $CHAR2.
        @3954 FCANCLN3 $CHAR2.
        @3956 FCANRCM3 $CHAR2.
        @3958 FCANPNC3 $CHAR2.
        @3960 FCANBDR3 $CHAR2.
        @3962 FCANPRS3 $CHAR2.
        @3964 FCANCRV3 $CHAR2.
        @3966 FCANEDO3 $CHAR2.
        @3968 FCANLUK3 $CHAR2.
        @3970 FCANNDL3 $CHAR2.
        @3972 FCANSMC3 $CHAR2.
        @3974 FCANOVY3 $CHAR2.
        @3976 FCANKDY3 $CHAR2.
        @3978 FCANMLN3 $CHAR2.
        @3980 FCANNML3 $CHAR2.
        @3982 FCANNSC3 $CHAR2.
        @3984 FCANBNE3 $CHAR2.
        @3986 FCANLVR3 $CHAR2.
        @3988 FCANBRN3 $CHAR2.
        @3990 FCANTHR3 $CHAR2.
        @3992 FCANORL3 $CHAR2.
        @3994 FCANGLN3 $CHAR2.
        @3996 FCANESH3 $CHAR2.
        @3998 FCANLRX3 $CHAR2.
        @4000 FCANTHD3 $CHAR2.
        @4002 FCANFSP3 $CHAR2.
        @4004 FCANGSO3 $CHAR2.
        @4006 FCANBDY3 $CHAR2.
        @4008 FCANBMR3 $CHAR2.
        @4010 FCANHKN3 $CHAR2.
        @4012 FCANTST3 $CHAR2.
        @4014 FCANOT13 $CHAR2.
        @4016 BLANK94  $CHAR30.
        @4046 FCANOT23 $CHAR2.
        @4048 BLANK95  $CHAR30.
        @4078 FCANOT33 $CHAR2.
        @4080 BLANK96  $CHAR30.
        @4110 CANCOR13 $CHAR2.
        @4112 CANCOR23 $CHAR2.
        @4114 CANCOR33 $CHAR2.
        @4116 CANCOR43 $CHAR2.
        @4118 CANCOR53 $CHAR2.
        @4120 CANCOR63 $CHAR2.
        @4122 CANCOR73 $CHAR2.
        @4124 CANCOR83 $CHAR2.
        @4126 CANCOR93 $CHAR2.
        @4128 CANCR103 $CHAR2.
        @4130 ICD9CR13 $CHAR3.
        @4133 ICD9CR23 $CHAR3.
        @4136 ICD9CR33 $CHAR3.
        @4139 ICD9CR43 $CHAR3.
        @4142 ICD9CR53 $CHAR3.
        @4145 ICD9CR63 $CHAR3.
        @4148 ICD9CR73 $CHAR3.
        @4151 ICD9CR83 $CHAR3.
        @4154 ICD9CR93 $CHAR3.
        @4157 ICD9C103 $CHAR3.
        @4160 BLANK97  $CHAR5.
        @4165 CRELNUM4 $CHAR2.
        @4167 FREL4    $CHAR2.
        @4169 BLANK98  $CHAR25.
        @4194 FCANLNG4 $CHAR2.
        @4196 FCANBST4 $CHAR2.
        @4198 FCANCLN4 $CHAR2.
        @4200 FCANRCM4 $CHAR2.
        @4202 FCANPNC4 $CHAR2.
        @4204 FCANBDR4 $CHAR2.
        @4206 FCANPST4 $CHAR2.
        @4208 FCANCRV4 $CHAR2.
        @4210 FCANEDO4 $CHAR2.
        @4212 FCANLUK4 $CHAR2.
        @4214 FCANNDL4 $CHAR2.
        @4216 FCANSMC4 $CHAR2.
        @4218 FCANOVY4 $CHAR2.
        @4220 FCANKDY4 $CHAR2.
        @4222 FCANMLN4 $CHAR2.
        @4224 FCANNML4 $CHAR2.
        @4226 FCANNSC4 $CHAR2.
        @4228 FCANBNE4 $CHAR2.
        @4230 FCANLVR4 $CHAR2.
        @4232 FCANBRN4 $CHAR2.
        @4234 FCANTHR4 $CHAR2.
        @4236 FCANORL4 $CHAR2.
        @4238 FCANGLN4 $CHAR2.
        @4240 FCANESH4 $CHAR2.
        @4242 FCANLRX4 $CHAR2.
        @4244 FCANTHD4 $CHAR2.
        @4246 FCANFSP4 $CHAR2.
        @4248 FCANGSO4 $CHAR2.
        @4250 FCANBDY4 $CHAR2.
        @4252 FCANBMR4 $CHAR2.
        @4254 FCANHKN4 $CHAR2.
        @4256 FCANTST4 $CHAR2.
        @4258 FCANOT14 $CHAR2.
        @4260 BLANK99  $CHAR30.
        @4290 FCANOT24 $CHAR2.
        @4292 BLANK100 $CHAR30.
        @4322 FCANOT34 $CHAR2.
        @4324 BLANK101 $CHAR30.
        @4354 CANCOR14 $CHAR2.
        @4356 CANCOR24 $CHAR2.
        @4358 CANCOR34 $CHAR2.
        @4360 CANCOR44 $CHAR2.
        @4362 CANCOR54 $CHAR2.
        @4364 CANCOR64 $CHAR2.
        @4366 CANCOR74 $CHAR2.
        @4368 CANCOR84 $CHAR2.
        @4370 CANCOR94 $CHAR2.
        @4372 CANCR104 $CHAR2.
        @4374 ICD9CR14 $CHAR3.
        @4377 ICD9CR24 $CHAR3.
        @4380 ICD9CR34 $CHAR3.
        @4383 ICD9CR44 $CHAR3.
        @4386 ICD9CR54 $CHAR3.
        @4389 ICD9CR64 $CHAR3.
        @4392 ICD9CR74 $CHAR3.
        @4395 ICD9CR84 $CHAR3.
        @4398 ICD9CR94 $CHAR3.
        @4401 ICD9C104 $CHAR3.
        @4404 BLANK102 $CHAR5.
        @4409 CRELNUM5 $CHAR2.
        @4411 FREL5    $CHAR2.
        @4413 BLANK103 $CHAR25.
        @4438 FCANLNG5 $CHAR2.
        @4440 FCANBST5 $CHAR2.
        @4442 FCANCLN5 $CHAR2.
        @4444 FCANRCM5 $CHAR2.
        @4446 FCANPNC5 $CHAR2.
        @4448 FCANBDR5 $CHAR2.
        @4450 FCANPST5 $CHAR2.
        @4452 FCANCRV5 $CHAR2.
        @4454 FCANEDO5 $CHAR2.
        @4456 FCANLUK5 $CHAR2.
        @4458 FCANNDL5 $CHAR2.
        @4460 FCANSMC5 $CHAR2.
        @4462 FCANOVY5 $CHAR2.
        @4464 FCANKDY5 $CHAR2.
        @4466 FCANMLN5 $CHAR2.
        @4468 FCANNML5 $CHAR2.
        @4470 FCANNSC5 $CHAR2.
        @4472 FCANBNE5 $CHAR2.
        @4474 FCANLVR5 $CHAR2.
        @4476 FCANBRN5 $CHAR2.
        @4478 FCANTHR5 $CHAR2.
        @4480 FCANORL5 $CHAR2.
        @4482 FCANGLN5 $CHAR2.
        @4484 FCANESH5 $CHAR2.
        @4486 FCANLRX5 $CHAR2.
        @4488 FCANTHD5 $CHAR2.
        @4490 FCANFSP5 $CHAR2.
        @4492 FCANGSO5 $CHAR2.
        @4494 FCANBDY5 $CHAR2.
        @4496 FCANBMR5 $CHAR2.
        @4498 FCANHKN5 $CHAR2.
        @4500 FCANTST5 $CHAR2.
        @4502 FCANOT15 $CHAR2.
        @4504 BLANK104 $CHAR30.
        @4534 FCANOT25 $CHAR2.
        @4536 BLANK105 $CHAR30.
        @4566 FCANOT35 $CHAR2.
        @4568 BLANK106 $CHAR30.
        @4598 CANCOR15 $CHAR2.
        @4600 CANCOR25 $CHAR2.
        @4602 CANCOR35 $CHAR2.
        @4604 CANCOR45 $CHAR2.
        @4606 CANCOR55 $CHAR2.
        @4608 CANCOR65 $CHAR2.
        @4610 CANCOR75 $CHAR2.
        @4612 CANCOR85 $CHAR2.
        @4614 CANCOR95 $CHAR2.
        @4616 CANCR105 $CHAR2.
        @4618 ICD9CR15 $CHAR3.
        @4621 ICD9CR25 $CHAR3.
        @4624 ICD9CR35 $CHAR3.
        @4627 ICD9CR45 $CHAR3.
        @4630 ICD9CR55 $CHAR3.
        @4633 ICD9CR65 $CHAR3.
        @4636 ICD9CR75 $CHAR3.
        @4639 ICD9CR85 $CHAR3.
        @4642 ICD9CR95 $CHAR3.
        @4645 ICD9C105 $CHAR3.
        @4648 BLANK107 $CHAR5.
        @4653 CRELNUM6 $CHAR2.
        @4655 FREL6    $CHAR2.
        @4657 BLANK108 $CHAR25.
        @4682 FCANLNG6 $CHAR2.
        @4684 FCANBST6 $CHAR2.
        @4686 FCANCLN6 $CHAR2.
        @4688 FCANRCM6 $CHAR2.
        @4690 FCANPNC6 $CHAR2.
        @4692 FCANBDR6 $CHAR2.
        @4694 FCANPST6 $CHAR2.
        @4696 FCANCRV6 $CHAR2.
        @4698 FCANEDO6 $CHAR2.
        @4700 FCANLUK6 $CHAR2.
        @4702 FCANNDL6 $CHAR2.
        @4704 FCANSMC6 $CHAR2.
        @4706 FCANOVY6 $CHAR2.
        @4708 FCANKDY6 $CHAR2.
        @4710 FCANMLN6 $CHAR2.
        @4712 FCANNML6 $CHAR2.
        @4714 FCANNSC6 $CHAR2.
        @4716 FCANBNE6 $CHAR2.
        @4718 FCANLVR6 $CHAR2.
        @4720 FCANBRN6 $CHAR2.
        @4722 FCANTHR6 $CHAR2.
        @4724 FCANORL6 $CHAR2.
        @4726 FCANGLN6 $CHAR2.
        @4728 FCANESH6 $CHAR2.
        @4730 FCANLRX6 $CHAR2.
        @4732 FCANTHD6 $CHAR2.
        @4734 FCANFSP6 $CHAR2.
        @4736 FCANGSO6 $CHAR2.
        @4738 FCANBDY6 $CHAR2.
        @4740 FCANBMR6 $CHAR2.
        @4742 FCANHKN6 $CHAR2.
        @4744 FCANTST6 $CHAR2.
        @4746 FCANOT16 $CHAR2.
        @4748 BLANK109 $CHAR30.
        @4778 FCANOT26 $CHAR2.
        @4780 BLANK110 $CHAR30.
        @4810 FCANOT36 $CHAR2.
        @4812 BLANK111 $CHAR30.
        @4842 CANCOR16 $CHAR2.
        @4844 CANCOR26 $CHAR2.
        @4846 CANCOR36 $CHAR2.
        @4848 CANCOR46 $CHAR2.
        @4850 CANCOR56 $CHAR2.
        @4852 CANCOR66 $CHAR2.
        @4854 CANCOR76 $CHAR2.
        @4856 CANCOR86 $CHAR2.
        @4858 CANCOR96 $CHAR2.
        @4860 CANCR106 $CHAR2.
        @4862 ICD9CR16 $CHAR3.
        @4865 ICD9CR26 $CHAR3.
        @4868 ICD9CR36 $CHAR3.
        @4871 ICD9CR46 $CHAR3.
        @4874 ICD9CR56 $CHAR3.
        @4877 ICD9CR66 $CHAR3.
        @4880 ICD9CR76 $CHAR3.
        @4883 ICD9CR86 $CHAR3.
        @4886 ICD9CR96 $CHAR3.
        @4889 ICD9C106 $CHAR3.
        @4892 BLANK112 $CHAR5.
        @4897 CRELNUM7 $CHAR2.
        @4899 FREL7    $CHAR2.
        @4901 BLANK113 $CHAR25.
        @4926 FCANLNG7 $CHAR2.
        @4928 FCANBST7 $CHAR2.
        @4930 FCANCLN7 $CHAR2.
        @4932 FCANRCM7 $CHAR2.
        @4934 FCANPNC7 $CHAR2.
        @4936 FCANBDR7 $CHAR2.
        @4938 FCANPST7 $CHAR2.
        @4940 FCANCRV7 $CHAR2.
        @4942 FCANENO7 $CHAR2.
        @4944 FCANLUK7 $CHAR2.
        @4946 FCANNDL7 $CHAR2.
        @4948 FCANSMC7 $CHAR2.
        @4950 FCANOVY7 $CHAR2.
        @4952 FCANKDY7 $CHAR2.
        @4954 FCANMLN7 $CHAR2.
        @4956 FCANNML7 $CHAR2.
        @4958 FCANNSC7 $CHAR2.
        @4960 FCANBNE7 $CHAR2.
        @4962 FCANLVR7 $CHAR2.
        @4964 FCANBRN7 $CHAR2.
        @4966 FCANTHR7 $CHAR2.
        @4968 FCANORL7 $CHAR2.
        @4970 FCANGLN7 $CHAR2.
        @4972 FCANESH7 $CHAR2.
        @4974 FCANLRX7 $CHAR2.
        @4976 FCANTHD7 $CHAR2.
        @4978 FCANFSP7 $CHAR2.
        @4980 FCANGSO7 $CHAR2.
        @4982 FCANBDY7 $CHAR2.
        @4984 FCANBMR7 $CHAR2.
        @4986 FCANHKN7 $CHAR2.
        @4988 FCANTST7 $CHAR2.
        @4990 FCANOT17 $CHAR2.
        @4992 BLANK114 $CHAR30.
        @5022 FCANOT27 $CHAR2.
        @5024 BLANK115 $CHAR30.
        @5054 FCANOT37 $CHAR2.
        @5056 BLANK116 $CHAR30.
        @5086 CANCOR17 $CHAR2.
        @5088 CANCOR27 $CHAR2.
        @5090 CANCOR37 $CHAR2.
        @5092 CANCOR47 $CHAR2.
        @5094 CANCOR57 $CHAR2.
        @5096 CANCOR67 $CHAR2.
        @5098 CANCOR77 $CHAR2.
        @5100 CANCOR87 $CHAR2.
        @5102 CANCOR97 $CHAR2.
        @5104 CANCR107 $CHAR2.
        @5106 ICD9CR17 $CHAR3.
        @5109 ICD9CR27 $CHAR3.
        @5112 ICD9CR37 $CHAR3.
        @5115 ICD9CR47 $CHAR3.
        @5118 ICD9CR57 $CHAR3.
        @5121 ICD9CR67 $CHAR3.
        @5124 ICD9CR77 $CHAR3.
        @5127 ICD9CR87 $CHAR3.
        @5130 ICD9CR97 $CHAR3.
        @5133 ICD9C107 $CHAR3.
        @5136 BLANK117 $CHAR5.
        @5141 CRELNUM8 $CHAR2.
        @5143 FREL8    $CHAR2.
        @5145 BLANK118 $CHAR25.
        @5170 FCANLNG8 $CHAR2.
        @5172 FCANBST8 $CHAR2.
        @5174 FCANCLN8 $CHAR2.
        @5176 FCANRCM8 $CHAR2.
        @5178 FCANPNC8 $CHAR2.
        @5180 FCANBDR8 $CHAR2.
        @5182 FCANPST8 $CHAR2.
        @5184 FCANCRV8 $CHAR2.
        @5186 FCANEDO8 $CHAR2.
        @5188 FCANLUK8 $CHAR2.
        @5190 FCANNDL8 $CHAR2.
        @5192 FCANSMC8 $CHAR2.
        @5194 FCANOVY8 $CHAR2.
        @5196 FCANKDY8 $CHAR2.
        @5198 FCANMLN8 $CHAR2.
        @5200 FCANNML8 $CHAR2.
        @5202 FCANNSC8 $CHAR2.
        @5204 FCANBNE8 $CHAR2.
        @5206 FCANLVR8 $CHAR2.
        @5208 FCANBRN8 $CHAR2.
        @5210 FCANTHR8 $CHAR2.
        @5212 FCANORL8 $CHAR2.
        @5214 FCANGLN8 $CHAR2.
        @5216 FCANESH8 $CHAR2.
        @5218 FCANLRX8 $CHAR2.
        @5220 FCANTHD8 $CHAR2.
        @5222 FCANFSP8 $CHAR2.
        @5224 FCANGSO8 $CHAR2.
        @5226 FCANBDY8 $CHAR2.
        @5228 FCANBMR8 $CHAR2.
        @5230 FCANHKN8 $CHAR2.
        @5232 FCANTST8 $CHAR2.
        @5234 FCANOT18 $CHAR2.
        @5236 BLANK119 $CHAR30.
        @5266 FCANOT28 $CHAR2.
        @5268 BLANK120 $CHAR30.
        @5298 FCANOT38 $CHAR2.
        @5300 BLANK121 $CHAR30.
        @5330 CANCOR18 $CHAR2.
        @5332 CANCOR28 $CHAR2.
        @5334 CANCOR38 $CHAR2.
        @5336 CANCOR48 $CHAR2.
        @5338 CANCOR58 $CHAR2.
        @5340 CANCOR68 $CHAR2.
        @5342 CANCOR78 $CHAR2.
        @5344 CANCOR88 $CHAR2.
        @5346 CANCOR98 $CHAR2.
        @5348 CANCR108 $CHAR2.
        @5350 ICD9CR18 $CHAR3.
        @5353 ICD9CR28 $CHAR3.
        @5356 ICD9CR38 $CHAR3.
        @5359 ICD9CR48 $CHAR3.
        @5362 ICD9CR58 $CHAR3.
        @5365 ICD9CR68 $CHAR3.
        @5368 ICD9CR78 $CHAR3.
        @5371 ICD9CR88 $CHAR3.
        @5374 ICD9CR98 $CHAR3.
        @5377 ICD9C108 $CHAR3.
        @5380 BLANK122 $CHAR5.
        @5385 CRELNUM9 $CHAR2.
        @5387 FREL9    $CHAR2.
        @5389 BLANK123 $CHAR25.
        @5414 FCANLNG9 $CHAR2.
        @5416 FCANBST9 $CHAR2.
        @5418 FCANCLN9 $CHAR2.
        @5420 FCANRCM9 $CHAR2.
        @5422 FCANPNC9 $CHAR2.
        @5424 FCANBDR9 $CHAR2.
        @5426 FCANPST9 $CHAR2.
        @5428 FCANCRV9 $CHAR2.
        @5430 FCANEDO9 $CHAR2.
        @5432 FCANLUK9 $CHAR2.
        @5434 FCANNDL9 $CHAR2.
        @5436 FCANSMC9 $CHAR2.
        @5438 FCANOVY9 $CHAR2.
        @5440 FCANKDY9 $CHAR2.
        @5442 FCANMLN9 $CHAR2.
        @5444 FCANNML9 $CHAR2.
        @5446 FCANNSC9 $CHAR2.
        @5448 FCANBNE9 $CHAR2.
        @5450 FCANLVR9 $CHAR2.
        @5452 FCANBRN9 $CHAR2.
        @5454 FCANTHR9 $CHAR2.
        @5456 FCANORL9 $CHAR2.
        @5458 FCANGLN9 $CHAR2.
        @5460 FCANESH9 $CHAR2.
        @5462 FCANLRX9 $CHAR2.
        @5464 FCANTHD9 $CHAR2.
        @5466 FCANFSP9 $CHAR2.
        @5468 FCANGSO9 $CHAR2.
        @5470 FCANBDY9 $CHAR2.
        @5472 FCANBMR9 $CHAR2.
        @5474 FCANHKN9 $CHAR2.
        @5476 FCANTST9 $CHAR2.
        @5478 FCANOT19 $CHAR2.
        @5480 BLANK124 $CHAR30.
        @5510 FCANOT29 $CHAR2.
        @5512 BLANK125 $CHAR30.
        @5542 FCANOT39 $CHAR2.
        @5544 BLANK126 $CHAR30.
        @5574 CANCOR19 $CHAR2.
        @5576 CANCOR29 $CHAR2.
        @5578 CANCOR39 $CHAR2.
        @5580 CANCOR49 $CHAR2.
        @5582 CANCOR59 $CHAR2.
        @5584 CANCOR69 $CHAR2.
        @5586 CANCOR79 $CHAR2.
        @5588 CANCOR89 $CHAR2.
        @5590 CANCOR99 $CHAR2.
        @5592 CANCR109 $CHAR2.
        @5594 ICD9CR19 $CHAR3.
        @5597 ICD9CR29 $CHAR3.
        @5600 ICD9CR39 $CHAR3.
        @5603 ICD9CR49 $CHAR3.
        @5606 ICD9CR59 $CHAR3.
        @5609 ICD9CR69 $CHAR3.
        @5612 ICD9CR79 $CHAR3.
        @5615 ICD9CR89 $CHAR3.
        @5618 ICD9CR99 $CHAR3.
        @5621 ICD9C109 $CHAR3.
        @5624 BLANK127 $CHAR5.
        @5629 RESTNUM1 $CHAR2.
        @5631 ADMSNPC1 $CHAR2.
        @5633 BLANK128 $CHAR30.
        @5663 ENTERFM1 $CHAR2.
        @5665 BLANK129 $CHAR30.
        @5695 YEARETR1 $CHAR2.
        @5697 NURSCRE1 $CHAR2.
        @5699 SURGRCP1 $CHAR2.
        @5701 NEEDHLP1 $CHAR2.
        @5703 REQSPCD1 $CHAR2.
        @5705 CONFUSD1 $CHAR2.
        @5707 MDCNTR11 $CHAR2.
        @5709 MDCNTR21 $CHAR2.
        @5711 MDCNTR31 $CHAR2.
        @5713 MDCNTR41 $CHAR2.
        @5715 MDCNTR51 $CHAR2.
        @5717 MDCNTR61 $CHAR2.
        @5719 CNDTLZH1 $CHAR2.
        @5721 CNDTCNR1 $CHAR2.
        @5723 CNDTDPS1 $CHAR2.
        @5725 CNDTFRL1 $CHAR2.
        @5727 CNDTHDR1 $CHAR2.
        @5729 CNDTINN1 $CHAR2.
        @5731 CNDTNMD1 $CHAR2.
        @5733 CNDTSNL1 $CHAR2.
        @5735 CNDTSTK1 $CHAR2.
        @5737 CNDTOTH1 $CHAR2.
        @5739 BLANK130 $CHAR30.
        @5769 CNDTART1 $CHAR2.
        @5771 CNDTDRG1 $CHAR2.
        @5773 CNDTHPF1 $CHAR2.
        @5775 CNDTOFC1 $CHAR2.
        @5777 CNDTHTC1 $CHAR2.
        @5779 CNDTDIB1 $CHAR2.
        @5781 CNDTBLD1 $CHAR2.
        @5783 CNDTOST1 $CHAR2.
        @5785 CNDTPRK1 $CHAR2.
        @5787 CNDTTME1 $CHAR2.
        @5789 CNDTUNT1 $CHAR2.
        @5791 BLANK131 $CHAR2.
        @5793 OTHADMN1 $CHAR2.
        @5795 BLANK132 $CHAR5.
        @5800 RESTNUM2 $CHAR2.
        @5802 ADMSNPC2 $CHAR2.
        @5804 BLANK133 $CHAR30.
        @5834 ENTERFM2 $CHAR2.
        @5836 BLANK134 $CHAR30.
        @5866 YEARETR2 $CHAR2.
        @5868 NURSCRE2 $CHAR2.
        @5870 SURGRCP2 $CHAR2.
        @5872 NEEDHLP2 $CHAR2.
        @5874 REQSPCD2 $CHAR2.
        @5876 CONFUSD2 $CHAR2.
        @5878 MDCNTR12 $CHAR2.
        @5880 MDCNTR22 $CHAR2.
        @5882 MDCNTR32 $CHAR2.
        @5884 MDCNTR42 $CHAR2.
        @5886 MDCNTR52 $CHAR2.
        @5888 MDCNTR62 $CHAR2.
        @5890 CNDTLZH2 $CHAR2.
        @5892 CNDTCNR2 $CHAR2.
        @5894 CNDTDPS2 $CHAR2.
        @5896 CNDTFRL2 $CHAR2.
        @5898 CNDTHDR2 $CHAR2.
        @5900 CNDTINN2 $CHAR2.
        @5902 CNDTNMD2 $CHAR2.
        @5904 CNDTSNL2 $CHAR2.
        @5906 CNDTSTK2 $CHAR2.
        @5908 CNDTOTH2 $CHAR2.
        @5910 BLANK135 $CHAR30.
        @5940 CNDTART2 $CHAR2.
        @5942 CNDTDRG2 $CHAR2.
        @5944 CNDTHPF2 $CHAR2.
        @5946 CNDTOFC2 $CHAR2.
        @5948 CNDTHTC2 $CHAR2.
        @5950 CNDTDIB2 $CHAR2.
        @5952 CNDTBLD2 $CHAR2.
        @5954 CNDTOST2 $CHAR2.
        @5956 CNDTPRK2 $CHAR2.
        @5958 CNDTTME2 $CHAR2.
        @5960 CNDTUNT2 $CHAR2.
        @5962 BLANK136 $CHAR2.
        @5964 OTHADMN2 $CHAR2.
        @5966 BLANK137 $CHAR5.
        @5971 RESTNUM3 $CHAR2.
        @5973 ADMSNPC3 $CHAR2.
        @5975 BLANK138 $CHAR30.
        @6005 ENTERFM3 $CHAR2.
        @6007 BLANK139 $CHAR30.
        @6037 YEARETR3 $CHAR2.
        @6039 NURSCRE3 $CHAR2.
        @6041 SURGRCP3 $CHAR2.
        @6043 NEEDHLP3 $CHAR2.
        @6045 REQSPCD3 $CHAR2.
        @6047 CONFUSD3 $CHAR2.
        @6049 MDCNTR13 $CHAR2.
        @6051 MDCNTR23 $CHAR2.
        @6053 MDCNTR33 $CHAR2.
        @6055 MDCNTR43 $CHAR2.
        @6057 MDCNTR53 $CHAR2.
        @6059 MDCNTR63 $CHAR2.
        @6061 CNDTLZH3 $CHAR2.
        @6063 CNDTCNR3 $CHAR2.
        @6065 CNDTDPS3 $CHAR2.
        @6067 CNDTFRL3 $CHAR2.
        @6069 CNDTHDR3 $CHAR2.
        @6071 CNDTINN3 $CHAR2.
        @6073 CNDTNMD3 $CHAR2.
        @6075 CNDTSNL3 $CHAR2.
        @6077 CNDTSTK3 $CHAR2.
        @6079 CNDTOTH3 $CHAR2.
        @6081 BLANK140 $CHAR30.
        @6111 CNDTART3 $CHAR2.
        @6113 CNDTDRG3 $CHAR2.
        @6115 CNDTHPF3 $CHAR2.
        @6117 CNDTOFC3 $CHAR2.
        @6119 CNDTHTC3 $CHAR2.
        @6121 CNDTDIB3 $CHAR2.
        @6123 CNDTBLD3 $CHAR2.
        @6125 CNDTOST3 $CHAR2.
        @6127 CNDTPRK3 $CHAR2.
        @6129 CNDTTME3 $CHAR2.
        @6131 CNDTUNT3 $CHAR2.
        @6133 BLANK141 $CHAR2.
        @6135 OTHADMN3 $CHAR2.
        @6137 BLANK142 $CHAR5.
        @6142 RESTNUM4 $CHAR2.
        @6144 ADMSNPC4 $CHAR2.
        @6146 BLANK143 $CHAR30.
        @6176 ENTERFM4 $CHAR2.
        @6178 BLANK144 $CHAR30.
        @6208 YEARETR4 $CHAR2.
        @6210 NURSCRE4 $CHAR2.
        @6212 SURGRCP4 $CHAR2.
        @6214 NEEDHLP4 $CHAR2.
        @6216 REQSPCD4 $CHAR2.
        @6218 CONFUSD4 $CHAR2.
        @6220 MDCNTR14 $CHAR2.
        @6222 MDCNTR24 $CHAR2.
        @6224 MDCNTR34 $CHAR2.
        @6226 MDCNTR44 $CHAR2.
        @6228 MDCNTR54 $CHAR2.
        @6230 MDCNTR64 $CHAR2.
        @6232 CNDTLZH4 $CHAR2.
        @6234 CNDTCNR4 $CHAR2.
        @6236 CNDTDPS4 $CHAR2.
        @6238 CNDTFRL4 $CHAR2.
        @6240 CNDTHDR4 $CHAR2.
        @6242 CNDTINN4 $CHAR2.
        @6244 CNDTNMD4 $CHAR2.
        @6246 CNDTSNL4 $CHAR2.
        @6248 CNDTSTK4 $CHAR2.
        @6250 CNDTOTH4 $CHAR2.
        @6252 BLANK145 $CHAR30.
        @6282 CNDTART4 $CHAR2.
        @6284 CNDTDRG4 $CHAR2.
        @6286 CNDTHPF4 $CHAR2.
        @6288 CNDTOFC4 $CHAR2.
        @6290 CNDTHTC4 $CHAR2.
        @6292 CNDTDIB4 $CHAR2.
        @6294 CNDTBLD4 $CHAR2.
        @6296 CNDTOST4 $CHAR2.
        @6298 CNDTPRK4 $CHAR2.
        @6300 CNDTTME4 $CHAR2.
        @6302 CNDTUNT4 $CHAR2.
        @6304 BLANK146 $CHAR2.
        @6306 OTHADMN4 $CHAR2.
        @6308 BLANK147 $CHAR5.
        @6313 RESTNUM5 $CHAR2.
        @6315 ADMSNPC5 $CHAR2.
        @6317 BLANK148 $CHAR30.
        @6347 ENTERFM5 $CHAR2.
        @6349 BLANK149 $CHAR30.
        @6379 YEARETR5 $CHAR2.
        @6381 NURSCRE5 $CHAR2.
        @6383 SURGRCP5 $CHAR2.
        @6385 NEEDHLP5 $CHAR2.
        @6387 REQSPCD5 $CHAR2.
        @6389 CONFUSD5 $CHAR2.
        @6391 MDCNTR15 $CHAR2.
        @6393 MDCNTR25 $CHAR2.
        @6395 MDCNTR35 $CHAR2.
        @6397 MDCNTR45 $CHAR2.
        @6399 MDCNTR55 $CHAR2.
        @6401 MDCNTR65 $CHAR2.
        @6403 CNDTLZH5 $CHAR2.
        @6405 CNDTCNR5 $CHAR2.
        @6407 CNDTDPS5 $CHAR2.
        @6409 CNDTFRL5 $CHAR2.
        @6411 CNDTHDR5 $CHAR2.
        @6413 CNDTINN5 $CHAR2.
        @6415 CNDTNMD5 $CHAR2.
        @6417 CNDTSNL5 $CHAR2.
        @6419 CNDTSTK5 $CHAR2.
        @6421 CNDTOTH5 $CHAR2.
        @6423 BLANK150 $CHAR30.
        @6453 CNDTART5 $CHAR2.
        @6455 CNDTDRG5 $CHAR2.
        @6457 CNDTHPF5 $CHAR2.
        @6459 CNDTOFC5 $CHAR2.
        @6461 CNDTHTC5 $CHAR2.
        @6463 CNDTDIB5 $CHAR2.
        @6465 CNDTBLD5 $CHAR2.
        @6467 CNDTOST5 $CHAR2.
        @6469 CNDTPRK5 $CHAR2.
        @6471 CNDTTME5 $CHAR2.
        @6473 CNDTUNT5 $CHAR2.
        @6475 BLANK151 $CHAR2.
        @6477 OTHADMN5 $CHAR2.
        @6479 BLANK152 $CHAR5.
        @6484 RESTNUM6 $CHAR2.
        @6486 ADMSNPC6 $CHAR2.
        @6488 BLANK153 $CHAR30.
        @6518 ENTERFM6 $CHAR2.
        @6520 BLANK154 $CHAR30.
        @6550 YEARETR6 $CHAR2.
        @6552 NURSCRE6 $CHAR2.
        @6554 SURGRCP6 $CHAR2.
        @6556 NEEDHLP6 $CHAR2.
        @6558 REQSPCD6 $CHAR2.
        @6560 CONFUSD6 $CHAR2.
        @6562 MDCNTR16 $CHAR2.
        @6564 MDCNTR26 $CHAR2.
        @6566 MDCNTR36 $CHAR2.
        @6568 MDCNTR46 $CHAR2.
        @6570 MDCNTR56 $CHAR2.
        @6572 MDCNTR66 $CHAR2.
        @6574 CNDTLZH6 $CHAR2.
        @6576 CNDTCNR6 $CHAR2.
        @6578 CNDTDPS6 $CHAR2.
        @6580 CNDTFRL6 $CHAR2.
        @6582 CNDTHDR6 $CHAR2.
        @6584 CNDTINN6 $CHAR2.
        @6586 CNDTNMD6 $CHAR2.
        @6588 CNDTSNL6 $CHAR2.
        @6590 CNDTSTK6 $CHAR2.
        @6592 CNDTOTH6 $CHAR2.
        @6594 BLANK155 $CHAR30.
        @6624 CNDTART6 $CHAR2.
        @6626 CNDTDRG6 $CHAR2.
        @6628 CNDTHPF6 $CHAR2.
        @6630 CNDTOFC6 $CHAR2.
        @6632 CNDTHTC6 $CHAR2.
        @6634 CNDTDIB6 $CHAR2.
        @6636 CNDTBLD6 $CHAR2.
        @6638 CNDTOST6 $CHAR2.
        @6640 CNDTPRK6 $CHAR2.
        @6642 CNDTTME6 $CHAR2.
        @6644 CNDTUNT6 $CHAR2.
        @6646 BLANK156 $CHAR2.
        @6648 OTHADMN6 $CHAR2.
        @6650 BLANK157 $CHAR5.
        @6655 HOSPNM1  $CHAR2.
        @6657 SHOSTT1  $CHAR2.
        @6659 BLANK158 $CHAR30.
        @6689 CONDMN1  $CHAR2.
        @6691 CONDDY1  $CHAR2.
        @6693 CONDYR1  $CHAR2.
        @6695 BLANK159 $CHAR40.
        @6735 B113DS1  $CHAR2.
        @6737 BLANK160 $CHAR5.
        @6742 HOSPNM2  $CHAR2.
        @6744 SHOSTT2  $CHAR2.
        @6746 BLANK161 $CHAR30.
        @6776 CONDMN2  $CHAR2.
        @6778 CONDDY2  $CHAR2.
        @6780 CONDYR2  $CHAR2.
        @6782 BLANK162 $CHAR40.
        @6822 B113DS2  $CHAR2.
        @6824 BLANK163 $CHAR5.
        @6829 HOSPNM3  $CHAR2.
        @6831 SHOSTT3  $CHAR2.
        @6833 BLANK164 $CHAR30.
        @6863 CONDMN3  $CHAR2.
        @6865 CONDDY3  $CHAR2.
        @6867 CONDYR3  $CHAR2.
        @6869 BLANK165 $CHAR40.
        @6909 B113DS3  $CHAR2.
        @6911 BLANK166 $CHAR5.
        @6916 HOSPNM4  $CHAR2.
        @6918 SHOSPTT4 $CHAR2.
        @6920 BLANK167 $CHAR30.
        @6950 CONDMN4  $CHAR2.
        @6952 CONDDY4  $CHAR2.
        @6954 CONDYR4  $CHAR2.
        @6956 BLANK168 $CHAR40.
        @6996 B113D4   $CHAR2.
        @6998 BLANK169 $CHAR5.
        @7003 HOSPNM5  $CHAR2.
        @7005 SHOSTT5  $CHAR2.
        @7007 BLANK170 $CHAR30.
        @7037 CONDMN5  $CHAR2.
        @7039 CONDDY5  $CHAR2.
        @7041 CONDYR5  $CHAR2.
        @7043 BLANK171 $CHAR40.
        @7083 B113DS5  $CHAR2.
        @7085 BLANK172 $CHAR5.
        @7090 HOSPNM6  $CHAR2.
        @7092 SHOSTT6  $CHAR2.
        @7094 BLANK173 $CHAR30.
        @7124 CONDMN6  $CHAR2.
        @7126 CONDDY6  $CHAR2.
        @7128 CONDYR6  $CHAR2.
        @7130 BLANK174 $CHAR40.
        @7170 B113DS6  $CHAR2.
        @7172 BLANK175 $CHAR5.
        @7177 HOSPNM7  $CHAR2.
        @7179 SHOSTT7  $CHAR2.
        @7181 BLANK176 $CHAR30.
        @7211 CONDMN7  $CHAR2.
        @7213 CONDDY7  $CHAR2.
        @7215 CONDYR7  $CHAR2.
        @7217 BLANK177 $CHAR40.
        @7257 B113DS7  $CHAR2.
        @7259 BLANK178 $CHAR5.
        @7264 HOSPNM8  $CHAR2.
        @7266 SHOSTT8  $CHAR2.
        @7268 BLANK179 $CHAR30.
        @7298 CONDMN8  $CHAR2.
        @7300 CONDDY8  $CHAR2.
        @7302 CONDYR8  $CHAR2.
        @7304 BLANK180 $CHAR40.
        @7344 B113DS8  $CHAR2.
        @7346 BLANK181 $CHAR5.
        @7351 HOSPNM9  $CHAR2.
        @7353 SHOSTT9  $CHAR2.
        @7355 BLANK182 $CHAR30.
        @7385 CONDMN9  $CHAR2.
        @7387 CONDDY9  $CHAR2.
        @7389 CONDYR9  $CHAR2.
        @7391 BLANK183 $CHAR40.
        @7431 B113DS9  $CHAR2.
        @7433 BLANK184 $CHAR5.
        @7438 HOSPNM10 $CHAR2.
        @7440 SHOSTT10 $CHAR2.
        @7442 BLANK185 $CHAR30.
        @7472 CONDMN10 $CHAR2.
        @7474 CONDDY10 $CHAR2.
        @7476 CONDYR10 $CHAR2.
        @7478 BLANK186 $CHAR40.
        @7518 B113DS10 $CHAR2.
        @7520 BLANK187 $CHAR5.
        @7525 HOSPNM11 $CHAR2.
        @7527 SHOSTT11 $CHAR2.
        @7529 BLANK188 $CHAR30.
        @7559 CONDMN11 $CHAR2.
        @7561 CONDDY11 $CHAR2.
        @7563 CONDYR11 $CHAR2.
        @7565 BLANK189 $CHAR40.
        @7605 B113DS11 $CHAR2.
        @7607 BLANK190 $CHAR5.
        @7612 HOSPNM12 $CHAR2.
        @7614 SHOSTT12 $CHAR2.
        @7616 BLANK191 $CHAR30.
        @7646 CONDMN12 $CHAR2.
        @7648 CONDDY12 $CHAR2.
        @7650 CONDYR12 $CHAR2.
        @7652 BLANK192 $CHAR40.
        @7692 B113DS12 $CHAR2.
        @7694 BLANK193 $CHAR5.
        @7699 HOSPNM13 $CHAR2.
        @7701 SHOSTT13 $CHAR2.
        @7703 BLANK194 $CHAR30.
        @7733 CONDMN13 $CHAR2.
        @7735 CONDDY13 $CHAR2.
        @7737 CONDYR13 $CHAR2.
        @7739 BLANK195 $CHAR40.
        @7779 B113DS13 $CHAR2.
        @7781 BLANK196 $CHAR5.
        @7786 HOSPNM14 $CHAR2.
        @7788 SHOSTT14 $CHAR2.
        @7790 BLANK197 $CHAR30.
        @7820 CONDMN14 $CHAR2.
        @7822 CONDDY14 $CHAR2.
        @7824 CONDYR14 $CHAR2.
        @7826 BLANK198 $CHAR40.
        @7866 B113DS14 $CHAR2.
        @7868 BLANK199 $CHAR5.
        @7873 HOSPNM15 $CHAR2.
        @7875 SHOSTT15 $CHAR2.
        @7877 BLANK200 $CHAR30.
        @7907 CONDMN15 $CHAR2.
        @7909 CONDDY15 $CHAR2.
        @7911 CONDYR15 $CHAR2.
        @7913 BLANK201 $CHAR40.
        @7953 B113DS15 $CHAR2.
        @7955 HCFSR01  $CHAR2.
        @7957 HCFSR02  $CHAR2.
        @7959 HCFSR03  $CHAR2.
        @7961 HCFSR04  $CHAR2.
        @7963 HCFSR05  $CHAR2.
        @7965 HCFSR06  $CHAR2.
        @7967 BLANK202 $CHAR2.
        @7969 HCFSR08  $CHAR2.
        @7971 HCFSR09  $CHAR2.
        @7973 HCFSR10  $CHAR2.
        @7975 HCFSR11  $CHAR2.
        @7977 HCFSR12  $CHAR2.
        @7979 HCFSR13  $CHAR2.
        @7981 BLANK203 $CHAR2.
        @7983 HCFSR15  $CHAR2.
        @7985 HCFSR16  $CHAR2.
        @7987 HCFSR17  $CHAR2.
        @7989 HCFSR18  $CHAR2.
        @7991 HCFSR19  $CHAR2.
        @7993 HCFSR20  $CHAR2.
        @7995 HCFSR21  $CHAR2.
        @7997 HCFSR22  $CHAR2.
        @7999 HCFSR23  $CHAR2.
        @8001 HCFSR24  $CHAR2.
        @8003 HCFSR25  $CHAR2.
        @8005 HCFSR26  $CHAR2.
        @8007 HCFSR27  $CHAR2.
        @8009 HCFSR28  $CHAR2.
        @8011 HCFSR29  $CHAR2.
        @8013 HCFSR30  $CHAR2.
        @8015 HCFSR31  $CHAR2.
        @8017 HCFSR32  $CHAR2.
        @8019 HCFSR33  $CHAR2.
        @8021 HCFSR34  $CHAR2.
        @8023 HCFSR35  $CHAR2.
        @8025 HCFSR36  $CHAR2.
        @8027 HCFSR37  $CHAR2.
        @8029 CAUSEDTH $CHAR4.
        @8033 STRATUM  $CHAR2.
        @8035 PSU      $CHAR3.
        @8038 SUBSAMPL $CHAR1.
        @8039 SWGT1    $CHAR6.
        @8045 SWGT2    $CHAR6.
        @8051 SWGT3    $CHAR6.
        @8057 SWGT4    $CHAR6.
        @8063 SWGT5    $CHAR6.
        @8069 SWGT6    $CHAR6.
        ;                                                                    
*** THIS NEXT STATEMENT ASSIGNS LABELS *** ;                                                                                
LABEL HANESEQ  = 'SAMPLE SEQUENCE NUMBER'
      LINTSTAT = 'MOST RECENT COMPLETED INTERVIEW'
      LINTDATE = 'DATE OF MOST RECENT COMPLETED INTERVIEW'
      LSSEX    = 'SEX OF SUBJECT'
      LNDOB    = 'S DATE OF BIRTH'
      LNURSING = 'RESIDENCE OF NURSING HOME REP PREV INT'
      LMARITAL = 'MARITAL STATUS REPORTED IN PREV INT'
      LWORKHST = 'R REPORTED WORKING IN ANY PREV INT'
      LWRKDATE = 'DATE S LAST REPORTED WORKING IN PREV INT'
      LMOMDEAD = 'S MOTHER REP AS DECEASED IN PREV INT'
      LDADDEAD = 'S FATHER REP AS DECEASED IN PREV INT'
      LARTH    = 'REPORTED ARTHRITIS IN PREVIOUS INT'
      LARTHYR  = 'YR ARTHRITIS DIAGNOSED REP IN PREV INT'
      LARTHTYP = 'TYPE OF ARTHRITIS REP IN PREV INT'
      LARTHXRY = 'X-RAY FOR ARTHRITIS REP IN PREV INT'
      LGOUT    = 'GOUT REPORTED IN PREVIOUS INTERVIEW'
      LARTGOUT = 'ARTHRITIS CAUSED BY GOUT REP IN PREV INT'
      LHATTACK = 'HEART ATTACK REP IN PREVIOUS INTERVIEW'
      LHRTCOND = 'HEART CONDITION REP IN PREVIOUS INT'
      LCBPSURG = 'CORONARY BY-PASS SURGERY REP IN PREV INT'
      LPACEMAK = 'PACEMAKER REPORTED IN PREVIOUS INTERVIEW'
      LSTROKE  = 'STROKE PREPORTED IN PREVIOUS INTERVIEW'
      LDIABETE = 'DIABETES REPORTED IN PREVIOUS INTERVIEW'
      LHICHOL  = 'HIGH CHOLESTEROL REPORTED IN PREV INT'
      LHIGHBP  = 'HIGH BLOOD PRESSURE REP IN PREV INT'
      LHIBPMED = 'HIGH BP MEDICINE REPORTED IN PREV INT'
      LCANCER  = 'CANCER REPORTED IN PREVIOUS INTERVIEW'
      LBRSTCAN = 'BREAST CANCER REPORTED IN PREV INT'
      LBCANCYR = 'YR BRST CANCER DIAGNOSED REP IN PREV INT'
      LSKNCANC = 'SKIN CANCER REPORTED IN PREVIOUS INT'
      LBROKHIP = 'BROKEN/FRACTURED HIP REP IN PREV INT'
      LBKHIPYR = 'YR BROKEN HIP DIAGNOSED REP IN PREV INT'
      LOSTEO   = 'OSTEOPORSIS REPORTED IN PREVIOUS INT'
      LBRKWRST = 'BORKEN/FRACTURED WRIST REP IN PREV INT'
      LKIDNEY  = 'KIDNEY DISORDERS/STONES REP IN PREV INT'
      LUTI     = 'URINARY TRACT/KIDNEY INFEC REP PREV INT'
      LCATRACT = 'CATARACTS REPORTED IN PREVIOUS INT'
      LCATSURG = 'CATARACT SURGERY REP IN PREV INT'
      LVASECT  = 'VASECTOMY REPORTED IN PREV INTERVIEW'
      LSMOKER  = 'SMOKING REPORTED IN PREVIOUS INTERVIEW'
      LWTAGE12 = 'AGE 12 BODY WEIGHT REP IN PREV INT'
      LHTAGE12 = 'AGE 12 HEIGHT REPORTED IN PREV INT'
      LWTAGE25 = 'AGE 25 BODY WEIGHT REP IN PREV INT'
      LWTAGE40 = 'AGE 40 BODY WEIGHT REP IN PREV INT'
      LWTAGE65 = 'AGE 65 BODY WEIGHT REP IN PREV INT'
      LCALCIUM = 'CALCIUM USE REPORTED IN PREV INT'
      LHEARAID = 'HEARING AID USE REPORTED IN PREV INT'
      LPREG    = 'AT LEAST ONE PREGNANCY REP IN PREV INT'
      LUTERUS  = 'UTERUS REPORTED REMOVED IN PREV INT'
      LUTERAGE = 'AGE WHEN UTERUS WAS REMOVED IN PREV INT'
      LOVARIES = 'BOTH OVARIES REP REMOVED IN PREV INT'
      LONEOVAR = 'ONE OVARY REPORTED REMOVED IN PREV INT'
      LOVARAGE = 'AGE LAST OVARY REP REMOVED IN PREV INT'
      LMENSTAT = 'MENSTRUAL STATUS REP IN PREV INT'
      LPROVERA = 'PROVERA USAGE REPORTED IN PREV INT'
      LHORMONE = 'HORMONE PILL USAGE REP IN PREV INT'
      LHORMAGE = 'AGE HORMONES FIRST TAKEN REP PREV INT'
      LORALCON = 'BIRTH CONTROL PILL USAGE REP PREV INT'
      LAGEOC25 = 'BC PILL USAGE BEFORE AGE 25 REP PREV INT'
      LLENOC25 = 'LENGTH OF BCP USAGE <AGE 25 REP PREV INT'
      LLIVEBTH = 'AT LEAST ONE BIRTH REP IN PREV INT'
      LOCBFBTH = 'BCP USAGE < FIRST CHILD REP PREV INT'
      LFEMSTER = 'FEMALE STERILIZATION REP IN PREV INT'
      LPAPSMER = 'PAP SMEAR REPORTED IN PREVIOUS INT'
      LASTSPAN = 'PREV INTERVIEW CONDUCTED IN SPANISH'
      LPHOSP   = 'HOSPITALIZATIONS REP IN PREV INT'
      LNAGE    = 'S AGE FROM PREVIOUS INTERVIEW'
      RSLTDATE = 'DATE OF INTERVIEW1992 NHEFS'
      RSLTMO   = 'MONTH OF 1992 INTERVIEW'
      RSLTDY   = 'DAY OF 1992 INTERVIEW'
      RSLTYR   = 'YEAR OF 1992 INTERVIEW'
      GPIDAT87 = 'DATE OF INTERVIEW1987 NHEFS'
      IDATMM87 = 'MONTH OF 1987 INTERVIEW'
      IDATDY87 = 'DAY OF 1987 INTERVIEW'
      IDATYR87 = 'YEAR OF 1987 INTERVIEW'
      GPIDAT86 = 'DATE OF INTERVIEW1986 NHEFS'
      IDATMM86 = 'MONTH OF 1986 INTERVIEW'
      IDATDY86 = 'DAY OF 1986 INTERVIEW'
      IDATYR86 = 'YEAR OF 1986 INTERVIEW'
      GPIDAT82 = 'DATE OF INTERVIEW1982-1984 NHEFS'
      IDATMM82 = 'MONTH OF 1982 INTERVIEW'
      IDATDY82 = 'DAY OF 1982 INTERVIEW'
      IDATYR82 = 'YEAR OF 1982 INTERVIEW'
      GPEXDATE = 'DATE OF NHANES I EXAM'
      EXAMMON  = 'MONTH OF EXAM'
      EXAMDAY  = 'DAY OF EXAM'
      EXAMYEAR = 'YEAR OF EXAM'
      MAINRSLT = 'INTERVIEW COMPLETION STATUS'
      QDIS87   = '1987 NHEFS DISPOSITION CODE'
      QDIS86   = '1986 NHEFS DISPOSITION CODE'
      QDIS82   = '1982 NHEFS DISPOSITION CODE'
      RESPTYPE = '1992 NHEFS RESPONDENT TYPE'
      HCHARFLG = 'ONE OR MORE HOSP STAYS REP92 NHEFS'
      QVERSION = '1992 NHEFS METHOD OF DATA COLLECTION'
      NAGE     = 'AGE OF S AT 1992 FOLLOWUP'
      AGE87    = 'AGE OF S AT 1987 NHEFS INTERVIEW'
      AGE86    = 'AGE OF S AT 1986 NHEFS INTERVIEW'
      AGE82    = 'AGE OF S AT 1982-84 NHEFS INTERVIEW'
      EXAMAGE  = 'AGE OF S AT NHANES I EXAM'
      TRACSTAT = 'S VITAL STATUS 1992 NHEFS'
      VITLST87 = 'S VITAL STATUS 1987 NHEFS'
      VITLST86 = 'S VITAL STATUS 1986 NHEFS'
      VITLST82 = 'S VITAL STATUS 1982-84 NHEFS'
      ELIGECF  = 'ELIGIBILITY OF S FOR 1986 FOLLOWUP'
      REVRACE  = 'REVISED RACE'
      DCRECD   = '1992 NHEFS DEATH CERT. RECEIPT FLAG'
      PROXRELA = 'RELATIONSHIP OF PROXY'
      PROXRELI = 'RELATIONSHIP OF PROXY TO INCAPACITATED S'
      PROXRELD = 'RELATIONSHIP OF PROXY TO DECEASED S'
      DAGE     = 'S AGE AT DEATH'
      DOD      = 'DATE OF DEATH'
      NEWDODMO = 'MONTH OF DEATH'
      NEWDODDA = 'DAY OF DEATH'
      NEWDODYR = 'YEAR OF DEATH'
      AGE92    = 'AGE OF S AT 1992 NHEFS INTERVIEW'
      LIVEARRG = 'CURRENT LIVING ARRANGEMENT OF S'
      SDIENRHM = 'S IN NURSING HOME OR FAC AT TIME DEATH'
      PRXLIVWD = 'DID R LIVE W/ S ONE YR PRIOR TO DEATH'
      PRXVISTD = 'FREQUENTLY R VISITED S IN YR BEFORE DEATH'
      NHCONTU  = 'S CONTINUOUSLY LIVED IN NURSING HM'
      SAMENH   = 'SAME NURSING HOME S WAS PREV LIVING IN'
      NUMSLIVE = 'NUMBER OF PERSONS LIVING IN S CURRENT HH'
      SPSEXDIS = 'SPOUSE SAME SEX AS S/DISCREPENCY FLAG'
      NUMSPDIS = '> ONE SPOUSE REPORTED/DISCREPENCY FLAG'
      GPLGTHAL = 'LENGTH OF TIME S HAD LIVE ALONE'
      LGTHALNE = 'NUMBER OF MONTHS OR YRS S LIVED ALONE'
      LGTHUNIT = 'TIME PERIOD RESPONDED IN'
      NUMSLVED = '# PRSNS LIVING IN S HH BEFORE S NURS HM'
      GPLGTHA2 = 'LENGTH OF TIME LIVED ALONE'
      LGTHALN2 = 'NUMBER OF MONTHS OR YRS S LIVED ALONE'
      LGTHUNT2 = 'TIME PERIOD RESPONDED IN'
      MARRSTAT = 'CURRENT MARITAL STATUS OF S'
      SUBJRACE = 'RACE OF S'
      HISPANIC = 'IS S OF HISPANIC ORIGIN?'
      DOINGMST = 'WHAT HAS S BEEN DOING DURING LAST 3 MOS'
      HRSWKJB1 = 'HOW MANY HRS A WEEK DOES S WORK (AVG)'
      WORKJOB  = 'HAS S WORKED DURING THE LAST 3 MOS'
      HRSWKJB2 = 'HOW MANY HRS A WEEK DID S WORK (AVG)'
      EXPTWORK = 'DOES S EXPECT TO WORK IN FUTURE'
      EXFULPAR = 'DOES S EXPECT TO WORK FT OR PT'
      CUTHOURS = 'DOC SUGGEST S CUT BACK WORK HOURS'
      YRTOLD   = 'WHAT YR WAS S TOLD TO CUT WORK HOURS'
      STPJBHEA = 'S STOP WRK B/C OF HEALTH RELATED REAS'
      GPLASTWK = 'MONTH OR YEAR LAST WORKED'
      MOLASTWK = 'IN WHAT MONTH DID S LAST WORK'
      YRLASTWK = 'IN WHAT YEAR DID S LAST WORK'
      A22DISF  = 'DISCREPANCY FLAG FOR A22'
      MOMALIVE = 'IS S NATURAL MOTHER STILL LIVING'
      MOMAGED  = 'HOW OLD WAS S MOTHER WHEN SHE DIED'
      DADALIVE = 'IS S NATURAL FATHER STILL LIVING'
      DADAGED  = 'HOW OLD WAS S FATHER WHEN HE DIED'
      PRXMHQD  = 'PROXY ANSWER QUES DECEASED S MED HIS'
      GENERAL  = 'IN GENERAL, HOW IS S HEALTH'
      JOINTS   = 'PAST YR PAIN/SWELLING/STIFFNESS'
      DREVRTEL = 'DOCTOR SAY WHAT TYPE ARTHRITIS S HAS'
      FRSTARTH = 'WHAT YR WAS S FIRST TOLD ABOUT ARTH'
      B4DISF   = 'DISCREPANCY FLAG FOR B4'
      DRARTHR  = 'DOCTOR SAY WHAT TYPE OF ARTH S HAS'
      OSTEOART = 'DOES S HAVE OSTEOARTHRITIS'
      RHEUMATD = 'DOES S HAVE RHEUMATOID ARTHRITIS'
      OTHRTYPE = 'DOES S HAVE SOME OTHER TYPE OF ARTH'
      XRYJOINT = 'HAS S EVER HAD AN X-RAY FOR ARTHRITIS'
      FRSTXRAY = 'HOW LONG AGO DID S FIRST XRAY FOR ARTH'
      LASTXRAY = 'HOW LONG AGO DID S LAST XRAY FOR ARTH'
      GOUT     = 'DID DOCTOR EVER SAY S HAS GOUT'
      SINCGOUT = 'HAS S HAD AN ADDITIONAL EPISODE OF GOUT'
      FRSTGOUT = 'WHAT YR WAS S FIRST TOLD ABOUT GOUT'
      B12DISF  = 'DISCREPANCY FLAG FOR B12'
      MEMGOUT1 = 'TM PD SINCE S WAS FIRST TOLD ABOUT GOUT'
      LASTGOUT = 'WHAT YR DID S HAVE LAST GOUT EPISODE'
      B14DISF  = 'DISCREPANCY FLAG FOR B14'
      MEMGOUT2 = 'TIME PD SINCE S HAD LAST GOUT EPISODE'
      ARTHGOUT = 'DOCTOR SAY S HAD ARTH CAUSED BY GOUT'
      HOSPGOUT = 'WAS S HOSPITALIZED FOR ARTH OR GOUT'
      HEARTATK = 'HAS S HAS A HEART ATT SINCE PREV INT'
      EVERATT  = 'DID DOCTOR EVER SAY S HAD A HEART ATT'
      FIRSTATT = 'WHAT YR WAS S FRST TOLD ABOUT HEART ATT'
      B20DISF  = 'DISCREPANCY FLAG FOR B20'
      SINCEART = 'HAS S HAD ADDTL HEART ATTACK SINCE THEN'
      ATTKYR1  = 'WHAT YR WAS THAT 1ST ADDTL HEART ATT'
      ATTKYR2  = 'WHAT YR WAS THAT 2ND ADDTL HEART ATT'
      ATTKYR3  = 'WHAT YR WAS THAT 3RD ADDTL HEART ATT'
      ATTKYR4  = 'WHAT YR WAS THAT 4TH ADDTL HEART ATT'
      B22DISF1 = 'DISCREPANCY FLAG FOR B22 (1ST RESPONSE)'
      B22DISF2 = 'DISCREPANCY FLAG FOR B22 (2ND RESPONSE)'
      B22DISF3 = 'DISCREPANCY FLAG FOR B22 (3RD RESPONSE)'
      B22DISF4 = 'DISCREPANCY FLAG FOR B22 (4TH RESPONSE)'
      HOSPHATK = 'WAS S HOSPITALIZED FOR HEART ATTACK'
      HOSPHOTH = 'WAS S HOSP FOR ANY OTHER HEART COND'
      ADDBYPAS = 'HAS S HAD ADDTL CORONARY BY-PASS SURG'
      CORONBYP = 'HAS S EVER HAS CORONARY BY-PASS SURG'
      HOSPBYPS = 'WAS S HOSP FOR CORONARY BY-PASS SURG'
      PACEMAKR = 'HAS S EVER HAD A PACEMAKER INSERTED'
      HOSPPACE = 'S HOSP FOR PCEMKR INSERT/REPAIR/REPLACE'
      ADDSTRKE = 'HAS S HAD A STROKE SINCE PREV INT'
      CVA      = 'DID DOCTOR EVER SAY S HAD A STROKE'
      STRKYR1  = 'WHAT YR WAS S FIRST TOLD ABOUT STROKE'
      B32DISF  = 'DISCREPANCY FLAG FOR B32'
      ADDISTRK = 'HAS S HAD AN ADDTL STOKE SINCE THEN'
      STYR2_1  = 'WHAT YR WAS THAT FIRST ADDTL STROKE'
      STYR2_2  = 'WHAT YR WAS THAT SECOND ADDTL STOKE'
      B34DISF1 = 'DISCREPANCY FLAG FOR B34 (1ST RESPONSE)'
      B34DISF2 = 'DISCREPANCY FLAG FOR B34 (2ND RESPONSE)'
      HOSPSTRK = 'WAS S HOSPITALIZED FOR STROKE'
      CANRESP1 = 'R ANS QUES ABOUT DECEASED S MED HIST'
      STRARMLG = 'DOES S HAVE WEAK ARM AND LEG FROM STROKE'
      STRWALK  = 'DOES S HAVE TROUBLE WALKING FROM STROKE'
      STRTALK  = 'DOES S HAVE TROUBLE TALKING FROM STROKE'
      STRTRBLE = 'S HAVE SOME OTHER TROUBLE FROM STROKE'
      DIABMED  = 'IS S NOW TAKING MED FOR DIABETES'
      SUGRDIAB = 'DID DOCTOR EVER SAY S HAD DISBETES'
      DIABYR1  = 'WHAT YR WAS S FIRST TOLD ABOUT DIABETES'
      B39DISF  = 'DISCREPANCY FLAG FOR B39'
      INSLNDB  = 'S TAKING INSULIN INJECTIONS FOR DIAB'
      ORALDB   = 'S TAKING ORAL MED FOR DIABETES'
      HOSPDIAB = 'S HOSPITALIZED FOR DIABETES'
      HIGHBLCH = 'DR EVER SAY S HAD HIGH BLOOD CHOLESTER'
      BLCHNOW  = 'S CURR HAVE HIGH BLD CHOLESTEROL'
      BLCHYR   = 'YR S FRST TOLD HAD HIGH BLD CHOLES'
      BLCHMED1 = 'DR PRESCRIBE MED FOR HIGH BLD CHOLES'
      BLCHMED2 = 'S NOW TAKING MED FOR HIGH BLD CHOLES'
      HYPER    = 'DR EVER SAY S HAD HIGH BLD PRESS/HYPTN'
      HBPYEAR1 = 'YR S FIRST TOLD ABOUT HIGH BLD PRESS'
      B49DISF  = 'DISCREPANCY FLAG FOR B49'
      PRESCMED = 'DR EVER PRESCRIBE MED HIGH BLD PRESS'
      MEDREGLR = 'S CURRENTLY TAKE HIGH BLD PRESS MED REG'
      HOSPHBP  = 'S HOSPITALIZED FOR HIGH BLD PRESS'
      WGHTCONT = 'S CURRENTLY CONTROLLING WEIGHT'
      WGHTREAS = 'S CONTROLLING WGT FOR HEALTH REASONS'
      BRCANCER = 'A DR SAY S HAD BREAST CANCER'
      BRCANYR  = 'YR S FRST TOLD BY DOC S HAD BRST CANC'
      B56DISF  = 'DISCREPANCY FLAG FOR B56'
      SKINCANC = 'A DR EVER SAY THAT S HAD SKIN CANC'
      SKCANMM  = 'S HAVE MALIGNANT MELANOMA'
      SKCANOT  = 'S HAVE SOME OTHER TYPE OF SKIN CANCER'
      SKCANYR1 = 'YR S FRST TOLD HAD MALIG MELANOMA'
      B59DISF  = 'DISCREPANCY FLAG FOR B59'
      HOSPSKN1 = 'WAS S HOSPITALIZED FOR MALIG MELANOMA'
      SKCANYR2 = 'YR S FIRST TOLD HAD NON-MALIG MELANOMA'
      B61DISF  = 'DISCREPANCY FLAG FOR B61'
      SKCANNUM = 'NUM TIMES NON-MALIG MELAN SKIN CANC DIAG'
      HOSPSKN2 = 'WAS S HOSP FOR NON-MALIG MELAN SKIN CANC'
      CANCTYPE = 'HAS S HAD OTHER SKIN CANC SINC PREV INT'
      CANCRSRT = 'DR EVER SAY S HAD CANCER OF ANY SORT'
      HOSPCAN1 = 'S HOSPITALIZED FOR ANY OTHER CANCER COND'
      CANCCNT  = 'NUMBER OF TYPES OF CANCER REPORTED'
      OSURCAN  = 'S EVER HAD OUT-PATIENT SURG FOR ANY CANC'
      OSURCNT  = 'NUM OF OUT-PATIENT CANC SURGS REPORTED'
      FHADCANC = 'ANY RELATIVES TOLD BY DOC THEY HAD CANC'
      CRELCNT  = 'NUM CANC REPORTS AMONG BLOOD RELATIVES'
      HIPYEAR1 = 'WHAT YR WAS S FIRST TOLD ABOUT FRAC HIP'
      B74DISF  = 'DISCREPANCY FLAG FOR B74'
      FRACHIP  = 'HAS S HAD A FRAC HIP SINCE PREV INT'
      CANRESP2 = 'R CONT ANS QUES ABOUT DECEASED S MED HIS'
      BRKNHIP  = 'DID DOC EVER SAY S HAD A FRAC HIP'
      HIPYEAR2 = 'WHAT YR S FIRST TOLD ABOUT FRAC HIP'
      B77DISF  = 'DISCREPANCY FLAG FOR B77'
      ANTHRHIP = 'S HAD AN ADDTL FRAC HIP SINCE THEN'
      HIPYR2_1 = 'WHAT YR WAS THAT IST ADDTL HIP FRAC'
      HIPYR2_2 = 'WHAT YR WAS THAT 2ND ADDTL HIP FRAC'
      HIPYR2_3 = 'WHAT YR WAS THAT 3RD ADDTL HIP FRAC'
      HIPYR2_4 = 'WHAT YR WAS THAT 4TH ADDTL HIP FRAC'
      B79DISF1 = 'DISCREPANCY FLAG FOR B79 (1ST RESP)'
      B79DISF2 = 'DISCREPANCY FLAG FOR B79 (2ND RESP)'
      B79DISF3 = 'DISCREPANCY FLAG FOR B79 (3RD RESP)'
      B79DISF4 = 'DISCREPANCY FLAG FOR B79 (4TH RESP)'
      HOSPFRAC = 'S HOSP FOR FRACTURED HIP'
      OSTEOPOR = 'DR EVER SAY S HAD OSTEOPOROSIS'
      OSTEOYR  = 'YR S FIRST TOLD ABOUT OSTEOP'
      B82DISF  = 'DISCREPANCY FLAG FOR B82'
      ADBKWRST = 'S HAD A BROKEN WRIST SINCE PREV INT'
      BRKNWRST = 'DR EVER SAY S HAD A BROKEN WRST'
      WRSTYR1  = 'YEAR FIRST ADDTL BROKEN WRIST'
      WRSTYR2  = 'YEAR SECOND ADDTL BROKEN WRST'
      WRSTYR3  = 'YEAR THIRD ADDTL BROKEN WRIST'
      WRSTYR4  = 'YEAR FOURTH ADDTL BROKEN WRST'
      B85DISF1 = 'DISCREPANCY FLAG FOR B85 (1ST RESP)'
      B85DISF2 = 'DISCREPANCY FLAG FOR B85 (2ND RESP)'
      B85DISF3 = 'DISCREPANCY FLAG FOR B85 (3RD RESP)'
      B85DISF4 = 'DISCREPANCY FLAG FOR B85 (4TH RESP)'
      FALLS    = 'DURING PAST 12MOS, S HAD ANY FALLS?'
      NUMFALLS = 'HOW MANY TIMES HAS S FALLEN PAST 12MOS'
      FALLBKBN = 'ANY FALLS CAUSE A BROKEN BONE'
      FALLHEAD = 'ANY FALL CAUSE S TO HIT OR INJURE HEAD'
      FALLMEDC = 'ANY FALL CAUSE S TO SEEK MED CARE'
      HOSPFALL = 'S HOSP FOR ANY OF THESE FALLS'
      VFALL    = 'VERIFY NO/Q.B88C YES/Q.B89'
      HOSPFLU  = 'S HOSPITALIZED FOR PNEUMONIA'
      KIDNYST  = 'S HAD KIDNEY DIS/STONE SINCE PREV INT'
      EVERKDNY = 'DR EVER SAY S HAD KIDNEY DIS/STONE'
      YRTELKID = 'YR S FIRST TOLD ABOUT KIDNEY DIS/STONE'
      B93DISF  = 'DISCREPANCY FLAG FOR B93'
      KIDINFEC = 'S HAD A URINARY/KIDNEY INFEC PREV INT'
      DOCKID   = 'DR SAY S HAD URINARY/KIDNEY INFEC > 3X'
      FRSTOLDK = 'YR S FRST TOLD S HAD UNINARY/KID INFEC'
      B96DISF  = 'DISCREPANCY FLAG FOR B96'
      HOSPKIDN = 'S BEEN HOSP FOR A KIDNEY COND OR UTI'
      HERNIA   = 'DR SAY S HAS A HERNIA OR RUPTURE'
      HIHERNIA = 'A HIATAL OF THE DIAPHRAGM'
      RUPTURE  = 'A HERNIA OR RUPTURE OF THE GROIN'
      VENTRAL  = 'A VENTRAL HERNIA'
      UMBIL    = 'AN UMBILICAL HERNIA'
      OTHRHERN = 'SOME OTHER TYPE OF HERNIA OR RUPTURE'
      HERNYR1  = 'YR S FRST TOLD OF HERN/RUP OF GROIN'
      B100DISF = 'DISCREPANCY FLAG FOR B100'
      HERNSURG = 'S EVER HAD SURG FOR A GROIN HERNIA'
      HERNYR_1 = 'YR 1ST SURG FOR HERNIA OF GROIN OCCUR'
      HERNYR_2 = 'YR 2ND SURG FOR HERNIA OF GROIN OCCUR'
      HERNYR_3 = 'YR 3RD SURG FOR HERNIA OF GROIN OCCUR'
      HERNYR_4 = 'YR 4TH SURG FOR HERNIA OF GROIN OCCUR'
      B102DIS1 = 'DISCREPANCY FLAG FOR B102 (1ST RESP)'
      B102DIS2 = 'DISCREPANCY FLAG FOR B102 (2ND RESP)'
      B102DIS3 = 'DISCREPANCY FLAG FOR B102 (3RD RESP)'
      B102DIS4 = 'DISCREPANCY FLAG FOR B102 (4TH RESP)'
      HERNYR2  = 'YR S FRST TOLD OTHER TYPE HERNIA\RUP'
      B103DISF = 'DISCREPANCY FLAG FOR B103'
      SURGCATR = 'S HAD CATARACT SURG SINCE PREV INT'
      EVERCATR = 'DID DR EVER SAY S HAD CATERACTS'
      CATRSURG = 'S EVER HAD SURG FOR CATERACTS'
      YRCATR1  = 'YR DID S HAVE 1ST CATARACT SURG'
      YRCATR2  = 'YR DID S HAVE 2ND CATARACT SURG'
      B107DIS1 = 'DISCREPANCY FLAG FOR B107 (1ST RESP)'
      B107DIS2 = 'DISCREPANCY FLAG FOR B107 (2ND RESP)'
      HOSPCATR = 'S HOSP >1 DAY FOR CATARACT SURG'
      VASECTMY = 'EVER HAD VASECTOMY'
      AGEVASEC = 'S AGE AT TIME OF VASECTOMY'
      B110DISF = 'DISCREPANCY FLAG FOR B110'
      HOSPOTHR = 'S STAYED IN HOSP FOR ANY OTHER REAS'
      HOSPCNT  = 'NUMBER OF ADDTL HOSP STAYS REPORTED'
      FACIL    = 'S STAYED IN NURSING HM OR NON-HOSP FAC'
      RESTCNT  = 'NUMBER OF REST SEGMENTS'
      STAYFAC1 = 'S IN NURS HM/NON-HOSP FAC LAST INT YR'
      STAYFAC2 = 'WAS S STAYING IN A FACILITY LAST INT YR'
      HEALTH   = 'HEALTH CHANGES DURING LAST 12 MOS'
      PREVMNHT = 'HLTH CHANGE MO BEFORE NH OR DEATH'
      PREVYRHT = 'HLTH CHANGE YR BEFORE NH OR DEATH'
      SUBDIENH = 'DID S DIE IN HOSP OR NURS HOME'
      DTHCAUSE = 'WHAT WAS CAUSE OF S DEATH'
      SUBJCOND = 'DR SAY COND WAS CAUSE OF S DEATH'
      CANRANS  = 'CAN R ANSWER SECTION C'
      STAYBED  = 'STAY IN BED MOST OF DAY'
      GPLNGTHB = 'TIME PERIOD S WAS BEDRIDDEN'
      LNGTHBED = 'NUMBER OF MONTHS/YEARS BEDRIDDEN'
      BEDUNIT  = 'TIME PERIOD RESPONDED IN'
      USELIMBS = 'PROBLEMS PREVENTING USE OF ARMS/LEGS'
      PARALMB  = 'PARALYSIS OF LIMBS'
      AMPUTLMB = 'AMPUTATION OF LIMBS'
      ARTHLMB  = 'SEVERE ARTHRITIS OF LIMB/S'
      OTHLMB   = 'OTHER REASON PREVENTS USE OF LIMB/S'
      PARARUL  = 'PARALYSIS OF RIGHT HAND/ARM'
      PARALUL  = 'PARALYSIS OF LEFT HAND/ARM'
      PARARLL  = 'PARALYSIS OF RIGHT FOOT/LEG'
      PARALLL  = 'PARALYSIS OF LEFT FOOT/LEG'
      AMPUTRUL = 'AMPUTATION OF RIGHT ARM/HAND'
      AMPUTLUL = 'AMPUTATION OF LEFT ARM/HAND'
      AMPUTRLL = 'AMPUTATION OF RIGHT LEG/FOOT'
      AMPUTLLL = 'AMPUTATION OF LEFT LEG/FOOT'
      OTLMBRUL = 'INVOLVEMENT OF RIGHT ARM/HAND'
      OTLMBLUL = 'INVOLVEMENT OF LEFT ARM/HAND'
      OTLMBRLL = 'INVOLVEMENT OF RIGHT LEG/FOOT'
      OTLMBLLL = 'INVOLVEMENT OF LEGT LEG/FOOT'
      LIM_CONT = 'STATUS OF LIMB USE'
      USEEQUIP = 'S USE SPECIAL EQUIP'
      SPBATH   = 'S USE DEVICES IN BATH'
      CANE     = 'S USE CANE'
      ARTLIMBS = 'S USE ARTIFICIAL LIMB'
      WALKER   = 'S USE WALKER OR CRUTCHES'
      WHEELCHR = 'S USE WHEELCHAIR'
      DEVICES  = 'S USE DEVICES FOR DRESSING'
      SPCHAIR  = 'S USE SPECIAL COMMODE'
      EATDEV   = 'S USE EATING DEVICES'
      CFREQ    = 'ACTIVITIES QUESTIONS DETERMINATOR'
      DRESSA   = 'S HAVE DIFFICULTY DRESSING SELF'
      DRESSB   = 'DEGREE OF DIFFICULTY FOR S'
      DRESSC   = 'S HAVE HELP FROM ANOTHER PERSON'
      DRESSD   = 'S USE SPECIAL EQUIPMENT'
      DRESSE   = 'DEGREE OF DIFFICULTY W/EQUIPMENT'
      STANDUPA = 'DIFF STANDING UP FROM ARMLESS CHAIR'
      STANDUPB = 'DEGREE OF DIFFICULTY FOR S'
      STANDUPC = 'S HAVE HELP FROM ANOTHER PERSON'
      STANDUPD = 'S USE SPECIAL EQUIPMENT'
      STANDUPE = 'HOW MUCH DIFFICULTY S HAS'
      INTOBEDA = 'DIFFICULTY GETTIN INTO/OUT OF BED'
      INTOBEDB = 'DEGREE OF DIFFICULTY FOR S'
      INTOBEDC = 'S HAVE HELP FROM ANOTHER PERSON'
      INTOBEDD = 'S USE SPECIAL EQUIPMENT'
      INTOBEDE = 'HOW MUCH DIFFICULTY S HAS'
      MEALSA   = 'DIFFICULTY PREPARING MEALS'
      MEALSB   = 'DEGREE OF DIFFICULTY'
      MEALSC   = 'S HAVE HELP FROM ANOTHER PERSON'
      CUTMEATA = 'DIFFICULTY CUTTING MEAT'
      CUTMEATB = 'DEGREE OF DIFFICULTY'
      CUTMEATC = 'S HAVE HELP FROM ANOTHER PERSON'
      LIFTCUPA = 'DIFFICULTY LIFT CUP/GLASS TO MOUTH'
      LIFTCUPB = 'DEGREE OF DIFFICULTY'
      LIFTCUPC = 'S HAVE HELP FROM ANOTHER PERSON'
      OPNMILKA = 'DIFFICULTY OPENING A NEW MILK CARTON'
      OPNMILKB = 'DEGREE OF DIFFICULTY'
      OPNMILKC = 'S HAVE HELP FROM ANOTHER PERSON'
      WALKOUTA = 'DIFFICULTY WALKING A QUARTER MILE'
      WALKOUTB = 'DEGREE OF DIFFICULTY'
      WALKOUTC = 'S HAVE HELP FROM ANOTHER PERSON'
      WALKOUTD = 'S USE SPECIAL EQUIPMENT'
      WALKOUTE = 'HOW MUCH DIFFICULTY'
      WALKINA  = 'DIFF WALKING FROM ONE ROOM TO ANOTHER'
      WALKINB  = 'DEGREE OF DIFFICULTY'
      WALKINC  = 'S HAVE HELP FROM ANOTHER PERSON'
      WALKIND  = 'S USE SPECIAL EQUIPMENT'
      WALKINE  = 'HOW MUCH DIFFICULTY'
      STAIRSA  = 'DIFFICULTY WALKING UP/DOWN TWO STAIRS'
      STAIRSB  = 'DEGREE OF DIFFICULTY'
      STAIRSC  = 'S HAVE HELP FROM ANOTHER PERSON'
      STAIRSD  = 'S USE SPECIAL EQUIPMENT'
      STAIRSE  = 'HOW MUCH DIFFICULTY'
      BATHTUBA = 'DIFFICULTY GETTING IN/OUT OF BATHTUB'
      BATHTUBB = 'DEGREE OF DIFFICULTY'
      BATHTUBC = 'S HAVE HELP FROM ANOTHER PERSON'
      BATHTUBD = 'S USE SPECIAL EQUIPMENT'
      BATHTUBE = 'HOW MUCH DIFFICULTY'
      WASHBODA = 'DIFFICULTY WASHING/DRYING WHOLE BODY'
      WASHBODB = 'DEGREE OF DIFFICULTY'
      WASHBODC = 'S HAVE HELP FROM ANOTHER PERSON'
      TOILETA  = 'DIFFICULTY GETTING ON/OFF THE TOILET'
      TOILETB  = 'DEGREE OF DIFFICULTY'
      TOILETC  = 'S HAVE HELP FROM ANOTHER PERSON'
      TOILETD  = 'S USE SPECIAL EQUIPMENT'
      TOILETE  = 'HOW MUCH DIFFICULTY'
      DOHAIRA  = 'DIFFICULTY COMBING HAIR'
      DOHAIRB  = 'DEGREE OF DIFFICULTY'
      DOHAIRC  = 'S HAVE HELP FROM ANOTHER PERSON'
      REACHA   = 'DIFF REACHING UP AND GETTING DOWN 5LBS'
      REACHB   = 'DEGREE OF DIFFICULTY'
      REACHC   = 'S HAVE HELP FROM ANOTHER PERSON'
      REACHD   = 'S USE SPECIAL EQUIPMENT'
      REACHE   = 'HOW MUCH DIFFICULTY'
      BENDA    = 'DIFF BENDING DOWN AND PICKING UP CLOTHES'
      BENDB    = 'DEGREE OF DIFFICULTY'
      BENDC    = 'S HAVE HELP FROM ANOTHER PERSON'
      BENDD    = 'S USE SPECIAL EQUIPMENT'
      BENDE    = 'HOW MUCH DIFFICULTY'
      OPENJARA = 'DIFF OPENING PREVIOUSLY OPENED JARS'
      OPENJARB = 'DEGREE OF DIFFICULTY'
      OPENJARC = 'S HAVE HELP FROM ANOTHER PERSON'
      OPENJARD = 'S USE SPECIAL EQUIPMENT'
      OPENJARE = 'HOW MUCH DIFFICULTY'
      USEPENA  = 'DIFFICULTY USING PEN/PENCIL FOR WRITING'
      USEPENB  = 'DEGREE OF DIFFICULTY'
      USEPENC  = 'S HAVE HELP FROM ANOTHER PERSON'
      EXITCARA = 'DIFFICULTY GETTING IN/OUT OF CAR'
      EXITCARB = 'DEGREE OF DIFFICULTY'
      EXITCARC = 'S HAVE HELP FROM ANOTHER PERSON'
      EXITCARD = 'S USE SPECIAL EQUIPMENT'
      EXITCARE = 'HOW MUCH DIFFICULTY'
      ERRANDSA = 'DIFFICULTY RUNNING ERRANDS/SHOPPING'
      ERRANDSB = 'DEGREE OF DIFFICULTY'
      ERRANDSC = 'S HAVE HELP FROM ANOTHER PERSON'
      LITEJOBA = 'S HAVE TROUBLE DOING LIGHT CHORES'
      LITEJOBB = 'DEGREE OF DIFFICULTY'
      LITEJOBC = 'S HAVE HELP FROM ANOTHER PERSON'
      LIFTBAGA = 'DIFF LIFTING/CARRYING FULL BAG GROCERIES'
      LIFTBAGB = 'DEGREE OF DIFFICULTY'
      LIFTBAGC = 'S HAVE HELP FROM ANOTHER PERSON'
      HEVYJOBA = 'DIFF DOING HEAVY CHORES HOUSE/YARD'
      HEVYJOBB = 'DEGREE OF DIFFICULTY'
      HEVYJOBC = 'S HAVE HELP FROM ANOTHER PERSON'
      PRXSMDRD = 'PROXY CAN ANSWER SECTION D'
      SMOKE100 = 'EVER SMOKE 100 CIGARETTES A DAY'
      SMOKENOW = 'SMOKE CIGARETTES NOW'
      SMKPERDY = 'HOW MANY CIGARETTES SMOKED PER DAY'
      YRSSMOKE = 'NUMBER OF YEARS SMOKED CIGARETTES'
      GPMONTHS = 'WHEN DID S STOP SMOKING CIGARETTES'
      MONTHSTP = 'MONTH STOPPED SMOKING CIGARETTES'
      YEARSTOP = 'YEAR STOPPED SMOKING CIGARETTES'
      NUMBSMOK = 'NUMBER OF CIGARETTES SMOKED A DAY'
      DIDSMOKE = 'NUMBER OF YEARS SMOKED CIGARETTES'
      CSMKNOW  = 'DOES S SMOKE CIGARETTES NOW'
      CSMKPRDY = 'HOW MANY CIGARETTES SMOKED PER DAY'
      GPNCSMKM = 'DATE S LAST STOPPED SMOKING'
      NCSMKMO  = 'MONTH S STOPPED SMOKING'
      NCSMKYR  = 'YEAR S STOPPED SMOKING'
      D10DISF  = 'DISCREPANCY FLAG FOR D10'
      DRINKYR  = 'IN THE PAST YEAR, HAD ONE DRINK'
      OFTNBEER = 'HOW OFTEN S DRINK BEER IN PAST YR'
      WKMOBEER = 'TUNE UNIT, BEER (WEEK OR MONTH)'
      NUMBBEER = 'NUMBER OF CANS OF BEER'
      OFTNWINE = 'HOW OFTEN S DRINK WINE IN PAST YR'
      WKMOWINE = 'TIME UNIT, WINE (WEEK OR MONTH)'
      NUMBWINE = 'NUMBER OF GLASSES OF WINE'
      OFTNLIQ  = 'HOW OFTEN S DRINK LIQUOR IN PAST YR'
      VDRINKFG = 'VERIFY DRINK DISCREPANCY'
      WKMOLIQ  = 'TIME UNIT,LIQ (WEEK OR MONTH)'
      NUMBSHOT = 'NUMBER OF SHOTS OF LIQUOR'
      EXERPROG = 'DOES S EXERCISE REGULARLY'
      GPE2NUM  = 'MOS/YRS S EXERCISED/PLAYED SPORTS REG'
      EXERNUM1 = 'NUMBER OF MONTHS OR YEARS'
      EXERUNT1 = 'TIME UNIT REG EXERCISE (MONTH OR YR)'
      E2DISF   = 'DISCREPANCY FLAG FOR E2'
      GPE3NUM  = 'HOW OFTEN DOES S EXERCISE'
      EXERNUM2 = 'NUMBER OF TIMES PER WEEK OR MONTH'
      EXERUNT2 = 'TIME UNIT EXERCISE'
      SPORTTIM = 'HOW MUCH TIME EXERCISE (MINUTES)'
      GPE5NUM  = 'HOW OFTEN LIGHT PHYSICAL ACTIVITY'
      EXERNUM3 = 'NUMBER OF TIMES PER WEEK OR MONTH'
      EXERUNT3 = 'TIME UNIT LIGHT EXERCISE (MO OR YR)'
      ACTVTIM  = 'HOW MUCH TIME LIGHT EXERCISE (MIN)'
      WHTCOMPR = 'COMPARE CURRENT WEIGHT WITH 12 MO AGO'
      WEIGHNOW = 'PRESENT WEIGHT'
      GPSDIMEN = 'ADDITIONAL QUESTIONS ON S WEIGHT'
      SDIMENSN = 'SKINNY OR HEAVY WHEN YOUNG'
      SHEIGHT  = 'SHORT OR TALL WHEN YOUNG'
      SWGHT25  = 'USUAL WEIGHT AT AGE 25'
      SWGHT40  = 'USUAL WEIGHT AT AGE 40'
      SWGHT65  = 'USUAL WEIGHT AT AGE 65'
      CALCIUM  = 'EVER TOOK CALCIUM'
      LONGCALC = 'HOW LONG TOOK CALCIUM'
      CALPAST5 = 'HOW MANY OF LST 5 YRS S TOOK CAL REG'
      CALCNOW  = 'S CURRENTLY TAKING CALCIUM REG'
      WREYEGLS = 'WEAR EYEGLASSES OR CONTACTS'
      SEESTR   = 'SEE FRIEND ACROSS STREET'
      SEEPRINT = 'SEE LETTERS IN ORDINARY PRINT'
      HEARAID  = 'EVER WORN A HEARING AID'
      HEARNORM = 'HEAR NORMAL VOICE ACROSS ROOM'
      WOHRGAID = 'HEAR NORMALLY WITHOUT HEARING AID'
      PRXPGMD  = 'PROXY CAN ANSWER SECTION G'
      EVERPREG = 'EVER PREGNANT'
      PREGNOW1 = 'IS S PREGNANT NOW'
      FRSTBRTH = 'AGE WHEN FIRST CHILD WAS BORN'
      G3DISF   = 'DISCREPANCY FLAG FOR G3'
      SINCPREG = 'PREGNANT SINCE LAST INT'
      PREGNOW2 = 'IS S PREGNANT NOW'
      LASTBRTH = 'AGE WHEN LAST CHILD WAS BORN'
      G6DISF   = 'DISCREPANCY FLAG FOR G6'
      LIVEBRTH = 'NUMBER OF LIVE BIRTHS'
      MISCARAG = 'EVER MISCARRIED'
      NUMMISS  = 'NUMBER OF MISCARRAIGES'
      HAVEWOMB = 'DOES S HAVE UTERUS'
      AGEREMVD = 'AGE WHEN UTERUS REMOVED'
      G11DISF  = 'DISCREPANCY FLAG FOR G11'
      BOTHOVRY = 'DOES S HAVE BOTH OVARIES'
      ONEOVRY  = 'DOES S HAVE ONE OVARY'
      REMVOVRY = 'AGE WHEN LAST OVARY REMOVED'
      G14DISF  = 'DISCREPANCY FLAG FOR G14'
      HAVPERD  = 'IS S STILL HAVING PERIODS'
      AGEPERD  = 'AGE WHEN S HAD LAST PERIOD'
      G16DISF  = 'DISCREPANCY FLAG FOR G16'
      PERDREG  = 'REGULAR/IRREGULAR PERIODS'
      CHNGLIFE = 'WHY IRREGULAR'
      HORMONE  = 'HORMONE PILLS TAKEN'
      AGEHPIL1 = 'AGE FIRST TOOK HORMONE PILL'
      G20DISF  = 'DISCREPANCY FLAG FOR G20'
      CURTAKHM = 'CURRENTLY TAKING HORMONE PILL'
      AGEHPILL = 'AGE LAST TOOK HORMONE PILL'
      G22DISF  = 'DISCREPANCY FLAG FOR G22'
      GPUNITL  = 'LONGEST PRD OF TIME S CONT. TOOK HP'
      HPUNITL  = 'TIME UNIT HORMONE PILLS'
      HPIL1MOL = 'NUM OF MONTHS CONTINUOUSLY TOOK HP'
      HPIL1YRL = 'NUM OF YEARS CONTINUOUSLY TOOK HP'
      HPILTOTL = 'TOTAL NUMBER OF MONTHS S CONT. HP'
      GPUNITT  = 'TOTAL PERIOD OF TIME S TOOK HP'
      HPUNITT  = 'TIME UNIT S ACTUALLY TOOK HP'
      HPIL1MOT = 'NUM OF MONTHS S ACTUALLY TOOK HP'
      HPIL1YRT = 'NUM OF YEARS S ACTUALLY TOOK HP'
      HPILTOTT = 'TOTAL NUM OF MONTHS S ACT TOOK HP'
      COLORPIL = 'WHAT COLOR PILL'
      GPUNITCL = 'PRD OF TIME S TOOK SAME COLOR PILL'
      UNITCOLR = 'TIME UNIT SAME COLOR PILL'
      LONGCOLR = 'HOW LONG TAKEN THIS COLOR PILL'
      G26DISF  = 'DISCREPANCY FLAG FOR G26'
      PATCHEVR = 'S EVER USED ESTROGEN/HORM SKIN PATCH'
      PATCHAGF = 'AGE OF S FRST USED ESTRO/HORM SKIN PATCH'
      G28DISF  = 'DISCREPANCY FLAG FOR G28'
      PATCHNOW = 'S CURR ESTROGEN/HORM SKIN PATCH'
      PATCHAGL = 'AGE OF S WHEN LAST USED SKIN PATCH'
      G30DISF  = 'DISCREPANCY FLAG FOR G30'
      PROVERA  = 'DOES S TAKE PROGESTIN/PROVERA'
      PROVNOW1 = 'S CURR TAKING PROGESTIN/PROVERA'
      GPUNITP1 = 'HOW LONG S TAKEN PROGESTIN/PROVERA'
      PRO1UNIT = 'TIME PERIOD HAS S PROGESTIN/PROVERA'
      PROVMOYR = 'MONTHS/YEARS HAS S TAKEN PROG/PROV'
      PROVNOW2 = 'S CURRENTLY TAKEN PROGESTIN/PROVERA'
      GPUNITP2 = 'MONTHS/YRS DID S TAKE PROG/PROV'
      PRO2UNIT = 'TIME UNIT S TAKE PROGESTIN/PROVERA'
      PROVMON  = 'TOTAL NUM OF MONTHS S TOOK PROVERA'
      PROVYR   = 'TOTAL NUM OF YRS S TOOK PROVERA'
      PROVTOTL = 'TOTAL NUMBER OF MONTHS'
      BRTHPILL = 'BIRTH CONTROL PILLS TAKEN'
      AGEFRSTP = 'AGE FIRST TOOK BIRTH CONTROL PILL'
      G37DISF  = 'DISCREPANCY FLAG FOR G37'
      CURPILL  = 'CURRENTLY TAKING BIRTH CONTROL PILLS'
      AGELASTP = 'AGE LAST TOOK BIRTH CONTROL PILLS'
      G39DISF  = 'DISCREPANCY FLAG FOR G39'
      GPUNITLP = 'LONGEST PERIOD OF TIME S TOOK BCP CONT.'
      BPUNITL  = 'TIME PERIOD BCP CONTINUOUSLY'
      BPIL1MOL = 'NUMBER OF MONTHS S CONT. TOOK BCP'
      BPIL1YRL = 'NUMBER OF YEARS S CONT. TOOKN BCP'
      BPILTOTL = 'TOTAL NUMBER OF YEARS S CONT. TOOK BCP'
      GPUNITTP = 'TOTAL PRD. OF TIME S ACT. TOOK BCP'
      BPUNITT  = 'TIME UNIT S ACT. TOOK BCP'
      BPIL1MOT = 'NUMBER OF MONTHS S TOOK BCP'
      BPIL1YRT = 'NUMBER OF YEARS S TOOK BCP'
      BPILTOTT = 'TOTAL OF MONTHS S TOOK BCP'
      GPUNIT25 = 'YRS/MONTHS S USED BCP BEFORE 25'
      BPUNIT25 = 'TIME UNIT USED BCP BEFORE 25'
      BPIL25MO = 'NUMBER OF MOS S TOOK BCP BEFORE 25'
      BPIL25YR = 'NUMBER OF YRS S TOOK BCP BEFORE 25'
      BPIL25TL = 'TOTAL NUM OF MOS S TOOK BCP < 25'
      BEFCHILD = 'USE BCP BEFORE FIRST CHILD'
      GPUNITBC = 'MOS/YRS S TOOK BCP BEFORE 1ST CHILD'
      BPUNITBC = 'TIME UNIT USED BCP BFR 1ST CHILD'
      BPILBCMO = 'MONTHS TOOK DCP BEFORE FIRST CHILD'
      BPILBCYR = 'YRS TOOK BCP BEFORE FIRST CHILD'
      BPILBCTL = 'TOTAL MOS S BCP BEFORE FIRST CHILD'
      TUBETYD  = 'EVER HAS TUBES TIED'
      AGETUBTY = 'AGE TUBES TIED'
      G46DISF  = 'DISCREPANCY FLAG FOR G46'
      PAPTEST  = 'EVER HAD A PAP SMEAR TEST'
      LONGPAP  = 'HOW LONG SINVE PAP TEST (YRS)'
      G48DISF  = 'DISCREPANCY FLAG FOR G48'
      MANYPAP5 = 'HOW MANY PAP TESTS IN LAST 5 YRS'
      MEDICAR2 = 'S COVERED BY MEDICARE'
      MEDICARE = 'S COVERED BY MEDICARE'
      MEDICAID = 'S COVERED BY MEDICAID'
      MILITARY = 'S COVERED BY MILITARY HEALTH CARE'
      PRIVATE  = 'COVERED BY PRIVATE INSURANCE'
      EMPUNION = 'PRIVATE INSUR OBTAINED THROUGH EMPLOYER'
      OTHPROG  = 'S HAVE INSURANCE'
      WAGES    = 'RECEIVE PERSONAL INCOME FROM WAGES'
      SSRR     = 'PERSONAL INCOME FROM SOCIAL SECURITY'
      SSI      = 'PERSONAL INCOME FROM SUPPLEMENTAL SECUR'
      UNEMPLOY = 'PERSONAL INCOME FROM UNEMPLOYMENT'
      AFDC     = 'PERSONAL INCOME FROM PUBLIC ASSISTANCE'
      SAVINGS  = 'PERSONAL INCOME FROM INTEREST EARNINGS'
      DIVIDEND = 'PERSONAL INCOME FROM DIVIDENDS'
      CHLDSUP  = 'PERSONAL INCOME FROM CHILD SUPPORT'
      OTHSUP   = 'PERSONAL INCOME FROM OTHER SOURCE'
      PINCOME  = 'PERSONAL INCOME OF S FOR LAST 12 MONTHS'
      TINCOME  = 'COMBINED INCOME S FAMILY (ALL SOURCES)'
      SUBAST   = 'RECEIVE ASSISTANCE WITH INTERVIEW'
      NUMAST   = 'NUMBER OF ASSISTANTS'
      AST1REL  = 'RELATIONSHIP OF ASSISTANT #1 TO S'
      AST2REL  = 'RELATIONSHIP OF ASSISTANT #2 TO S'
      PRIMAST  = 'PRIMARY RESPONDENT'
      WHYPROX  = 'WHY PROXY/ASSISTANT NEEDED'
      GPKHEAR  = 'REASONS FOR HELP FROM ASSISTANT/PROXY'
      KHEAR    = 'HEARING REASON FOR HELP'
      KSPEECH  = 'SPEECH REASON FOR HELP'
      KLANGU   = 'LANGUAGE REASON FOR HELP'
      KMEMRY   = 'MEMORY, SENILITY REASON FOR HELP'
      KINSTIT  = 'INSTITUTIONALIZATION REASON FOR HELP'
      KALZH    = 'ALZHEIMER REASON FOR HELP'
      KOTHMENT = 'OTHER MENTAL CONDITION REASON FOR HELP'
      KOTHPHY  = 'OTHER PHYSICAL ILLNESS REASON FOR HELP'
      KOTHHEAL = 'OTHER NON-HEALTH REASON FOR HELP'
      KOTHER   = 'OTHER REASON FOR HELP'
      INFOSATS = 'INFO FROM SUBJECT/PROXY SATISFACTORY'
      SUBAWARE = 'DESCRIBE SUBJECT AWARENESS LEVEL'
      QHELDATT = 'R ATTENTION HELD'
      QUPSTDEP = 'R UPSET OR DEPRESSED'
      QBORING  = 'R BORED OR UNINTERESTED'
      RCAPABLE = 'R INTELLECTUALLY CAPABLE'
      RACCURTE = 'R ANSWERS REASONABLY ACCURATE'
      RUNDESST = 'R UNDERSTOOD THE QUESTIONS'
      BADSECT  = 'WAS THERE AN UPSETTING SECTION'
      RHRDHRNG = 'R HARD OF HEARING'
      QINTSPAN = 'INTERVIEW CONDUCTED IN SPANISH'
      PERSNM1  = 'HOUSEHOLD MEMBER #1'
      CURREL1  = 'RELATIONSHIP TO S OF CURRENT HH MEM'
      CURRSX1  = 'SEX OF CURRENT HH MEMBER'
      PREVRL1  = 'RELATIONSHIP TO S OF PREVIOUS HH MEM'
      PREVSX1  = 'SEX OF PREVIOUS HH MEMBER'
      PERSNM2  = 'HH MEMBER #2'
      CURREL2  = 'RELATIONSHIP OF S OF CURRENT HHM #2'
      CURRSX2  = 'S OF CURRENT HH MEMBER #2'
      PREVRL2  = 'RELATIONSHIP TO S OF PREVIOUS HHM #2'
      PREVSX2  = 'SEX OF PREVIOUS HHM #2'
      PERSNM3  = 'HH MEMBER #3'
      CURREL3  = 'RELATIONSHIP TO S OF CURRENT HHM #3'
      CURRSX3  = 'SEX OF CURRENT HH MEMBER #3'
      PREVRL3  = 'RELATIONSHIP TO S OF PREVIOUS HHM #3'
      PREVSX3  = 'SEX OF PREVIOUS HH MEMBER #3'
      PERSNM4  = 'HOUSEHOLD MEMBER #4'
      CURREL4  = 'RELATIONSHIP TO S OF CURRENT HHM #4'
      CURRSX4  = 'SEX OF CURRENT HH MEMBER #4'
      PREVRL4  = 'RELATIONSHIP TO S OF PREVIOUS HHM #4'
      PREVSX4  = 'SEX OF PREVIOUS HH MEMBER #4'
      PERSNM5  = 'HH MEMBER #5'
      CURREL5  = 'RELATIONSHIP OF S OF CURRENT HHM #5'
      CURRSX5  = 'S OF CURRENT HH MEMBER #5'
      PREVRL5  = 'RELATIONSHIP TO S OF PREVIOUS HHM #5'
      PREVSX5  = 'SEX OF PREVIOUS HHM #5'
      PERSNM6  = 'HH MEMBER #6'
      CURREL6  = 'RELATIONSHIP TO S OF CURRENT HHM #6'
      CURRSX6  = 'SEX OF CURRENT HH MEMBER #6'
      PREVRL6  = 'RELATIONSHIP TO S OF PREVIOUS HHM #6'
      PREVSX6  = 'SEX OF PREVIOUS HH MEMBER #6'
      PERSNM7  = 'HOUSEHOLD MEMBER #7'
      CURREL7  = 'RELATIONSHIP TO S OF CURRENT HHM #7'
      CURRSX7  = 'SEX OF CURRENT HH MEMBER #7'
      PREVRL7  = 'RELATIONSHIP TO S OF PREVIOUS HHM #7'
      PREVSX7  = 'SEX OF PREVIOUS HH MEMBER #7'
      PERSNM8  = 'HH MEMBER #8'
      CURREL8  = 'RELATIONSHIP OF S OF CURRENT HHM #8'
      CURRSX8  = 'S OF CURRENT HH MEMBER #8'
      PREVRL8  = 'RELATIONSHIP TO S OF PREVIOUS HHM #8'
      PREVSX8  = 'SEX OF PREVIOUS HHM #8'
      PERSNM9  = 'HH MEMBER #9'
      CURREL9  = 'RELATIONSHIP TO S OF CURRENT HHM #9'
      CURRSX9  = 'SEX OF CURRENT HH MEMBER #9'
      PREVRL9  = 'RELATIONSHIP TO S OF PREVIOUS HHM #9'
      PREVSX9  = 'SEX OF PREVIOUS HH MEMBER #9'
      PERSNM10 = 'HOUSEHOLD MEMBER #10'
      CURREL10 = 'RELATIONSHIP TO S OF CURRENT HHM #10'
      CURRSX10 = 'SEX OF CURRENT HH MEMBER #10'
      PREVRL10 = 'RELATIONSHIP TO S OF PREVIOUS HHM #10'
      PREVSX10 = 'SEX OF PREVIOUS HH MEMBER #10'
      PERSNM11 = 'HH MEMBER #11'
      CURREL11 = 'RELATIONSHIP OF S OF CURRENT HHM #11'
      CURRSX11 = 'S OF CURRENT HH MEMBER #11'
      PREVRL11 = 'RELATIONSHIP TO S OF PREVIOUS HHM #11'
      PREVSX11 = 'SEX OF PREVIOUS HHM #11'
      PERSNM12 = 'HH MEMBER #12'
      CURREL12 = 'RELATIONSHIP TO S OF CURRENT HHM #12'
      CURRSX12 = 'SEX OF CURRENT HH MEMBER #12'
      PREVRL12 = 'RELATIONSHIP TO S OF PREVIOUS HHM #12'
      PREVSX12 = 'SEX OF PREVIOUS HH MEMBER #12'
      PERSNM13 = 'HOUSEHOLD MEMBER #13'
      CURREL13 = 'RELATIONSHIP TO S OF CURRENT HHM #13'
      CURRSX13 = 'SEX OF CURRENT HH MEMBER #13'
      PREVRL13 = 'RELATIONSHIP TO S OF PREVIOUS HHM #13'
      PREVSX13 = 'SEX OF PREVIOUS HH MEMBER #13'
      PERSNM14 = 'HH MEMBER #14'
      CURREL14 = 'RELATIONSHIP OF S OF CURRENT HHM #14'
      CURRSX14 = 'S OF CURRENT HH MEMBER #14'
      PREVRL14 = 'RELATIONSHIP TO S OF PREVIOUS HHM #14'
      PREVSX14 = 'SEX OF PREVIOUS HHM #14'
      PERSNM15 = 'HH MEMBER #15'
      CURREL15 = 'RELATIONSHIP TO S OF CURRENT HHM #15'
      CURRSX15 = 'SEX OF CURRENT HH MEMBER #15'
      PREVRL15 = 'RELATIONSHIP TO S OF PREVIOUS HHM #15'
      PREVSX15 = 'SEX OF PREVIOUS HH MEMBER #15'
      PERSNM16 = 'HOUSEHOLD MEMBER #16'
      CURREL16 = 'RELATIONSHIP TO S OF CURRENT HHM #16'
      CURRSX16 = 'SEX OF CURRENT HH MEMBER #16'
      PREVRL16 = 'RELATIONSHIP TO S OF PREVIOUS HHM #16'
      PREVSX16 = 'SEX OF PREVIOUS HH MEMBER #16'
      PERSNM17 = 'HH MEMBER #17'
      CURREL17 = 'RELATIONSHIP OF S OF CURRENT HHM #17'
      CURRSX17 = 'S OF CURRENT HH MEMBER #17'
      PREVRL17 = 'RELATIONSHIP TO S OF PREVIOUS HHM #17'
      PREVSX17 = 'SEX OF PREVIOUS HHM #17'
      PERSNM18 = 'HH MEMBER #18'
      CURREL18 = 'RELATIONSHIP TO S OF CURRENT HHM #18'
      CURRSX18 = 'SEX OF CURRENT HH MEMBER #18'
      PREVRL18 = 'RELATIONSHIP TO S OF PREVIOUS HHM #18'
      PREVSX18 = 'SEX OF PREVIOUS HH MEMBER #18'
      PERSNM19 = 'HH MEMBER #19'
      CURREL19 = 'RELATIONSHIP TO S OF CURRENT HHM #19'
      CURRSX19 = 'SEX OF CURRENT HH MEMBER #19'
      PREVRL19 = 'RELATIONSHIP TO S OF PREVIOUS HHM #19'
      PREVSX19 = 'SEX OF PREVIOUS HH MEMBER #19'
      CANCNUM1 = 'CANCER REPORT #1'
      CANCRLC1 = 'WHERE WAS CANCER/WHAT TYPE WAS IT'
      ICD9CNC1 = 'ICD9 CODE FOR CANCER'
      TOLDCNC1 = 'YEAR S FIRST TOLD ABOUT CANCER'
      B68DISF1 = 'DISCREPANCY FLAG FOR B68'
      HOSPCN21 = 'S HOSPITALIZED FOR CANCER'
      CANCNUM2 = 'CANCER REPORT #2'
      CANCRLC2 = 'WHERE WAS CANCER #2/WHAT TYPE WAS IT'
      ICD9CNC2 = 'ICD9 CODE FOR CANCER #2'
      TOLDCNC2 = 'YEAR S FIRST TOLD ABOUT CANCER #2'
      B68DISF2 = 'DISCREPANCY FLAG FOR B68'
      HOSPCN22 = 'S HOSPITALIZED FOR CANCER #2'
      CANCNUM3 = 'CANCER REPORT #3'
      CANCRLC3 = 'WHERE WAS CANCER #3/WHAT TYPE WAS IT'
      ICD9CNC3 = 'ICD9 CODE FOR CANCER #3'
      TOLDCNC3 = 'YEAR S FIRST TOLD ABOUT CANCER #3'
      B68DISF3 = 'DISCREPANCY FLAG FOR B68'
      HOSPCN23 = 'S HOSPITALIZED FOR CANCER #3'
      CANCNUM4 = 'CANCER REPORT #4'
      CANCRLC4 = 'WHERE WAS CANCER #4/WHAT TYPE WAS IT'
      ICD9CNC4 = 'ICD9 CODE FOR CANCER #4'
      TOLDCNC4 = 'YEAR S FIRST TOLD ABOUT CANCER #4'
      B68DISF4 = 'DISCREPANCY FLAG FOR B68'
      HOSPCN24 = 'S HOSPITALIZED FOR CANCER #4'
      OSURNUM1 = 'OUT-PATIENT SURGERY REPORT'
      OSURTYPE = 'CANCER TYPE S HAD FOR OUT-PATIENT SURG'
      ICD9OSU1 = 'ICD9 CODE FOR OUT-PATIENT SURG'
      OSURYR1  = 'YEAR OF S MOST RECENT OUT-PAT SURG'
      OSURNUM2 = 'OUT-PATIENT SURGERY REPORT #2'
      OSURTYP2 = 'CANCER TYPE#2 S HAD FOR OUT-PATIENT SURG'
      ICD9OSU2 = 'ICD9 CODE FOR OUT-PATIENT SURG #2'
      OSURYR2  = 'YEAR OF S MOST RECENT OUT-PAT SURG #2'
      OSURNUM3 = 'OUT-PATIENT SURGERY REPORT #3'
      OSURTYP3 = 'CANCER TYPE#3 S HAD FOR OUT-PATIENT SURG'
      ICD9OSU3 = 'ICD9 CODE FOR OUT-PATIENT SURG #3'
      OSURYR3  = 'YEAR OF S MOST RECENT OUT-PAT SURG #3'
      CRELNUM1 = 'RELATIVE CANCER REPORT-RELATIVE #1'
      FREL1    = 'RELATION TO S (RELATIVE #1)'
      FCANLNG1 = 'TYPE OF CANCER-LUNG (RELATIVE #1)'
      FCANBST1 = 'TYPE OF CANCER-BREAST (RELATIVE #1)'
      FCANCLN1 = 'TYPE OF CANCER-LARGE BOWEL COLON (REL#1)'
      FCANRCM1 = 'TYPE CANCER-LARGE BOWEL RECTUM (REL#1)'
      FCANPNC1 = 'TYPE OF CANCER-PANCREAS (RELATIVE #1)'
      FCANBDR1 = 'TYPE OF CANCER-BLADDER (RELATIVE #1)'
      FCANPST1 = 'TYPE OF CANCER-PROSTATE (RELATIVE #1)'
      FCANCRV1 = 'TYPE OF CANCER-CERVICAL (RELATIVE #1)'
      FCANEDO1 = 'TYPE CANCER-ENDOMETRIUM/CORPUS (REL #1)'
      FCANLUK1 = 'TYPE OF CANCER-LEUKEMIA(RELATIVE #1)'
      FCANNDL1 = 'TYPE OF CANCER-LYMPHOMA (RELATIVE #1)'
      FCANSMC1 = 'TYPE OF CANCER-STOMACH (RELATIVE #1)'
      FCANOVY1 = 'TYPE OF CANCER-OVARIAN (RELATIVE #1)'
      FCANKDY1 = 'TYPE OF CANCER-KIDNEY (RELATIVE #1)'
      FCANMLN1 = 'TYPE OF CANCER-MELANOMA (RELATIVE #1)'
      FCANNML1 = 'TYPE OF CANCER-NON MELANOMA (REL#1)'
      FCANNSC1 = 'CANCER-NON SPECIFIED SKIN CANCER (REL#1)'
      FCANBNE1 = 'TYPE OF CANCER-BONE (RELATIVE #1)'
      FCANLVR1 = 'TYPE OF CANCER-LIVER (RELATIVE #1)'
      FCANBRN1 = 'TYPE OF CANCER-BRAIN (RELATIVE #1)'
      FCANTHR1 = 'TYPE OF CANCER-THROAT (RELATIVE#1)'
      FCANORL1 = 'TYPE OF CANCER-ORAL (RELATIVE #1)'
      FCANGLN1 = 'TYPE OF CANCER-LYMPH GLANDS (REL #1)'
      FCANESH1 = 'TYPE OF CANCER-ESOPHAGUS (RELATIVE #1)'
      FCANLRX1 = 'TYPE OF CANCER-LARYNX (RELATIVE #1)'
      FCANTHD1 = 'TYPE OF CANCER-THYROID (REL #1)'
      FCANFSP1 = 'CANCER-NON SPECIFIC FEMALE (REL #1)'
      FCANGSO1 = 'CANCER-OTHER GASTROINTESTINAL (REL #1)'
      FCANBDY1 = 'CANCER-THROUGHOUT BODY (REL #1)'
      FCANBMR1 = 'TYPE OF CANCER-BONE MARROW (REL #1)'
      FCANHKN1 = 'TYPE OF CANCER-HODGKINS (RELATIVE #1)'
      FCANTST1 = 'TYPE OF CANCER-TESTICULAR (REL #1)'
      FCANOT11 = 'CANCER-OTHER TYPE NOT LISTED (REL #1)'
      FCANOT21 = 'CANCER-OTHER NOT LISTED TYPE 2 (REL #1)'
      FCANOT31 = 'CANCER-OTHER NOT LISTED TYPE 3 (REL #1)'
      CANCOR11 = '1ST REPORTED CANCER TYPE (RELATIVE #1)'
      CANCOR21 = '2ND REPORTED CANCER TYPE (RELATIVE #1)'
      CANCOR31 = '3RD REPORTED CANCER TYPE (RELATIVE #1)'
      CANCOR41 = '4TH REPORTED CANCER TYPE (RELATIVE #1)'
      CANCOR51 = '5TH REPORTED CANCER TYPE (RELATIVE #1)'
      CANCOR61 = '6TH REPORTED CANCER TYPE (RELATIVE #1)'
      CANCOR71 = '7TH REPORTED CANCER TYPE (RELATIVE #1)'
      CANCOR81 = '8TH REPORTED CANCER TYPE (RELATIVE #1)'
      CANCOR91 = '9TH REPORTED CANCER TYPE (RELATIVE #1)'
      CANCR101 = '10TH REPORTED CANCER TYPE (REL #1)'
      ICD9CR11 = 'ICD9 CODE-1ST REP CANCER TYPE (REL #1)'
      ICD9CR21 = 'ICD9 CODE-2ND REP CANCER TYPE (REL #1)'
      ICD9CR31 = 'ICD9 CODE-3RD REP CANCER TYPE (REL #1)'
      ICD9CR41 = 'ICD9 CODE-4TH REP CANCER TYPE (REL #1)'
      ICD9CR51 = 'ICD9 CODE-5TH REP CANCER TYPE (REL #1)'
      ICD9CR61 = 'ICD9 CODE-6TH REP CANCER TYPE (REL #1)'
      ICD9CR71 = 'ICD9 CODE-7TH REP CANCER TYPE (REL #1)'
      ICD9CR81 = 'ICD9 CODE-8TH REP CANCER TYPE (REL #1)'
      ICD9CR91 = 'ICD9 CODE-9TH REP CANCER TYPE (REL #1)'
      ICD9C101 = 'ICD9 CODE-10TH REP CANCER TYPE (REL #1)'
      CRELNUM2 = 'RELATIVE CANCER REPORT-RELATIVE #2'
      FREL2    = 'RELATION TO S (RELATIVE #2)'
      FCANLNG2 = 'TYPE OF CANCER-LUNG (RELATIVE #2)'
      FCANBST2 = 'TYPE OF CANCER-BREAST (RELATIVE #2)'
      FCANCLN2 = 'TYPE OF CANCER-LARGE BOWEL COLON (REL#2)'
      FCANRCM2 = 'TYPE CANCER-LARGE BOWEL RECTUM (REL #2)'
      FCANPNC2 = 'TYPE OF CANCER-PANCREAS (RELATIVE #2)'
      FCANBLD2 = 'TYPE OF CANCER-BLADDER (RELATIVE #2)'
      FCANPST2 = 'TYPE OF CANCER-PROSTATE (RELATIVE #2)'
      FCANCRV2 = 'TYPE OF CANCER-CERVICAL (RELATIVE #2)'
      FCANEDO2 = 'TYPE CANCER-ENDOMETRIUM/CORPUS (REL#2)'
      FCANLUK2 = 'TYPE OF CANCER-LEUKEMIA(RELATIVE #2)'
      FCANNDL2 = 'TYPE OF CANCER-LYMPHOMA (RELATIVE #2)'
      FCANSMC2 = 'TYPE OF CANCER-STOMACH (RELATIVE #2)'
      FCANOVY2 = 'TYPE OF CANCER-OVARIAN (RELATIVE #2)'
      FCANKDY2 = 'TYPE OF CANCER-KIDNEY (RELATIVE #2)'
      FCANMLN2 = 'TYPE OF CANCER-MELANOMA (RELATIVE #2)'
      FCANNML2 = 'TYPE OF CANCER-NON MELANOMA (REL#2)'
      FCANNSC2 = 'CANCER-NON SPECIFIED SKIN CANCER (REL#2)'
      FCANBNE2 = 'TYPE OF CANCER-BONE (RELATIVE #2)'
      FCANLVR2 = 'TYPE OF CANCER-LIVER (RELATIVE #2)'
      FCANBRN2 = 'TYPE OF CANCER-BRAIN (RELATIVE #2)'
      FCANTHR2 = 'TYPE OF CANCER-THROAT (RELATIVE #2)'
      FCANORL2 = 'TYPE OF CANCER-ORAL (RELATIVE #2)'
      FCANGLN2 = 'TYPE OF CANCER-LYMPH GLANDS (REL #2)'
      FCANESH2 = 'TYPE OF CANCER-ESOPHAGUS (RELATIVE #2)'
      FCANLRX2 = 'TYPE OF CANCER-LARYNX (RELATIVE #2)'
      FCANTHD2 = 'TYPE OF CANCER-THYROID (REL #2)'
      FCANFSP2 = 'CANCER-NON SPECIFIC FEMALE (REL #2)'
      FCANGSO2 = 'CANCER-OTHER GASTROINTESTINAL (REL #2)'
      FCANBDY2 = 'CANCER-THROUGHOUT BODY (REL #2)'
      FCANBMR2 = 'TYPE OF CANCER-BONE MARROW (REL #2)'
      FCANHKN2 = 'TYPE OF CANCER-HODGKINS (RELATIVE #2)'
      FCANTST2 = 'TYPE OF CANCER-TESTICULAR (REL #2)'
      FCANOT12 = 'CANCER-OTHER TYPE NOT LISTED (REL #2)'
      FCANOT22 = 'CANCER-OTHER NOT LISTED TYPE 2 (REL #2)'
      FCANOT32 = 'CANCER-OTHER NOT LISTED TYPE 3 (REL #2)'
      CANCOR12 = '1ST REPORTED CANCER TYPE (RELATIVE #2)'
      CANCOR22 = '2ND REPORTED CANCER TYPE (RELATIVE #2)'
      CANCOR32 = '3RD REPORTED CANCER TYPE (RELATIVE #2)'
      CANCOR42 = '4TH REPORTED CANCER TYPE (RELATIVE #2)'
      CANCOR52 = '5TH REPORTED CANCER TYPE (RELATIVE #2)'
      CANCOR62 = '6TH REPORTED CANCER TYPE (RELATIVE #2)'
      CANCOR72 = '7TH REPORTED CANCER TYPE (RELATIVE #2)'
      CANCOR82 = '8TH REPORTED CANCER TYPE (RELATIVE #2)'
      CANCOR92 = '9TH REPORTED CANCER TYPE (RELATIVE #2)'
      CANCR102 = '10TH REPORTED CANCER TYPE (REL #2)'
      ICD9CR12 = 'ICD9 CODE-1ST REP CANCER TYPE (REL #2)'
      ICD9CR22 = 'ICD9 CODE-2ND REP CANCER TYPE (REL #2)'
      ICD9CR32 = 'ICD9 CODE-3RD REP CANCER TYPE (REL #2)'
      ICD9CR42 = 'ICD9 CODE-4TH REP CANCER TYPE (REL #2)'
      ICD9CR52 = 'ICD9 CODE-5TH REP CANCER TYPE (REL #2)'
      ICD9CR62 = 'ICD9 CODE-6TH REP CANCER TYPE (REL #2)'
      ICD9CR72 = 'ICD9 CODE-7TH REP CANCER TYPE (REL #2)'
      ICD9CR82 = 'ICD9 CODE-8TH REP CANCER TYPE (REL #2)'
      ICD9CR92 = 'ICD9 CODE-9TH REP CANCER TYPE (REL #2)'
      ICD9C102 = 'ICD9 CODE-10TH REP CANCER TYPE (REL #2)'
      CRELNUM3 = 'RELATIVE CANCER REPORT-RELATIVE # 3'
      FREL3    = 'RELATION TO S (RELATIVE #3)'
      FCANLNG3 = 'TYPE OF CANCER-LUNG (RELATIVE #3)'
      FCANBST3 = 'TYPE OF CANCER-BREAST (RELATIVE #3)'
      FCANCLN3 = 'TYPE OF CANCER-LARGE BOWEL COLON (REL#3)'
      FCANRCM3 = 'TYPE CANCER-LARGE BOWEL RECTUM (REL #3)'
      FCANPNC3 = 'TYPE OF CANCER-PANCREAS (RELATIVE #3)'
      FCANBDR3 = 'TYPE OF CANCER-BLADDER (RELATIVE #3)'
      FCANPRS3 = 'TYPE OF CANCER-PROSTATE (RELATIVE #3)'
      FCANCRV3 = 'TYPE OF CANCER-CERVICAL (RELATIVE #3)'
      FCANEDO3 = 'TYPE CANCER-ENDOMETRIUM/CORPUS (REL #3)'
      FCANLUK3 = 'TYPE OF CANCER-LEUKEMIA(RELATIVE #3)'
      FCANNDL3 = 'TYPE OF CANCER-LYMPHOMA (RELATIVE #3)'
      FCANSMC3 = 'TYPE OF CANCER-STOMACH (RELATIVE #3)'
      FCANOVY3 = 'TYPE OF CANCER-OVARIAN (RELATIVE #3)'
      FCANKDY3 = 'TYPE OF CANCER-KIDNEY (RELATIVE #3)'
      FCANMLN3 = 'TYPE OF CANCER-MELANOMA (RELATIVE #3)'
      FCANNML3 = 'TYPE OF CANCER-NON MELANOMA (REL #3)'
      FCANNSC3 = 'CANCER-NON SPECIFIED SKIN CANCER (REL#3)'
      FCANBNE3 = 'TYPE OF CANCER-BONE (RELATIVE #3)'
      FCANLVR3 = 'TYPE OF CANCER-LIVER (RELATIVE #3)'
      FCANBRN3 = 'TYPE OF CANCER-BRAIN (RELATIVE #3)'
      FCANTHR3 = 'TYPE OF CANCER-THROAT (RELATIVE #3)'
      FCANORL3 = 'TYPE OF CANCER-ORAL (RELATIVE #3)'
      FCANGLN3 = 'TYPE OF CANCER-LYMPH GLANDS (REL #3)'
      FCANESH3 = 'TYPE OF CANCER-ESOPHAGUS (RELATIVE #3)'
      FCANLRX3 = 'TYPE OF CANCER-LARYNX (RELATIVE #3)'
      FCANTHD3 = 'TYPE OF CANCER-THYROID (REL #3)'
      FCANFSP3 = 'CANCER-NON SPECIFIC FEMALE (REL #3)'
      FCANGSO3 = 'CANCER-OTHER GASTROINTESTINAL (REL #3)'
      FCANBDY3 = 'CANCER-THROUGHOUT BODY (REL #3)'
      FCANBMR3 = 'TYPE OF CANCER-BONE MARROW (REL #3)'
      FCANHKN3 = 'TYPE OF CANCER-HODGKINS (RELATIVE #3)'
      FCANTST3 = 'TYPE OF CANCER-TESTICULAR (REL #3)'
      FCANOT13 = 'CANCER-OTHER TYPE NOT LISTED (REL #3)'
      FCANOT23 = 'CANCER-OTHER NOT LISTED TYPE 2 (REL #3)'
      FCANOT33 = 'CANCER-OTHER NOT LISTED TYPE 3 (REL #3)'
      CANCOR13 = '1ST REPORTED CANCER TYPE (RELATIVE #3)'
      CANCOR23 = '2ND REPORTED CANCER TYPE (RELATIVE #3)'
      CANCOR33 = '3RD REPORTED CANCER TYPE (RELATIVE #3)'
      CANCOR43 = '4TH REPORTED CANCER TYPE (RELATIVE #3)'
      CANCOR53 = '5TH REPORTED CANCER TYPE (RELATIVE #3)'
      CANCOR63 = '6TH REPORTED CANCER TYPE (RELATIVE #3)'
      CANCOR73 = '7TH REPORTED CANCER TYPE (RELATIVE #3)'
      CANCOR83 = '8TH REPORTED CANCER TYPE (RELATIVE #3)'
      CANCOR93 = '9TH REPORTED CANCER TYPE (RELATIVE #3)'
      CANCR103 = '10TH REPORTED CANCER TYPE (REL #3)'
      ICD9CR13 = 'ICD9 CODE-1ST REP CANCER TYPE (REL #3)'
      ICD9CR23 = 'ICD9 CODE-2ND REP CANCER TYPE (REL #3)'
      ICD9CR33 = 'ICD9 CODE-3RD REP CANCER TYPE (REL #3)'
      ICD9CR43 = 'ICD9 CODE-4TH REP CANCER TYPE (REL #3)'
      ICD9CR53 = 'ICD9 CODE-5TH REP CANCER TYPE (REL #3)'
      ICD9CR63 = 'ICD9 CODE-6TH REP CANCER TYPE (REL #3)'
      ICD9CR73 = 'ICD9 CODE-7TH REP CANCER TYPE (REL #3)'
      ICD9CR83 = 'ICD9 CODE-8TH REP CANCER TYPE (REL #3)'
      ICD9CR93 = 'ICD9 CODE-9TH REP CANCER TYPE (REL #3)'
      ICD9C103 = 'ICD9 CODE-10TH REP CANCER TYPE (REL #3)'
      CRELNUM4 = 'RELATIVE CANCER REPORT-RELATIVE #4'
      FREL4    = 'RELATION TO S (RELATIVE #4)'
      FCANLNG4 = 'TYPE OF CANCER-LUNG (RELATIVE #4)'
      FCANBST4 = 'TYPE OF CANCER-BREAST (RELATIVE #4)'
      FCANCLN4 = 'TYPE OF CANCER-LARGE BOWEL COLON (REL#4)'
      FCANRCM4 = 'TYPE CANCER-LARGE BOWEL RECTUM (REL #4)'
      FCANPNC4 = 'TYPE OF CANCER-PANCREAS (RELATIVE #4)'
      FCANBDR4 = 'TYPE OF CANCER-BLADDER (RELATIVE #4)'
      FCANPST4 = 'TYPE OF CANCER-PROSTATE (RELATIVE #4)'
      FCANCRV4 = 'TYPE OF CANCER-CERVICAL (RELATIVE #4)'
      FCANEDO4 = 'TYPE CANCER-ENDOMETRIUM/CORPUS (REL #4)'
      FCANLUK4 = 'TYPE OF CANCER-LEUKEMIA(RELATIVE #4)'
      FCANNDL4 = 'TYPE OF CANCER-LYMPHOMA (RELATIVE #4)'
      FCANSMC4 = 'TYPE OF CANCER-STOMACH (RELATIVE #4)'
      FCANOVY4 = 'TYPE OF CANCER-OVARIAN (RELATIVE #4)'
      FCANKDY4 = 'TYPE OF CANCER-KIDNEY (RELATIVE #4)'
      FCANMLN4 = 'TYPE OF CANCER-MELANOMA (RELATIVE #4)'
      FCANNML4 = 'TYPE OF CANCER-NON MELANOMA (REL #4)'
      FCANNSC4 = 'CANCER-NON SPECIFIED SKIN CANCER (REL#4)'
      FCANBNE4 = 'TYPE OF CANCER-BONE (RELATIVE #4)'
      FCANLVR4 = 'TYPE OF CANCER-LIVER (RELATIVE #4)'
      FCANBRN4 = 'TYPE OF CANCER-BRAIN (RELATIVE #4)'
      FCANTHR4 = 'TYPE OF CANCER-THROAT (RELATIVE#4)'
      FCANORL4 = 'TYPE OF CANCER-ORAL (RELATIVE #4)'
      FCANGLN4 = 'TYPE OF CANCER-LYMPH GLANDS (REL #4)'
      FCANESH4 = 'TYPE OF CANCER-ESOPHAGUS (RELATIVE #4)'
      FCANLRX4 = 'TYPE OF CANCER-LARYNX (RELATIVE #4)'
      FCANTHD4 = 'TYPE OF CANCER-THYROID (REL #4)'
      FCANFSP4 = 'CANCER-NON SPECIFIC FEMALE (REL #4)'
      FCANGSO4 = 'CANCER-OTHER GASTROINTESTINAL (REL #4)'
      FCANBDY4 = 'CANCER-THROUGHOUT BODY (REL #4)'
      FCANBMR4 = 'TYPE OF CANCER-BONE MARROW (REL #4)'
      FCANHKN4 = 'TYPE OF CANCER-HODGKINS (RELATIVE #4)'
      FCANTST4 = 'TYPE OF CANCER-TESTICULAR (REL #4)'
      FCANOT14 = 'CANCER-OTHER TYPE NOT LISTED (REL #4)'
      FCANOT24 = 'CANCER-OTHER NOT LISTED TYPE 2 (REL #4)'
      FCANOT34 = 'CANCER-OTHER NOT LISTED TYPE 3 (REL #4)'
      CANCOR14 = '1ST REPORTED CANCER TYPE (RELATIVE #4)'
      CANCOR24 = '2ND REPORTED CANCER TYPE (RELATIVE #4)'
      CANCOR34 = '3RD REPORTED CANCER TYPE (RELATIVE #4)'
      CANCOR44 = '4TH REPORTED CANCER TYPE (RELATIVE #4)'
      CANCOR54 = '5TH REPORTED CANCER TYPE (RELATIVE #4)'
      CANCOR64 = '6TH REPORTED CANCER TYPE (RELATIVE #4)'
      CANCOR74 = '7TH REPORTED CANCER TYPE (RELATIVE #4)'
      CANCOR84 = '8TH REPORTED CANCER TYPE (RELATIVE #4)'
      CANCOR94 = '9TH REPORTED CANCER TYPE (RELATIVE #4)'
      CANCR104 = '10TH REPORTED CANCER TYPE (REL #4)'
      ICD9CR14 = 'ICD9 CODE-1ST REP CANCER TYPE (REL #4)'
      ICD9CR24 = 'ICD9 CODE-2ND REP CANCER TYPE (REL #4)'
      ICD9CR34 = 'ICD9 CODE-3RD REP CANCER TYPE (REL #4)'
      ICD9CR44 = 'ICD9 CODE-4TH REP CANCER TYPE (REL #4)'
      ICD9CR54 = 'ICD9 CODE-5TH REP CANCER TYPE (REL #4)'
      ICD9CR64 = 'ICD9 CODE-6TH REP CANCER TYPE (REL #4)'
      ICD9CR74 = 'ICD9 CODE-7TH REP CANCER TYPE (REL #4)'
      ICD9CR84 = 'ICD9 CODE-8TH REP CANCER TYPE (REL #4)'
      ICD9CR94 = 'ICD9 CODE-9TH REP CANCER TYPE (REL #4)'
      ICD9C104 = 'ICD9 CODE-10TH REP CANCER TYPE (REL #4)'
      CRELNUM5 = 'RELATIVE CANCER REPORT-RELATIVE #5'
      FREL5    = 'RELATION TO S (RELATIVE #5)'
      FCANLNG5 = 'TYPE OF CANCER-LUNG (RELATIVE #5)'
      FCANBST5 = 'TYPE OF CANCER-BREAST (RELATIVE #5)'
      FCANCLN5 = 'TYPE OF CANCER-LARGE BOWEL COLON (REL#5)'
      FCANRCM5 = 'TYPE CANCER-LARGE BOWEL RECTUM (REL #5)'
      FCANPNC5 = 'TYPE OF CANCER-PANCREAS (RELATIVE #5)'
      FCANBDR5 = 'TYPE OF CANCER-BLADDER (RELATIVE #5)'
      FCANPST5 = 'TYPE OF CANCER-PROSTATE (RELATIVE #5)'
      FCANCRV5 = 'TYPE OF CANCER-CERVICAL (RELATIVE #5)'
      FCANEDO5 = 'TYPE CANCER-ENDOMETRIUM/CORPUS (REL #5)'
      FCANLUK5 = 'TYPE OF CANCER-LEUKEMIA(RELATIVE #5)'
      FCANNDL5 = 'TYPE OF CANCER-LYMPHOMA (RELATIVE #5)'
      FCANSMC5 = 'TYPE OF CANCER-STOMACH (RELATIVE #5)'
      FCANOVY5 = 'TYPE OF CANCER-OVARIAN (RELATIVE #5)'
      FCANKDY5 = 'TYPE OF CANCER-KIDNEY (RELATIVE #5)'
      FCANMLN5 = 'TYPE OF CANCER-MELANOMA (RELATIVE #5)'
      FCANNML5 = 'TYPE OF CANCER-NON MELANOMA (REL #5)'
      FCANNSC5 = 'CANCER-NON SPECIFIED SKIN CANCER (REL#5)'
      FCANBNE5 = 'TYPE OF CANCER-BONE (RELATIVE #5)'
      FCANLVR5 = 'TYPE OF CANCER-LIVER (RELATIVE #5)'
      FCANBRN5 = 'TYPE OF CANCER-BRAIN (RELATIVE #5)'
      FCANTHR5 = 'TYPE OF CANCER-THROAT (RELATIVE #5)'
      FCANORL5 = 'TYPE OF CANCER-ORAL (RELATIVE #5)'
      FCANGLN5 = 'TYPE OF CANCER-LYMPH GLANDS (REL #5)'
      FCANESH5 = 'TYPE OF CANCER-ESOPHAGUS (RELATIVE #5)'
      FCANLRX5 = 'TYPE OF CANCER-LARYNX (RELATIVE #5)'
      FCANTHD5 = 'TYPE OF CANCER-THYROID (REL #5)'
      FCANFSP5 = 'CANCER-NON SPECIFIC FEMALE (REL #5)'
      FCANGSO5 = 'CANCER-OTHER GASTROINTESTINAL (REL #5)'
      FCANBDY5 = 'CANCER-THROUGHOUT BODY (REL #5)'
      FCANBMR5 = 'TYPE OF CANCER-BONE MARROW (REL #5)'
      FCANHKN5 = 'TYPE OF CANCER-HODGKINS (RELATIVE #5)'
      FCANTST5 = 'TYPE OF CANCER-TESTICULAR (REL #5)'
      FCANOT15 = 'CANCER-OTHER TYPE NOT LISTED (REL #5)'
      FCANOT25 = 'CANCER-OTHER NOT LISTED TYPE 2 (REL #5)'
      FCANOT35 = 'CANCER-OTHER NOT LISTED TYPE 3 (REL #5)'
      CANCOR15 = '1ST REPORTED CANCER TYPE (RELATIVE #5)'
      CANCOR25 = '2ND REPORTED CANCER TYPE (RELATIVE #5)'
      CANCOR35 = '3RD REPORTED CANCER TYPE (RELATIVE #5)'
      CANCOR45 = '4TH REPORTED CANCER TYPE (RELATIVE #5)'
      CANCOR55 = '5TH REPORTED CANCER TYPE (RELATIVE #5)'
      CANCOR65 = '6TH REPORTED CANCER TYPE (RELATIVE #5)'
      CANCOR75 = '7TH REPORTED CANCER TYPE (RELATIVE #5)'
      CANCOR85 = '8TH REPORTED CANCER TYPE (RELATIVE #5)'
      CANCOR95 = '9TH REPORTED CANCER TYPE (RELATIVE #5)'
      CANCR105 = '10TH REPORTED CANCER TYPE (REL #5)'
      ICD9CR15 = 'ICD9 CODE-1ST REP CANCER TYPE (REL #5)'
      ICD9CR25 = 'ICD9 CODE-2ND REP CANCER TYPE (REL #5)'
      ICD9CR35 = 'ICD9 CODE-3RD REP CANCER TYPE (REL #5)'
      ICD9CR45 = 'ICD9 CODE-4TH REP CANCER TYPE (REL #5)'
      ICD9CR55 = 'ICD9 CODE-5TH REP CANCER TYPE (REL #5)'
      ICD9CR65 = 'ICD9 CODE-6TH REP CANCER TYPE (REL #5)'
      ICD9CR75 = 'ICD9 CODE-7TH REP CANCER TYPE (REL #5)'
      ICD9CR85 = 'ICD9 CODE-8TH REP CANCER TYPE (REL #5)'
      ICD9CR95 = 'ICD9 CODE-9TH REP CANCER TYPE (REL #5)'
      ICD9C105 = 'ICD9 CODE-10TH REP CANCER TYPE (REL #5)'
      CRELNUM6 = 'RELATIVE CANCER REPORT-RELATIVE #6'
      FREL6    = 'RELATION TO S (RELATIVE #6)'
      FCANLNG6 = 'TYPE OF CANCER-LUNG (RELATIVE #6)'
      FCANBST6 = 'TYPE OF CANCER-BREAST (RELATIVE #6)'
      FCANCLN6 = 'TYPE OF CANCER-LARGE BOWEL COLON (REL#6)'
      FCANRCM6 = 'TYPE CANCER-LARGE BOWEL RECTUM (REL #6)'
      FCANPNC6 = 'TYPE OF CANCER-PANCREAS (RELATIVE #6)'
      FCANBDR6 = 'TYPE OF CANCER-BLADDER (RELATIVE #6)'
      FCANPST6 = 'TYPE OF CANCER-PROSTATE (RELATIVE #6)'
      FCANCRV6 = 'TYPE OF CANCER-CERVICAL (RELATIVE #6)'
      FCANEDO6 = 'TYPE CANCER-ENDOMETRIUM/CORPUS (REL #6)'
      FCANLUK6 = 'TYPE OF CANCER-LEUKEMIA(RELATIVE #6)'
      FCANNDL6 = 'TYPE OF CANCER-LYMPHOMA (RELATIVE #6)'
      FCANSMC6 = 'TYPE OF CANCER-STOMACH (RELATIVE #6)'
      FCANOVY6 = 'TYPE OF CANCER-OVARIAN (RELATIVE #6)'
      FCANKDY6 = 'TYPE OF CANCER-KIDNEY (RELATIVE #6)'
      FCANMLN6 = 'TYPE OF CANCER-MELANOMA (RELATIVE #6)'
      FCANNML6 = 'TYPE OF CANCER-NON MELANOMA (REL #6)'
      FCANNSC6 = 'CANCER-NON SPECIFIED SKIN CANCER (REL#6)'
      FCANBNE6 = 'TYPE OF CANCER-BONE (RELATIVE #6)'
      FCANLVR6 = 'TYPE OF CANCER-LIVER (RELATIVE #6)'
      FCANBRN6 = 'TYPE OF CANCER-BRAIN (RELATIVE #6)'
      FCANTHR6 = 'TYPE OF CANCER-THROAT (RELATIVE #6)'
      FCANORL6 = 'TYPE OF CANCER-ORAL (RELATIVE #6)'
      FCANGLN6 = 'TYPE OF CANCER-LYMPH GLANDS (REL #6)'
      FCANESH6 = 'TYPE OF CANCER-ESOPHAGUS (RELATIVE #6)'
      FCANLRX6 = 'TYPE OF CANCER-LARYNX (RELATIVE #6)'
      FCANTHD6 = 'TYPE OF CANCER-THYROID (REL#6)'
      FCANFSP6 = 'CANCER-NON SPECIFIC FEMALE (REL #6)'
      FCANGSO6 = 'CANCER-OTHER GASTROINTESTINAL (REL #6)'
      FCANBDY6 = 'CANCER-THROUGHOUT BODY (REL #6)'
      FCANBMR6 = 'TYPE OF CANCER-BONE MARROW (REL #6)'
      FCANHKN6 = 'TYPE OF CANCER-HODGKINS (RELATIVE #6)'
      FCANTST6 = 'TYPE OF CANCER-TESTICULAR (REL #6)'
      FCANOT16 = 'CANCER-OTHER TYPE NOT LISTED (REL #6)'
      FCANOT26 = 'CANCER-OTHER NOT LISTED TYPE 2 (REL #6)'
      FCANOT36 = 'CANCER-OTHER NOT LISTED TYPE 3 (REL #6)'
      CANCOR16 = '1ST REPORTED CANCER TYPE (RELATIVE #6)'
      CANCOR26 = '2ND REPORTED CANCER TYPE (RELATIVE #6)'
      CANCOR36 = '3RD REPORTED CANCER TYPE (RELATIVE #6)'
      CANCOR46 = '4TH REPORTED CANCER TYPE (RELATIVE #6)'
      CANCOR56 = '5TH REPORTED CANCER TYPE (RELATIVE #6)'
      CANCOR66 = '6TH REPORTED CANCER TYPE (RELATIVE #6)'
      CANCOR76 = '7TH REPORTED CANCER TYPE (RELATIVE #6)'
      CANCOR86 = '8TH REPORTED CANCER TYPE (RELATIVE #6)'
      CANCOR96 = '9TH REPORTED CANCER TYPE (RELATIVE #6)'
      CANCR106 = '10TH REPORTED CANCER TYPE (REL #6)'
      ICD9CR16 = 'ICD9 CODE-1ST REP CANCER TYPE (REL #6)'
      ICD9CR26 = 'ICD9 CODE-2ND REP CANCER TYPE (REL #6)'
      ICD9CR36 = 'ICD9 CODE-3RD REP CANCER TYPE (REL #6)'
      ICD9CR46 = 'ICD9 CODE-4TH REP CANCER TYPE (REL #6)'
      ICD9CR56 = 'ICD9 CODE-5TH REP CANCER TYPE (REL #6)'
      ICD9CR66 = 'ICD9 CODE-6TH REP CANCER TYPE (REL #6)'
      ICD9CR76 = 'ICD9 CODE-7TH REP CANCER TYPE (REL #6)'
      ICD9CR86 = 'ICD9 CODE-8TH REP CANCER TYPE (REL #6)'
      ICD9CR96 = 'ICD9 CODE-9TH REP CANCER TYPE (REL #6)'
      ICD9C106 = 'ICD9 CODE-10TH REP CANCER TYPE (REL #6)'
      CRELNUM7 = 'RELATIVE CANCER REPORT-RELATIVE # 7'
      FREL7    = 'RELATION TO S (RELATIVE #7)'
      FCANLNG7 = 'TYPE OF CANCER-LUNG (RELATIVE #7)'
      FCANBST7 = 'TYPE OF CANCER-BREAST (RELATIVE #7)'
      FCANCLN7 = 'TYPE OF CANCER-LARGE BOWEL COLON (REL#7)'
      FCANRCM7 = 'TYPE CANCER-LARGE BOWEL RECTUM (REL #7)'
      FCANPNC7 = 'TYPE OF CANCER-PANCREAS (RELATIVE #7)'
      FCANBDR7 = 'TYPE OF CANCER-BLADDER (RELATIVE #7)'
      FCANPST7 = 'TYPE OF CANCER-PROSTATE (RELATIVE #7)'
      FCANCRV7 = 'TYPE OF CANCER-CERVICAL (RELATIVE #7)'
      FCANENO7 = 'TYPE CANCER-ENDOMETRIUM/CORPUS (REL #7)'
      FCANLUK7 = 'TYPE OF CANCER-LEUKEMIA(RELATIVE #7)'
      FCANNDL7 = 'TYPE OF CANCER-LYMPHOMA (RELATIVE #7)'
      FCANSMC7 = 'TYPE OF CANCER-STOMACH (RELATIVE #7)'
      FCANOVY7 = 'TYPE OF CANCER-OVARIAN (RELATIVE #7)'
      FCANKDY7 = 'TYPE OF CANCER-KIDNEY (RELATIVE #7)'
      FCANMLN7 = 'TYPE OF CANCER-MELANOMA (RELATIVE #7)'
      FCANNML7 = 'TYPE OF CANCER-NON MELANOMA (REL #7)'
      FCANNSC7 = 'CANCER-NON SPECIFIED SKIN CANCER (REL#7)'
      FCANBNE7 = 'TYPE OF CANCER-BONE (RELATIVE #7)'
      FCANLVR7 = 'TYPE OF CANCER-LIVER (RELATIVE #7)'
      FCANBRN7 = 'TYPE OF CANCER-BRAIN (RELATIVE #7)'
      FCANTHR7 = 'TYPE OF CANCER-THROAT (RELATIVE #7)'
      FCANORL7 = 'TYPE OF CANCER-ORAL (RELATIVE #7)'
      FCANGLN7 = 'TYPE OF CANCER-LYMPH GLANDS (REL #7)'
      FCANESH7 = 'TYPE OF CANCER-ESOPHAGUS (RELATIVE #7)'
      FCANLRX7 = 'TYPE OF CANCER-LARYNX (RELATIVE #7)'
      FCANTHD7 = 'TYPE OF CANCER-THYROID (REL #7)'
      FCANFSP7 = 'CANCER-NON SPECIFIC FEMALE (REL #7)'
      FCANGSO7 = 'CANCER-OTHER GASTROINTESTINAL (REL #7)'
      FCANBDY7 = 'CANCER-THROUGHOUT BODY (REL #7)'
      FCANBMR7 = 'TYPE OF CANCER-BONE MARROW (REL #7)'
      FCANHKN7 = 'TYPE OF CANCER-HODGKINS (RELATIVE #7)'
      FCANTST7 = 'TYPE OF CANCER-TESTICULAR (REL #7)'
      FCANOT17 = 'CANCER-OTHER TYPE NOT LISTED (REL #7)'
      FCANOT27 = 'CANCER-OTHER NOT LISTED TYPE 2 (REL #7)'
      FCANOT37 = 'CANCER-OTHER NOT LISTED TYPE 3 (REL #7)'
      CANCOR17 = '1ST REPORTED CANCER TYPE (RELATIVE #7)'
      CANCOR27 = '2ND REPORTED CANCER TYPE (RELATIVE #7)'
      CANCOR37 = '3RD REPORTED CANCER TYPE (RELATIVE #7)'
      CANCOR47 = '4TH REPORTED CANCER TYPE (RELATIVE #7)'
      CANCOR57 = '5TH REPORTED CANCER TYPE (RELATIVE #7)'
      CANCOR67 = '6TH REPORTED CANCER TYPE (RELATIVE #7)'
      CANCOR77 = '7TH REPORTED CANCER TYPE (RELATIVE #7)'
      CANCOR87 = '8TH REPORTED CANCER TYPE (RELATIVE #7)'
      CANCOR97 = '9TH REPORTED CANCER TYPE (RELATIVE #7)'
      CANCR107 = '10TH REPORTED CANCER TYPE (REL #7)'
      ICD9CR17 = 'ICD9 CODE-1ST REP CANCER TYPE (REL #7)'
      ICD9CR27 = 'ICD9 CODE-2ND REP CANCER TYPE (REL #7)'
      ICD9CR37 = 'ICD9 CODE-3RD REP CANCER TYPE (REL #7)'
      ICD9CR47 = 'ICD9 CODE-4TH REP CANCER TYPE (REL #7)'
      ICD9CR57 = 'ICD9 CODE-5TH REP CANCER TYPE (REL #7)'
      ICD9CR67 = 'ICD9 CODE-6TH REP CANCER TYPE (REL #7)'
      ICD9CR77 = 'ICD9 CODE-7TH REP CANCER TYPE (REL #7)'
      ICD9CR87 = 'ICD9 CODE-8TH REP CANCER TYPE (REL #7)'
      ICD9CR97 = 'ICD9 CODE-9TH REP CANCER TYPE (REL #7)'
      ICD9C107 = 'ICD9 CODE-10TH REP CANCER TYPE (REL #7)'
      CRELNUM8 = 'RELATIVE CANCER REPORT-RELATIVE #8'
      FREL8    = 'RELATION TO S (RELATIVE #8)'
      FCANLNG8 = 'TYPE OF CANCER-LUNG (RELATIVE #8)'
      FCANBST8 = 'TYPE OF CANCER-BREAST (RELATIVE #8)'
      FCANCLN8 = 'TYPE OF CANCER-LARGE BOWEL COLON (REL#8)'
      FCANRCM8 = 'TYPE CANCER-LARGE BOWEL RECTUM (REL #8)'
      FCANPNC8 = 'TYPE OF CANCER-PANCREAS (RELATIVE #8)'
      FCANBDR8 = 'TYPE OF CANCER-BLADDER (RELATIVE #8)'
      FCANPST8 = 'TYPE OF CANCER-PROSTATE (RELATIVE #8)'
      FCANCRV8 = 'TYPE OF CANCER-CERVICAL (RELATIVE #8)'
      FCANEDO8 = 'TYPE CANCER-ENDOMETRIUM/CORPUS (REL#8)'
      FCANLUK8 = 'TYPE OF CANCER-LEUKEMIA(RELATIVE #8)'
      FCANNDL8 = 'TYPE OF CANCER-LYMPHOMA (RELATIVE #8)'
      FCANSMC8 = 'TYPE OF CANCER-STOMACH (RELATIVE #8)'
      FCANOVY8 = 'TYPE OF CANCER-OVARIAN (RELATIVE #8)'
      FCANKDY8 = 'TYPE OF CANCER-KIDNEY (RELATIVE #8)'
      FCANMLN8 = 'TYPE OF CANCER-MELANOMA (RELATIVE #8)'
      FCANNML8 = 'TYPE OF CANCER-NON MELANOMA (REL #8)'
      FCANNSC8 = 'CANCER-NON SPECIFIED SKIN CANCER (REL#8)'
      FCANBNE8 = 'TYPE OF CANCER-BONE (RELATIVE #8)'
      FCANLVR8 = 'TYPE OF CANCER-LIVER (RELATIVE #8)'
      FCANBRN8 = 'TYPE OF CANCER-BRAIN (RELATIVE #8)'
      FCANTHR8 = 'TYPE OF CANCER-THROAT (RELATIVE #8)'
      FCANORL8 = 'TYPE OF CANCER-ORAL (RELATIVE #8)'
      FCANGLN8 = 'TYPE OF CANCER-LYMPH GLANDS (REL #8)'
      FCANESH8 = 'TYPE OF CANCER-ESOPHAGUS (RELATIVE #8)'
      FCANLRX8 = 'TYPE OF CANCER-LARYNX (RELATIVE #8)'
      FCANTHD8 = 'TYPE OF CANCER-THYROID (REL #8)'
      FCANFSP8 = 'CANCER-NON SPECIFIC FEMALE (REL #8)'
      FCANGSO8 = 'CANCER-OTHER GASTROINTESTINAL (REL #8)'
      FCANBDY8 = 'CANCER-THROUGHOUT BODY (REL #8)'
      FCANBMR8 = 'TYPE OF CANCER-BONE MARROW (REL #8)'
      FCANHKN8 = 'TYPE OF CANCER-HODGKINS (RELATIVE #8)'
      FCANTST8 = 'TYPE OF CANCER-TESTICULAR (REL #8)'
      FCANOT18 = 'CANCER-OTHER TYPE NOT LISTED (REL #8)'
      FCANOT28 = 'CANCER-OTHER NOT LISTED TYPE 2 (REL #8)'
      FCANOT38 = 'CANCER-OTHER NOT LISTED TYPE 3 (REL #8)'
      CANCOR18 = '1ST REPORTED CANCER TYPE (RELATIVE #8)'
      CANCOR28 = '2ND REPORTED CANCER TYPE (RELATIVE #8)'
      CANCOR38 = '3RD REPORTED CANCER TYPE (RELATIVE #8)'
      CANCOR48 = '4TH REPORTED CANCER TYPE (RELATIVE #8)'
      CANCOR58 = '5TH REPORTED CANCER TYPE (RELATIVE #8)'
      CANCOR68 = '6TH REPORTED CANCER TYPE (RELATIVE #8)'
      CANCOR78 = '7TH REPORTED CANCER TYPE (RELATIVE #8)'
      CANCOR88 = '8TH REPORTED CANCER TYPE (RELATIVE #8)'
      CANCOR98 = '9TH REPORTED CANCER TYPE (RELATIVE #8)'
      CANCR108 = '10TH REPORTED CANCER TYPE (REL #8)'
      ICD9CR18 = 'ICD9 CODE-1ST REP CANCER TYPE (REL #8)'
      ICD9CR28 = 'ICD9 CODE-2ND REP CANCER TYPE (REL #8)'
      ICD9CR38 = 'ICD9 CODE-3RD REP CANCER TYPE (REL #8)'
      ICD9CR48 = 'ICD9 CODE-4TH REP CANCER TYPE (REL #8)'
      ICD9CR58 = 'ICD9 CODE-5TH REP CANCER TYPE (REL #8)'
      ICD9CR68 = 'ICD9 CODE-6TH REP CANCER TYPE (REL #8)'
      ICD9CR78 = 'ICD9 CODE-7TH REP CANCER TYPE (REL #8)'
      ICD9CR88 = 'ICD9 CODE-8TH REP CANCER TYPE (REL #8)'
      ICD9CR98 = 'ICD9 CODE-9TH REP CANCER TYPE (REL #8)'
      ICD9C108 = 'ICD9 CODE-10TH REP CANCER TYPE (REL #8)'
      CRELNUM9 = 'RELATIVE CANCER REPORT-RELATIVE #9'
      FREL9    = 'RELATION TO S (RELATIVE #9)'
      FCANLNG9 = 'TYPE OF CANCER-LUNG (RELATIVE #9)'
      FCANBST9 = 'TYPE OF CANCER-BREAST (RELATIVE #9)'
      FCANCLN9 = 'TYPE OF CANCER-LARGE BOWEL COLON (REL#9)'
      FCANRCM9 = 'TYPE CANCER-LARGE BOWEL RECTUM (REL #9)'
      FCANPNC9 = 'TYPE OF CANCER-PANCREAS (RELATIVE #9)'
      FCANBDR9 = 'TYPE OF CANCER-BLADDER (RELATIVE #9)'
      FCANPST9 = 'TYPE OF CANCER-PROSTATE (RELATIVE #9)'
      FCANCRV9 = 'TYPE OF CANCER-CERVICAL (RELATIVE #9)'
      FCANEDO9 = 'TYPE CANCER-ENDOMETRIUM/CORPUS (REL #9)'
      FCANLUK9 = 'TYPE OF CANCER-LEUKEMIA(RELATIVE #9)'
      FCANNDL9 = 'TYPE OF CANCER-LYMPHOMA (RELATIVE #9)'
      FCANSMC9 = 'TYPE OF CANCER-STOMACH (RELATIVE #9)'
      FCANOVY9 = 'TYPE OF CANCER-OVARIAN (RELATIVE #9)'
      FCANKDY9 = 'TYPE OF CANCER-KIDNEY (RELATIVE #9)'
      FCANMLN9 = 'TYPE OF CANCER-MELANOMA (RELATIVE #9)'
      FCANNML9 = 'TYPE OF CANCER-NON MELANOMA (REL# 9)'
      FCANNSC9 = 'CANCER-NON SPECIFIED SKIN CANCER (REL#9)'
      FCANBNE9 = 'TYPE OF CANCER-BONE (RELATIVE #9)'
      FCANLVR9 = 'TYPE OF CANCER-LIVER (RELATIVE #9)'
      FCANBRN9 = 'TYPE OF CANCER-BRAIN (RELATIVE #9)'
      FCANTHR9 = 'TYPE OF CANCER-THROAT (RELATIVE#9)'
      FCANORL9 = 'TYPE OF CANCER-ORAL (RELATIVE #9)'
      FCANGLN9 = 'TYPE OF CANCER-LYMPH GLANDS (REL #9)'
      FCANESH9 = 'TYPE OF CANCER-ESOPHAGUS (RELATIVE #9)'
      FCANLRX9 = 'TYPE OF CANCER-LARYNX (RELATIVE #9)'
      FCANTHD9 = 'TYPE OF CANCER-THYROID (REL #9)'
      FCANFSP9 = 'CANCER-NON SPECIFIC FEMALE (REL #9)'
      FCANGSO9 = 'CANCER-OTHER GASTROINTESTINAL (REL #9)'
      FCANBDY9 = 'CANCER-THROUGHOUT BODY (REL #9)'
      FCANBMR9 = 'TYPE OF CANCER-BONE MARROW (REL #9)'
      FCANHKN9 = 'TYPE OF CANCER-HODGKINS (RELATIVE #9)'
      FCANTST9 = 'TYPE OF CANCER-TESTICULAR (REL #9)'
      FCANOT19 = 'CANCER-OTHER TYPE NOT LISTED (REL #9)'
      FCANOT29 = 'CANCER-OTHER NOT LISTED TYPE 2 (REL #9)'
      FCANOT39 = 'CANCER-OTHER NOT LISTED TYPE 3 (REL #9)'
      CANCOR19 = '1ST REPORTED CANCER TYPE (RELATIVE #9)'
      CANCOR29 = '2ND REPORTED CANCER TYPE (RELATIVE #9)'
      CANCOR39 = '3RD REPORTED CANCER TYPE (RELATIVE #9)'
      CANCOR49 = '4TH REPORTED CANCER TYPE (RELATIVE #9)'
      CANCOR59 = '5TH REPORTED CANCER TYPE (RELATIVE #9)'
      CANCOR69 = '6TH REPORTED CANCER TYPE (RELATIVE #9)'
      CANCOR79 = '7TH REPORTED CANCER TYPE (RELATIVE #9)'
      CANCOR89 = '8TH REPORTED CANCER TYPE (RELATIVE #9)'
      CANCOR99 = '9TH REPORTED CANCER TYPE (RELATIVE #9)'
      CANCR109 = '10TH REPORTED CANCER TYPE (REL #9)'
      ICD9CR19 = 'ICD9 CODE-1ST REP CANCER TYPE (REL #9)'
      ICD9CR29 = 'ICD9 CODE-2ND REP CANCER TYPE (REL #9)'
      ICD9CR39 = 'ICD9 CODE-3RD REP CANCER TYPE (REL #9)'
      ICD9CR49 = 'ICD9 CODE-4TH REP CANCER TYPE (REL #9)'
      ICD9CR59 = 'ICD9 CODE-5TH REP CANCER TYPE (REL #9)'
      ICD9CR69 = 'ICD9 CODE-6TH REP CANCER TYPE (REL #9)'
      ICD9CR79 = 'ICD9 CODE-7TH REP CANCER TYPE (REL #9)'
      ICD9CR89 = 'ICD9 CODE-8TH REP CANCER TYPE (REL #9)'
      ICD9CR99 = 'ICD9 CODE-9TH REP CANCER TYPE (REL #9)'
      ICD9C109 = 'ICD9 CODE-10TH REP CANCER TYPE (REL #9)'
      RESTNUM1 = 'NURSING HOME/NON FACILITY ADMISSION #1'
      ADMSNPC1 = 'TYPE OF FACILITY-ADMISSION #1'
      ENTERFM1 = 'PLACE FROM WHICH ENTERED FACILITY ADM#1'
      YEARETR1 = 'YEAR ENTERED FACILITY-ADMISSION #1'
      NURSCRE1 = 'S REQUIRED SKILLED NURSING CARE ADM #1'
      SURGRCP1 = 'S RECUPERATING FROM SURG-ADMISSION #1'
      NEEDHLP1 = 'NEED HELP W/ BATH, EAT, DRESS-ADM #1'
      REQSPCD1 = 'S REQUIRED MED/PHYSICAL THERAPY-ADM#1'
      CONFUSD1 = 'TOO CONFUSED TO LIVE INDEPENDTLY-ADM #1'
      MDCNTR11 = '1ST REPORTED DISEASE-ADMISSION #1'
      MDCNTR21 = '2ND REPORTED DISEASE-ADMISSION #1'
      MDCNTR31 = '3RD REPORTED DISEASE-ADMISSION #1'
      MDCNTR41 = '4TH REPORTED DISEASE-ADMISSION #1'
      MDCNTR51 = '5TH REPORTED DISEASE-ADMISSION #1'
      MDCNTR61 = '6TH REPORTED DISEASE-ADMISSION #1'
      CNDTLZH1 = 'ALZHEIMERS DISEASE REPOIRTED-ADM #1'
      CNDTCNR1 = 'CANCER REPORTED-ADMISSION #1'
      CNDTDPS1 = 'DEPRESSION REPORTED-ADMISSION #1'
      CNDTFRL1 = 'FRAILTY REPORTED-ADMISSION #1'
      CNDTHDR1 = 'ARTERIOSCLEROSIS REPORTED-ADM #1'
      CNDTINN1 = 'INCONTINENCE REPORTED-ADMISSION #1'
      CNDTNMD1 = 'NO MED CONDITION REPORTED-ADM #1'
      CNDTSNL1 = 'SENILITY REPORTED-ADMISSION #1'
      CNDTSTK1 = 'STROKE REPORTED-ADMISSION #1'
      CNDTOTH1 = 'OTHER DISEASE REPORTED-ADMISSION #1'
      CNDTART1 = 'ARTHRITIS REPORTED-ADMISSION #1'
      CNDTDRG1 = 'ALCHOHOLISM/DRUG ABUSE REPORTED-ADM #1'
      CNDTHPF1 = 'FRACTURE REPORTED-ADMISSION #1'
      CNDTOFC1 = 'OTHER FRACTURES REPORTED-ADMISSION #1'
      CNDTHTC1 = 'HEART CONDITION REPORTED-ADMISSION #1'
      CNDTDIB1 = 'DIABETES REPORTED-ADMISSION #1'
      CNDTBLD1 = 'BLINDNESS REPORTED-ADMISSION #1'
      CNDTOST1 = 'OSTEOPOROSIS REPORTED-ADMISSION #1'
      CNDTPRK1 = 'PARKINSONS DISEASE REPORTED-ADM #1'
      CNDTTME1 = 'TIME S STAYED IN FACILITY-ADM #1'
      CNDTUNT1 = 'TIME UNIT-ADMISSION #1'
      OTHADMN1 = 'ANY OTHER ADMISSIONS BESIDES ADM #1'
      RESTNUM2 = 'NURSING HOME/NON FACILITY ADMISSION #2'
      ADMSNPC2 = 'TYPE OF FACILITY-ADMISSION #2'
      ENTERFM2 = 'PLACE FROM WHICH ENTERED FACILITY ADM#2'
      YEARETR2 = 'YEAR ENTERED FACILITY-ADMISSION #2'
      NURSCRE2 = 'S REQUIRED SKILLED NURSING CARE ADM #2'
      SURGRCP2 = 'S RECUPERATING FROM SURG-ADMISSION #2'
      NEEDHLP2 = 'NEED HELP W/ BATH, EAT, DRESS-ADM #2'
      REQSPCD2 = 'S REQUIRED MED/PHYSICAL THERAPY-ADM#2'
      CONFUSD2 = 'TOO CONFUSED TO LIVE INDEPENDTLY-ADM #2'
      MDCNTR12 = '1ST REPORTED DISEASE-ADMISSION #2'
      MDCNTR22 = '2ND REPORTED DISEASE-ADMISSION #2'
      MDCNTR32 = '3RD REPORTED DISEASE-ADMISSION #2'
      MDCNTR42 = '4TH REPORTED DISEASE-ADMISSION #2'
      MDCNTR52 = '5TH REPORTED DISEASE-ADMISSION #2'
      MDCNTR62 = '6TH REPORTED DISEASE-ADMISSION #2'
      CNDTLZH2 = 'ALZHEIMERS DISEASE REPOIRTED-ADM #2'
      CNDTCNR2 = 'CANCER REPORTED-ADMISSION #2'
      CNDTDPS2 = 'DEPRESSION REPORTED-ADMISSION #2'
      CNDTFRL2 = 'FRAILTY REPORTED-ADMISSION #2'
      CNDTHDR2 = 'ARTERIOSCLEROSIS REPORTED-ADM #2'
      CNDTINN2 = 'INCONTINENCE REPORTED-ADMISSION #2'
      CNDTNMD2 = 'NO MED CONDITION REPORTED-ADM #2'
      CNDTSNL2 = 'SENILITY REPORTED-ADMISSION #2'
      CNDTSTK2 = 'STROKE REPORTED-ADMISSION #2'
      CNDTOTH2 = 'OTHER DISEASE REPORTED-ADMISSION #2'
      CNDTART2 = 'ARTHRITIS REPORTED-ADMISSION #2'
      CNDTDRG2 = 'ALCHOHOLISM/DRUG ABUSE REPORTED-ADM #2'
      CNDTHPF2 = 'FRACTURE REPORTED-ADMISSION #2'
      CNDTOFC2 = 'OTHER FRACTURES REPORTED-ADMISSION #2'
      CNDTHTC2 = 'HEART CONDITION REPORTED-ADMISSION #2'
      CNDTDIB2 = 'DIABETES REPORTED-ADMISSION #2'
      CNDTBLD2 = 'BLINDNESS REPORTED-ADMISSION #2'
      CNDTOST2 = 'OSTEOPOROSIS REPORTED-ADMISSION #2'
      CNDTPRK2 = 'PARKINSONS DISEASE REPORTED-ADM #2'
      CNDTTME2 = 'TIME S STAYED IN FACILITY-ADM #2'
      CNDTUNT2 = 'TIME UNIT-ADMISSION #2'
      OTHADMN2 = 'ANY OTHER ADMISSIONS BESIDES ADM #2'
      RESTNUM3 = 'NURSING HOME/NON FACILITY ADMISSION #3'
      ADMSNPC3 = 'TYPE OF FACILITY-ADMISSION #3'
      ENTERFM3 = 'PLACE FROM WHICH ENTERED FACILITY ADM #3'
      YEARETR3 = 'YEAR ENTERED FACILITY-ADMISSION #3'
      NURSCRE3 = 'S REQUIRED SKILLED NURSING CARE ADM #3'
      SURGRCP3 = 'S RECUPERATING FROM SURG-ADMISSION #3'
      NEEDHLP3 = 'NEED HELP W/ BATH, EAT, DRESS-ADM #3'
      REQSPCD3 = 'S REQUIRED MED/PHYSICAL THERAPY-ADM#3'
      CONFUSD3 = 'TOO CONFUSED TO LIVE INDEPENDTLY-ADM #3'
      MDCNTR13 = '1ST REPORTED DISEASE-ADMISSION #3'
      MDCNTR23 = '2ND REPORTED DISEASE-ADMISSION #3'
      MDCNTR33 = '3RD REPORTED DISEASE-ADMISSION #3'
      MDCNTR43 = '4TH REPORTED DISEASE-ADMISSION #3'
      MDCNTR53 = '5TH REPORTED DISEASE-ADMISSION #3'
      MDCNTR63 = '6TH REPORTED DISEASE-ADMISSION #3'
      CNDTLZH3 = 'ALZHEIMERS DISEASE REPOIRTED-ADM #3'
      CNDTCNR3 = 'CANCER REPORTED-ADMISSION #3'
      CNDTDPS3 = 'DEPRESSION REPORTED-ADMISSION #3'
      CNDTFRL3 = 'FRAILTY REPORTED-ADMISSION #3'
      CNDTHDR3 = 'ARTERIOSCLEROSIS REPORTED-ADM #3'
      CNDTINN3 = 'INCONTINENCE REPORTED-ADMISSION #3'
      CNDTNMD3 = 'NO MED CONDITION REPORTED-ADM #3'
      CNDTSNL3 = 'SENILITY REPORTED-ADMISSION #3'
      CNDTSTK3 = 'STROKE REPORTED-ADMISSION #3'
      CNDTOTH3 = 'OTHER DISEASE REPORTED-ADMISSION #3'
      CNDTART3 = 'ARTHRITIS REPORTED-ADMISSION #3'
      CNDTDRG3 = 'ALCHOHOLISM/DRUG ABUSE REPORTED-ADM #3'
      CNDTHPF3 = 'FRACTURE REPORTED-ADMISSION #3'
      CNDTOFC3 = 'OTHER FRACTURES REPORTED-ADMISSION #3'
      CNDTHTC3 = 'HEART CONDITION REPORTED-ADMISSION #3'
      CNDTDIB3 = 'DIABETES REPORTED-ADMISSION #3'
      CNDTBLD3 = 'BLINDNESS REPORTED-ADMISSION #3'
      CNDTOST3 = 'OSTEOPOROSIS REPORTED-ADMISSION #3'
      CNDTPRK3 = 'PARKINSONS DISEASE REPORTED-ADM #3'
      CNDTTME3 = 'TIME S STAYED IN FACILITY-ADM #3'
      CNDTUNT3 = 'TIME UNIT-ADMISSION #3'
      OTHADMN3 = 'ANY OTHER ADMISSIONS BESIDES ADM #3'
      RESTNUM4 = 'NURSING HOME/NON FACILITY ADMISSION #4'
      ADMSNPC4 = 'TYPE OF FACILITY-ADMISSION #4'
      ENTERFM4 = 'PLACE FROM WHICH ENTERED FACILITY ADM #4'
      YEARETR4 = 'YEAR ENTERED FACILITY-ADMISSION #4'
      NURSCRE4 = 'S REQUIRED SKILLED NURSING CARE ADM #4'
      SURGRCP4 = 'S RECUPERATING FROM SURG-ADMISSION #4'
      NEEDHLP4 = 'NEED HELP W/ BATH, EAT, DRESS-ADM #4'
      REQSPCD4 = 'S REQUIRED MED/PHYSICAL THERAPY-ADM #4'
      CONFUSD4 = 'TOO CONFUSED TO LIVE INDEPENDTLY-ADM #4'
      MDCNTR14 = '1ST REPORTED DISEASE-ADMISSION #4'
      MDCNTR24 = '2ND REPORTED DISEASE-ADMISSION #4'
      MDCNTR34 = '3RD REPORTED DISEASE-ADMISSION #4'
      MDCNTR44 = '4TH REPORTED DISEASE-ADMISSION #4'
      MDCNTR54 = '5TH REPORTED DISEASE-ADMISSION #4'
      MDCNTR64 = '6TH REPORTED DISEASE-ADMISSION #4'
      CNDTLZH4 = 'ALZHEIMERS DISEASE REPOIRTED-ADM #4'
      CNDTCNR4 = 'CANCER REPORTED-ADMISSION #4'
      CNDTDPS4 = 'DEPRESSION REPORTED-ADMISSION #4'
      CNDTFRL4 = 'FRAILTY REPORTED-ADMISSION #4'
      CNDTHDR4 = 'ARTERIOSCLEROSIS REPORTED-ADM #4'
      CNDTINN4 = 'INCONTINENCE REPORTED-ADMISSION #4'
      CNDTNMD4 = 'NO MED CONDITION REPORTED-ADM #4'
      CNDTSNL4 = 'SENILITY REPORTED-ADMISSION #4'
      CNDTSTK4 = 'STROKE REPORTED-ADMISSION #4'
      CNDTOTH4 = 'OTHER DISEASE REPORTED-ADMISSION #4'
      CNDTART4 = 'ARTHRITIS REPORTED-ADMISSION #4'
      CNDTDRG4 = 'ALCHOHOLISM/DRUG ABUSE REPORTED-ADM #4'
      CNDTHPF4 = 'FRACTURE REPORTED-ADMISSION #4'
      CNDTOFC4 = 'OTHER FRACTURES REPORTED-ADMISSION #4'
      CNDTHTC4 = 'HEART CONDITION REPORTED-ADMISSION #4'
      CNDTDIB4 = 'DIABETES REPORTED-ADMISSION #4'
      CNDTBLD4 = 'BLINDNESS REPORTED-ADMISSION #4'
      CNDTOST4 = 'OSTEOPOROSIS REPORTED-ADMISSION #4'
      CNDTPRK4 = 'PARKINSONS DISEASE REPORTED-ADM #4'
      CNDTTME4 = 'TIME S STAYED IN FACILITY-ADM #4'
      CNDTUNT4 = 'TIME UNIT-ADMISSION #4'
      OTHADMN4 = 'ANY OTHER ADMISSIONS BESIDES ADM #4'
      RESTNUM5 = 'NURSING HOME/NON FACILITY ADMISSION #5'
      ADMSNPC5 = 'TYPE OF FACILITY-ADMISSION #5'
      ENTERFM5 = 'PLACE FROM WHICH ENTERED FACILITY ADM #5'
      YEARETR5 = 'YEAR ENTERED FACILITY-ADMISSION #5'
      NURSCRE5 = 'S REQUIRED SKILLED NURSING CARE ADM #5'
      SURGRCP5 = 'S RECUPERATING FROM SURG-ADMISSION #5'
      NEEDHLP5 = 'NEED HELP W/ BATH, EAT, DRESS-ADM #5'
      REQSPCD5 = 'S REQUIRED MED/PHYSICAL THERAPY-ADM #5'
      CONFUSD5 = 'TOO CONFUSED TO LIVE INDEPENDTLY-ADM #5'
      MDCNTR15 = '1ST REPORTED DISEASE-ADMISSION #5'
      MDCNTR25 = '2ND REPORTED DISEASE-ADMISSION #5'
      MDCNTR35 = '3RD REPORTED DISEASE-ADMISSION #5'
      MDCNTR45 = '4TH REPORTED DISEASE-ADMISSION #5'
      MDCNTR55 = '5TH REPORTED DISEASE-ADMISSION #5'
      MDCNTR65 = '6TH REPORTED DISEASE-ADMISSION #5'
      CNDTLZH5 = 'ALZHEIMERS DISEASE REPOIRTED-ADM #5'
      CNDTCNR5 = 'CANCER REPORTED-ADMISSION #5'
      CNDTDPS5 = 'DEPRESSION REPORTED-ADMISSION #5'
      CNDTFRL5 = 'FRAILTY REPORTED-ADMISSION #5'
      CNDTHDR5 = 'ARTERIOSCLEROSIS REPORTED-ADM #5'
      CNDTINN5 = 'INCONTINENCE REPORTED-ADMISSION #5'
      CNDTNMD5 = 'NO MED CONDITION REPORTED-ADM #5'
      CNDTSNL5 = 'SENILITY REPORTED-ADMISSION #5'
      CNDTSTK5 = 'STROKE REPORTED-ADMISSION #5'
      CNDTOTH5 = 'OTHER DISEASE REPORTED-ADMISSION #5'
      CNDTART5 = 'ARTHRITIS REPORTED-ADMISSION #5'
      CNDTDRG5 = 'ALCHOHOLISM/DRUG ABUSE REPORTED-ADM #5'
      CNDTHPF5 = 'FRACTURE REPORTED-ADMISSION #5'
      CNDTOFC5 = 'OTHER FRACTURES REPORTED-ADMISSION #5'
      CNDTHTC5 = 'HEART CONDITION REPORTED-ADMISSION #5'
      CNDTDIB5 = 'DIABETES REPORTED-ADMISSION #5'
      CNDTBLD5 = 'BLINDNESS REPORTED-ADMISSION #5'
      CNDTOST5 = 'OSTEOPOROSIS REPORTED-ADMISSION #5'
      CNDTPRK5 = 'PARKINSONS DISEASE REPORTED-ADM #5'
      CNDTTME5 = 'TIME S STAYED IN FACILITY-ADM #5'
      CNDTUNT5 = 'TIME UNIT-ADMISSION #5'
      OTHADMN5 = 'ANY OTHER ADMISSIONS BESIDES ADM #5'
      RESTNUM6 = 'NURSING HOME/NON FACILITY ADMISSION #6'
      ADMSNPC6 = 'TYPE OF FACILITY-ADMISSION #6'
      ENTERFM6 = 'PLACE FROM WHICH ENTERED FACILITY ADM#6'
      YEARETR6 = 'YEAR ENTERED FACILITY-ADMISSION #6'
      NURSCRE6 = 'S REQUIRED SKILLED NURSING CARE ADM #6'
      SURGRCP6 = 'S RECUPERATING FROM SURG-ADMISSION #6'
      NEEDHLP6 = 'NEED HELP W/ BATH, EAT, DRESS-ADM #6'
      REQSPCD6 = 'S REQUIRED MED/PHYSICAL THERAPY-ADM #6'
      CONFUSD6 = 'TOO CONFUSED TO LIVE INDEPENDTLY-ADM #6'
      MDCNTR16 = '1ST REPORTED DISEASE-ADMISSION #6'
      MDCNTR26 = '2ND REPORTED DISEASE-ADMISSION #6'
      MDCNTR36 = '3RD REPORTED DISEASE-ADMISSION #6'
      MDCNTR46 = '4TH REPORTED DISEASE-ADMISSION #6'
      MDCNTR56 = '5TH REPORTED DISEASE-ADMISSION #6'
      MDCNTR66 = '6TH REPORTED DISEASE-ADMISSION #6'
      CNDTLZH6 = 'ALZHEIMERS DISEASE REPOIRTED-ADM #6'
      CNDTCNR6 = 'CANCER REPORTED-ADMISSION #6'
      CNDTDPS6 = 'DEPRESSION REPORTED-ADMISSION #6'
      CNDTFRL6 = 'FRAILTY REPORTED-ADMISSION #6'
      CNDTHDR6 = 'ARTERIOSCLEROSIS REPORTED-ADM #6'
      CNDTINN6 = 'INCONTINENCE REPORTED-ADMISSION #6'
      CNDTNMD6 = 'NO MED CONDITION REPORTED-ADM #6'
      CNDTSNL6 = 'SENILITY REPORTED-ADMISSION #6'
      CNDTSTK6 = 'STROKE REPORTED-ADMISSION #6'
      CNDTOTH6 = 'OTHER DISEASE REPORTED-ADMISSION #6'
      CNDTART6 = 'ARTHRITIS REPORTED-ADMISSION #6'
      CNDTDRG6 = 'ALCHOHOLISM/DRUG ABUSE REPORTED-ADM #6'
      CNDTHPF6 = 'FRACTURE REPORTED-ADMISSION #6'
      CNDTOFC6 = 'OTHER FRACTURES REPORTED-ADMISSION #6'
      CNDTHTC6 = 'HEART CONDITION REPORTED-ADMISSION #6'
      CNDTDIB6 = 'DIABETES REPORTED-ADMISSION #6'
      CNDTBLD6 = 'BLINDNESS REPORTED-ADMISSION #6'
      CNDTOST6 = 'OSTEOPOROSIS REPORTED-ADMISSION #6'
      CNDTPRK6 = 'PARKINSONS DISEASE REPORTED-ADM #6'
      CNDTTME6 = 'TIME S STAYED IN FACILITY-ADM #6'
      CNDTUNT6 = 'TIME UNIT-ADMISSION #6'
      OTHADMN6 = 'ANY OTHER ADMISSIONS BESIDES ADM #6'
      HOSPNM1  = 'ADDITIONAL HOSP STAY REPORT-STAY #1'
      SHOSTT1  = 'CONDITION WHICH S WAS HOSP-STAY #1'
      CONDMN1  = 'MONTH OF ADMISSION STAY #1'
      CONDDY1  = 'DAY OF ADMISSION STAY #1'
      CONDYR1  = 'YEAR OF ADMISSION STAY #1'
      B113DS1  = 'DISCREPANCY FLAG FOR B113 STAY #1'
      HOSPNM2  = 'HOSPITAL STAY REPORT-STAY #2'
      SHOSTT2  = 'CONDITION WHICH S WAS HOSP-STAY #2'
      CONDMN2  = 'MONTH OF ADMISSION STAY #2'
      CONDDY2  = 'DAY OF ADMISSION STAY #2'
      CONDYR2  = 'YEAR OF ADMISSION STAY #2'
      B113DS2  = 'DISCREPANCY FLAG FOR B113 STAY #2'
      HOSPNM3  = 'ADDITIONAL HOSP STAY REPORT-STAY #3'
      SHOSTT3  = 'CONDITION WHICH S WAS HOSP-STAY #3'
      CONDMN3  = 'MONTH OF ADMISSION STAY #3'
      CONDDY3  = 'DAY OF ADMISSION STAY #3'
      CONDYR3  = 'YEAR OF ADMISSION STAY #1'
      B113DS3  = 'DISCREPANCY FLAG FOR B113 STAY #3'
      HOSPNM4  = 'ADDITIONAL HOSP STAY REPORT-STAY #4'
      SHOSPTT4 = 'CONDITION WHICH S WAS HOSP-STAY #4'
      CONDMN4  = 'MONTH OF ADDMISSION STAY #4'
      CONDDY4  = 'DAY OF ADMISSION STAY #4'
      CONDYR4  = 'YEAR OF ADMISSION STAY #4'
      B113D4   = 'DISCREPANCY FLAG FOR B113 STAY #4'
      HOSPNM5  = 'ADDITIONAL HOSP STAY REPORT-STAY #5'
      SHOSTT5  = 'CONDITION WHICH S WAS HOSP-STAY #5'
      CONDMN5  = 'MONTH OF ADMISSION STAY #5'
      CONDDY5  = 'DAY OF ADMISSION STAY #5'
      CONDYR5  = 'YEAR OF ADMISSION STAY #5'
      B113DS5  = 'DISCREPANCY FLAG FOR B113 STAY #5'
      HOSPNM6  = 'ADDITIONAL HOSP STAY REPORT-STAY #6'
      SHOSTT6  = 'CONDITION WHICH S WAS HOSP-STAY #6'
      CONDMN6  = 'MONTH OF ADMISSION STAY #6'
      CONDDY6  = 'DAY OF ADMISSION STAY #6'
      CONDYR6  = 'YEAR OF ADMISSION STAY #6'
      B113DS6  = 'DISCREPANCY FLAG FOR B113 STAY #6'
      HOSPNM7  = 'HOSPITAL STAY REPORT-STAY 7'
      SHOSTT7  = 'CONDITION WHICH S WAS HOSP-STAY #7'
      CONDMN7  = 'MONTH OF ADMISSION STAY #7'
      CONDDY7  = 'DAY OF ADMISSION STAY #7'
      CONDYR7  = 'YEAR OF ADMISSION STAY #7'
      B113DS7  = 'DISCREPANCY FLAG FOR B113 STAY #7'
      HOSPNM8  = 'ADDITIONAL HOSP STAY REPORT-STAY #8'
      SHOSTT8  = 'CONDITION WHICH S WAS HOSP-STAY #8'
      CONDMN8  = 'MONTH OF ADMISSION STAY #8'
      CONDDY8  = 'DAY OF ADMISSION STAY #8'
      CONDYR8  = 'YEAR OF ADMISSION STAY #8'
      B113DS8  = 'DISCREPANCY FLAG FOR B113 STAY #8'
      HOSPNM9  = 'ADDITIONAL HOSP STAY REPORT-STAY #9'
      SHOSTT9  = 'CONDITION WHICH S WAS HOSP-STAY #9'
      CONDMN9  = 'MONTH OF ADDMISSION STAY #9'
      CONDDY9  = 'DAY OF ADMISSION STAY #9'
      CONDYR9  = 'YEAR OF ADMISSION STAY #9'
      B113DS9  = 'DISCREPANCY FLAG FOR B113 STAY #9'
      HOSPNM10 = 'ADDITIONAL HOSP STAY REPORT-STAY #10'
      SHOSTT10 = 'CONDITION WHICH S WAS HOSP-STAY #10'
      CONDMN10 = 'MONTH OF ADMISSION STAY #10'
      CONDDY10 = 'DAY OF ADMISSION STAY #10'
      CONDYR10 = 'YEAR OF ADMISSION STAY #10'
      B113DS10 = 'DISCREPANCY FLAG FOR B113 STAY #10'
      HOSPNM11 = 'ADDITIONAL HOSP STAY REPORT-STAY #11'
      SHOSTT11 = 'CONDITION WHICH S WAS HOSP-STAY #11'
      CONDMN11 = 'MONTH OF ADMISSION STAY #11'
      CONDDY11 = 'DAY OF ADMISSION STAY #11'
      CONDYR11 = 'YEAR OF ADMISSION STAY #11'
      B113DS11 = 'DISCREPANCY FLAG FOR B113 STAY #11'
      HOSPNM12 = 'ADDITIONAL HOSP STAY REPORT-STAY #12'
      SHOSTT12 = 'CONDITION WHICH S WAS HOSP-STAY #12'
      CONDMN12 = 'MONTH OF ADMISSION STAY #12'
      CONDDY12 = 'DAY OF ADMISSION STAY #12'
      CONDYR12 = 'YEAR OF ADMISSION STAY #12'
      B113DS12 = 'DISCREPANCY FLAG FOR B113 STAY #12'
      HOSPNM13 = 'ADDITIONAL HOSP STAY REPORT-STAY #13'
      SHOSTT13 = 'CONDITION WHICH S WAS HOSP-STAY #13'
      CONDMN13 = 'MONTH OF ADMISSION STAY #13'
      CONDDY13 = 'DAY OF ADMISSION STAY #13'
      CONDYR13 = 'YEAR OF ADMISSION STAY #13'
      B113DS13 = 'DISCREPANCY FLAG FOR B113 STAY #13'
      HOSPNM14 = 'ADDITIONAL HOSP STAY REPORT-STAY #14'
      SHOSTT14 = 'CONDITION WHICH S WAS HOSP-STAY #14'
      CONDMN14 = 'MONTH OF ADMISSION STAY #14'
      CONDDY14 = 'DAY OF ADMISSION STAY #14'
      CONDYR14 = 'YEAR OF ADMISSION STAY #14'
      B113DS14 = 'DISCREPANCY FLAG FOR B113 STAY #14'
      HOSPNM15 = 'ADDITIONAL HOSP STAY REPORT-STAY #15'
      SHOSTT15 = 'CONDITION WHICH S WAS HOSP-STAY #15'
      CONDMN15 = 'MONTH OF ADMISSION STAY #15'
      CONDDY15 = 'DAY OF ADMISSION STAY #15'
      CONDYR15 = 'YEAR OF ADMISSION STAY #15'
      B113DS15 = 'DISCREPANCY FLAG FOR B113 STAY #15'
      HCFSR01  = 'ONE STAY RECORD 92 NHEFS-ARTHRITIS'
      HCFSR02  = 'ONE STAY RECORD 92 NHEFS-GOUT'
      HCFSR03  = 'ONE STAY RECORD 92 NHEFS-HEART ATTACK'
      HCFSR04  = 'ONE STAY RECORD 92 NHEFS-HEART COND'
      HCFSR05  = 'ONE STAY 92 NHEFS-CORONARY BYPASS SURG'
      HCFSR06  = 'ONE STAY RECORD 92 NHEFS-PACEMAKER'
      HCFSR08  = 'ONE STAY RECORD 92 NHEFS-STROKE/CVA'
      HCFSR09  = 'ONE STAY RECORD 92 NHEFS-DIABETES'
      HCFSR10  = 'ONE STAY 92 NHEFS-HIGH BLOOD PRESSURE'
      HCFSR11  = 'ONE STAY RECORD 92 NHEFS-SKIN CANCER'
      HCFSR12  = 'ONE STAY RECORD 92 NHEFS-FRACTURED HIP'
      HCFSR13  = 'ONE STAY RECORD 92 NHEFS-OTHER FRAC'
      HCFSR15  = 'ONE STAY RECORD 92 NHEFS-SURGERY'
      HCFSR16  = 'ONE STAY RECORD 92 NHEFS-DO NOT KNOW'
      HCFSR17  = 'ONE STAY RECORD 92 NHEFS-NOT ASCERTAINED'
      HCFSR18  = 'ONE STAY 92 NHEFS-TESTS/OBSERVATION/EXAM'
      HCFSR19  = 'ONE STAY 92 NHEFS-DIGESTIVE/ENDOCRINE'
      HCFSR20  = 'ONE STAY 92 NHEFS-RESPIRATORY'
      HCFSR21  = 'ONE STAY RECORD 92 NHEFS-INFECTION'
      HCFSR22  = 'ONE STAY 92 NHEFS-KIDNEY/BLADDER/URINARY'
      HCFSR23  = 'ONE STAY RECORD 92 NHEFS-DEBILITY/PAIN'
      HCFSR24  = 'ONE STAY 92 NHEFS-MALE REPRODUCTIVE COND'
      HCFSR25  = 'ONE STAY 92 NHEFS-MUSCULOSKELETAL/INJURY'
      HCFSR26  = 'ONE STAY RECORD 92 NHEFS-CIRCULATORY'
      HCFSR27  = 'ONE STAY 92 NHEFS-FEMALE REPRODUCTIVE'
      HCFSR28  = 'ONE STAY RECORD 92 NHEFS-MENTAL ILLNESS'
      HCFSR29  = 'ONE STAY RECORD 92 NHEFS-NEUROLOGIC'
      HCFSR30  = 'ONE STAY 92 NHEFS-NUTRITION/DEHYDRATION'
      HCFSR31  = 'ONE STAY 92 NHEFS-BLEEDING/BLOOD DIS'
      HCFSR32  = 'ONE STAY RECORD 92 NHEFS-SKIN CONDITION'
      HCFSR33  = 'ONE STAY 92 NHEFS-CONDITION NOT CODED'
      HCFSR34  = 'ONE STAY 92 NHEFS-NURS HOME ADMISSION'
      HCFSR35  = 'ONE STAY 92 NHEFS-HOSPITALIZED AT DEATH'
      HCFSR36  = 'ONE STAY RECORD 92 NHEFS-EYE DISORDERS'
      HCFSR37  = 'ONE STAY RECORD 92 NHEFS-FALLS'
      CAUSEDTH = 'UNDERLYING CAUSE OF DEATH'
      STRATUM  = 'STRATUM'
      PSU      = 'PRIMARY SAMPLING UNIT'
      SUBSAMPL = 'NHANES I SUBSAMPLE'
      SWGT1    = 'DETAILED PERSONS--LOCATION 1-35'
      SWGT2    = 'ALL SAMPLE PERSONS--LOCATION 1-35'
      SWGT3    = 'DETAILED PERSONS--LOCATION 1-65'
      SWGT4    = 'ALL SAMPLE PERSONS--LOCATION 1-65'
      SWGT5    = 'DETAILED PERSONS--LOCATION 66-100'
      SWGT6    = 'DETAILED PERSONS--LOCATION 1-100'
      ;
run;


/*
Task 8. 
Interleave nhanes.nhefs1987 with nhanes.nhefs1992 to create a single new SAS 
data set called nhanes.nhefs1. View the descriptor portion of nhanes.nhefs1.
*/
proc sort data = nhanes.nhefs1987;
	by SEQNO;
run;

proc sort data = nhanes.nhefs1992;
	by SEQNO;
run;

data nhanes.nhefs1;
	set nhanes.nhefs1987 nhanes.nhefs1992;
	by SEQNO;
run;

proc contents data=nhanes.nhefs1 varnum;
run;


/*
Task 9. 
Create a list report for the first 10 observations in nhanes.nhefs1. Include 
only the variables that contain the following information:
•	Sample Sequence Number
•	Year of interview
•	Average number of hours a week the participant works
*/
proc print data = nhanes.nhefs1 (obs = 10);
	var seqno rsltyr hrswkjb1;
run;


/*
Task 10. 
Create a new data set called nhanes.nhefs2 from nhanes.nhefs1. Keep only the 
variables you viewed in the list report you created in Task 9. Recode 
inapplicable, refused, don’t know, and not ascertained to a missing value 
for all participants. 
*/
data nhanes.nhefs2;
	set nhanes.nhefs1;
	keep seqno rsltyr hrswkjb1;
	if hrswkjb1 in (-1, -7, -8, -9) then hrswkjb1 = .;
run;


/*
Task 11. 
Use the TRANSPOSE procedure to restructure nhanes.nhefs2 from long to wide. 
Create a calculated variable that contains the difference in the average 
number of hours per week worked in 1987 and the average number of hours 
worked per week in 1992 for each participant (ignore 1988 and 1993). 
*/
proc sort data = nhanes.nhefs2;
	by seqno rsltyr;
run;

proc transpose data = nhanes.nhefs2
	out = nhanes.nhefs3 (keep = seqno hrswkjb87 hrswkjb92)
	prefix = hrswkjb;
	by seqno;
	id rsltyr;
	var hrswkjb1;
run;

data nhanes.nhefs4;
	set nhanes.nhefs3;
	diffwk = hrswkjb92 - hrswkjb87;
run;

proc print data = nhanes.nhefs4 (obs = 20);
run;

proc means data = nhanes.nhefs4;
	var diffwk;
run;

