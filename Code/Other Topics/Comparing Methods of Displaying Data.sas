/******************************************************************************
Comparing different procedures to display data (list reports) in SAS
******************************************************************************/

* Generate the data;
data test_data;


* You can always open a view table window from within the explorer window;

* proc print;
proc print data = ostar.sales_mgmt;
	var employee_id job_title salary;
	where salary > 95000;
run;

*proc report;
proc report data = ostar.sales_mgmt;
	column employee_id job_title salary;
	where salary > 95000;
run; 
	*No OBS column by default;
	*Uses variable labels by default;
	*Can create a new data set;

*proc sql;
proc sql;
	select employee_id, job_title, salary
	from ostar.sales_mgmt
	where salary > 95000;
quit;
	*No OBS column by default;
	*Uses variable labels by default;
	*Can create a new data set;
	*Can use multiple data sets in a single step;

* proc tabulate?;
* proc summary?;
