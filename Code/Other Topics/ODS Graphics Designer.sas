* Testing ODS Graphics Designer;

libname dos "C:\Users\mbc0022\Dropbox\Datasets\Day one survey\5147";

options fmtsearch = (dos);

* Now use ODS Graphics Designer to make a boxplot of age by gender;
* Tools -> ODS Graphics Designer;

* Here is the code it generated;
proc template;
define statgraph sgdesign;
dynamic _AGE _GENDER;
begingraph;
   entrytitle halign=center 'Type in your title...';
   entryfootnote halign=left 'Type in your footnote...';
   layout lattice / rowdatarange=data columndatarange=data rowgutter=10 columngutter=10;
      layout overlay / xaxisopts=( type=discrete discreteopts=( tickvaluefitpolicy=splitrotate tickvaluerotation=vertical));
         boxplot x=_GENDER y=_AGE / name='box' boxwidth=0.4 groupdisplay=Cluster;
      endlayout;
   endlayout;
endgraph;
end;
run;

proc sgrender data=DOS.CLASSURV15 template=sgdesign;
dynamic _AGE="AGE" _GENDER="GENDER";
run;

