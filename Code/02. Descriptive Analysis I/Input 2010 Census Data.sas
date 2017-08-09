/*
Input 2010 Census Data.
*/
data census;
	infile datalines dsd;
	input state : $13. state2 $ region $ pop pop65 medage;
	datalines;
	Alabama,AL,South,4779736,657792,37.9
	Alaska,AK,West,710231,54938,33.8
	Arizona,AZ,West,6392017,881831,35.9
	Arkansas,AR,South,2915918,419981,37.4
	California,CA,West,37253956,4246514,35.2
	Colorado,CO,West,5029196,549625,36.1
	Connecticut,CT,NE,3574097,506559,40.0
	Delaware,DE,South,897934,129277,38.8
	Florida,FL,South,18801310,3259602,40.7
	Georgia,GA,South,9687653,1032035,35.3
	Hawaii,HI,West,1360301,195138,38.6
	Idaho,ID,West,1567582,194668,34.6
	Illinois,IL,N Cntrl,12830632,1609213,36.6
	Indiana,IN,N Cntrl,6483802,6483802,37.0
	Iowa,IA,N Cntrl,3046355,452888,38.1
	Kansas,KS,N Cntrl,2853118,376116,36.0
	Kentucky,KY,South,4339367,578227,38.1
	Louisiana,LA,South,4533372,557857,35.8
	Maine,ME,NE,1328361,211080,42.7
	Maryland,MD,South,5773552,707642,38.0
	Massachusetts,MA,NE,6547629,902724,39.1
	Michigan,MI,N Cntrl,9883640,1361530,38.9
	Minnesota,MN,N Cntrl,5303925,683121,37.4
	Mississippi,MS,South,2967297,380407,36.0
	Missouri,MO,N Cntrl,5988927,838294,37.9
	Montana,MT,West,989415,146742,39.8
	Nebraska,NE,N Cntrl,1826341,246677,36.2
	Nevada,NV,West,2700551,324359,36.3
	New Hampshire,NH,NE,1316470,178268,41.1
	New Jersey,NJ,NE,8791894,1185993,39.0
	New Mexico,NM,West,2059179,272255,36.7
	New York,NY,NE,19378102,2617943,38.0
	N. Carolina,NC,South,9535483,1234079,37.4
	N. Dakota,ND,N Cntrl,672591,97477,37.0
	Ohio,OH,N Cntrl,11536504,1622015,38.8
	Oklahoma,OK,South,3751351,506714,36.2
	Oregon,OR,West,3831074,533533,38.4
	Pennsylvania,PA,NE,12702379,1959307,40.1
	Rhode Island,RI,NE,1052567,151881,39.4
	S. Carolina,SC,South,4625364,631874,37.9
	S. Dakota,SD,N Cntrl,814180,116581,36.9
	Tennessee,TN,South,6346105,853462,38.0
	Texas,TX,South,25145561,2601886,33.6
	Utah,UT,West,2763885,249462,29.2
	Vermont,VT,NE,625741,91078,41.5
	Virginia,VA,South,8001024,976937,37.5
	Washington,WA,West,6724540,827677,37.3
	W. Virginia,WV,South,1852994,297404,41.3
	Wisconsin,WI,N Cntrl,5686986,777314,38.5
	Wyoming,WY,West,563626,70090,36.8
	;	
run;
