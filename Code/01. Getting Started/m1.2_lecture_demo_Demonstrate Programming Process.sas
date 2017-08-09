data work.newemps;
   length First_Name $ 12
Last_Name $ 18 Job_Title $ 25;
infile '\\hscms8\SAS_Class\mbc0022\ntrhd\newemps.csv' dsd firstobs = 2; input First_Name $ Last_Name $
      Job_Title $ Salary;
run;

title 'New Employees';

porc  print data=work.newemps;
run;

proc means data=work.newemps;
   class job_title;
   var salary;
run;

title;
