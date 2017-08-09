/******************************************************************************
Module 13: Advanced Programing Topics

PROC SQL:
Note that it is convention to type SQL keywords in all caps.
Note that database programmers who use SQL typically refer to data sets as 
TABLES, variables as COLUMNS, observations as ROWS or RECORDS, and cells as 
FIELDS. Because we are using SQL here, I try to use the database terminology 
(rather than traditional SAS terminology).

This code is posted for your benefit; however, I highly recommend that you 
practice typing your own SAS programs as well. With the SAS programming 
language, as with all new languages, immersion seems to be the best way to 
learn.
******************************************************************************/

/*
Task 1. Import the 2012 BRFSS data for Washington, D.C. 
May need to update the semester in the file path.
*/
proc import out = brfss
	datafile = "/home/brad.cannell/5161/BRFSS_DC.xlsx"
	dbms = xlsx replace;
run;

/*
SQL statements / clauses are used to "query" the database / table.
Probably the most basic SQL clause is the SELECT clause.
SELECT can be used to query / subset one or more columns from a table.
*/

* Select clause (one column);
proc sql;
	SELECT age 
		FROM brfss;
quit;

* Select clause (multiple columns);
proc sql;
	SELECT age, sex 
		FROM brfss;
quit;

* Select clause (all columns);
proc sql;
	SELECT * 
		FROM brfss;
quit;

* Multiple SELECT clauses;
proc sql;
	SELECT age 
		FROM brfss;
	SELECT sex 
		FROM brfss;
quit;

/*
The keyword OUTOBS can be used to restrict the number of queried rows
retrieved.
In other implementations of SQL this is accomplished with the keyword LIMIT.
*/
proc sql outobs = 5;
	SELECT sex
		FROM brfss;
quit;

/* 
The keyword DISTINCT can be used with SELECT in order to remove duplicate 
rows from the query. Said another way, DISTINCT can be used to query
unique values for a column.
*/
proc sql;
	SELECT DISTINCT sex 
		FROM brfss;
quit;

* DISTINCT can also be used to query unique combinations of columns;
proc sql;
	SELECT DISTINCT sex, genhlth
		FROM brfss;
quit;

/*
The ORDER BY clause can be used with a SELECT clause to sort the results
returned by the query.
*/
proc sql outobs = 20;
	SELECT age, sex, genhlth
		FROM brfss
		ORDER BY age; /* May be sorted on a column that is not actually queried */
quit;

/*
The WHERE clause is used to subset rows.
*/


* Another example using the between operator;
proc sql outobs = 20;
	SELECT age, sex, genhlth
		FROM brfss
		WHERE age between 18 and 30; /* Inclusive */
quit;


* Another example using NOT IN operator to exclude unwanted rows;
proc sql outobs = 20;
	SELECT age, sex, genhlth
		FROM brfss
		WHERE genhlth not in (1, 2);
quit;

/*
The CAT family of functions can be used to concatentate two or more character
values as a single character value.
Note: in other implementations of SQL this is accomplished with the CONCAT 
function.
You may also notice that this is the first time we create new columns using
SQL. Instead of using the "new_var =" sytax of a SAS DATA step, we use the 
keyword AS followed by the name we want to give to the new column.
*/
data character;
	input first $ last $;
	datalines;
	Brad Cannell
	John Smith
	Jane Doe
	;
run;

proc sql;
	SELECT 	cat(first, last) AS name1, 
			catx(", ", last, first) AS name2, /*Strips spaces and first argument becomes delimiter */
			cats(first, last) AS name3, /* Strips all spaces */
			catt(first, last) AS name4 /* Strips trailing spaces */
		FROM character;
quit;

/*
Subquery:
Here we are using a subquery to subset rows that include a value for age
that is greater than or equal to the average value of age.
Notice that the subquery uses parentheses and does not have its own semicolon.
However, it does use a second SELECT clause.
*/
proc sql outobs = 20;
	SELECT age, sex, genhlth
		FROM brfss
		WHERE age >= (SELECT avg(age) FROM brfss);
quit;

/*
On of SQL's greatest strengths is its ability to easily return data from
multiple tables. It does so by linking rows in one table with rows in one or 
more other tables that contain information about the same entity. This concept
is known as "joining" tables, or performing a "join". Joins are essentially 
conceptually identical to merging data sets in a DATA step. And come in three
types: Inner (return only rows that have a match in both tables), Left (return
all rows in the left table regardless of whether or not they have a match in
the right table), and Right (Same as left join, but reversed).

To demonstrate, we're going to quickly create a few tables to practice with.
Then we will join them using PROC SQL. Then we will use an INNER JOIN to return
a query that shows the demographics AND grip strength data for each participant.

Notice the use of the "fully qualified name" (table.varible).
*/
data Demographics;
	input ID Gender $ Site $;
	datalines;
	1001 F CHI
	1002 F DEN
	1003 M FW
	1004 M SDG
run;

data Grip_Strength;
	input ID Grip_R Grip_L;
	datalines;
	1001 32 30
	1002 28 30
	1003 32 28
	1004 22 22
run;

proc sql;
	SELECT *
		FROM demographics, grip_strength		 /* The tables we want to join */
		WHERE demographics.id = grip_strength.id /* The columns that identify matching rows between tables */
		ORDER BY demographics.id;
quit;

/*
Nicknames:
We can give our tables nicknames, and consequently reduce typeing and our
liklihood of typing errors, using the keyword AS in the FROM clause.
Additionally, you may have noticed that our last query was returned with 
two ID columns. That's because we used an asterisk (*) in the SELECT clause.
The asterisk in the SELECT clause returns ALL columns, not just all UNIQUE
columns. Therefore, in the SQL statement below we specifically tell SAS
which columns we want the query to return.
*/
proc sql;
	SELECT d.id, gender, grip_r, grip_l
		FROM demographics AS d, grip_strength AS gs
		WHERE d.id = gs.id
		ORDER BY d.id;
quit;

/*
Left Join Example
Now let's look at a LEFT JOIN. Notice that now the demographics table includes
two participants (1005 and 1006) that do not exist in the grip strength table.
Below, we first join these tables using an INNER join and then join them using
a LEFT join for comparison.
Notice that the INNER join only returns 4 rows. 
The LEFT join uses the LEFT JOIN keywords in the FROM clause and an ON clause 
instead of a WHERE clause. The LEFT join also returns 6 rows, instead of 4.
*/
data Demographics;
	input ID Gender $ Site $;
	datalines;
	1001 F CHI
	1002 F DEN
	1003 M FW
	1004 M SDG
	1005 F CHI
	1006 M FW
run;

data Grip_Strength;
	input ID Grip_R Grip_L;
	datalines;
	1001 32 30
	1002 28 30
	1003 32 28
	1004 22 22
run;

* INNER join;
proc sql;
	SELECT d.id, gender, grip_r, grip_l
		FROM demographics AS d, grip_strength AS gs
		WHERE d.id = gs.id
		ORDER BY d.id;
quit;

* LEFT join;
proc sql;
	SELECT d.id, gender, grip_r, grip_l
		FROM demographics AS d left join grip_strength AS gs
		on d.id = gs.id
		ORDER BY d.id;
quit;

/*
Joining tables with differing numbers of rows per table (one-to-many
merge).
In the demographics table we are creating below, there is exactly one row 
for each participant, but in the grip strength data there are two rows per 
participant. If we want to join these tables in a query, will we perform an 
INNER, LEFT, or RIGHT join?
It will still be an inner join because we want to return all rows that have AT
LEAST ONE match (on id) in the other table. The fact that there are multiple
matches is fine.
Notice that in this example we order by id in ascending order, then within id
we order by visit in descending order.
*/
data Demographics;
	input ID Gender $ Site $;
	datalines;
	1001 F CHI
	1002 F DEN
	1003 M FW
	1004 M SDG
run;

data Grip_Strength;
	input ID Visit $ Grip_R Grip_L;
	datalines;
	1001 Pre 32 30
	1001 Post 33 32
	1002 Pre 28 30
	1002 Post 27 30
	1003 Pre 32 28
	1003 Post 34 30
	1004 Pre 22 22
	1004 Post 27 26
run;

proc sql;
	SELECT d.id, gender, visit, site, grip_r, grip_l
		FROM demographics AS d, grip_strength AS gs
		WHERE d.id = gs.id
		ORDER BY d.id ASC, visit DESC;
quit;

/*
Unions
Performing a UNION using SQL is conceptually similar to performing an APPEND
in a SAS DATA STEP. We are adding rows. A union can keep duplicate rows (UNION
ALL) or remove duplicate rows (UNION).
*/
data last_year;
	input id first $ last $ score;
	datalines;
	1001 Brad Cannell 95
	1002 Jon Hartman 99 
	1003 Anne Johnson 85
	;
run;

data this_year;
	input id first $ last $ score;
	datalines;
	1001 Brad Cannell 95
	1002 Jon Hartman 90
	1003 Anne Williams 85
	;
run;

* UNION (remove duplicates);
proc sql;
	SELECT id, first, last, score
		FROM last_year
	UNION
	SELECT id, first, last, score
		FROM this_year;
quit;

* UNION (include duplicates);
proc sql;
	SELECT id, first, last, score
		FROM last_year
	UNION ALL
	SELECT id, first, last, score
		FROM this_year;
quit;

/*
Notice that in both cases, the tables being appended included the exact same
columns. What happens when this isn't the case? Below we explore what happens
in several different scenarios:
1. Tables have different columns.
2. Tables have different columns, but the SELECT clause only contains columns
that they have in common.
3. Columns have the same name, but different data types.
4. Columns have different names, but same data type.
*/

* Tables have differnt columns - ERROR;
data last_year;
	input id first $ last $ score;
	datalines;
	1001 Brad Cannell 95
	;
run;
data this_year;
	input id first $ last $ fav_col $;
	datalines;
	1001 Brad Cannell blue
	;
run;
proc sql;
	SELECT id, first, last, score
		FROM last_year
	UNION
	SELECT id, first, last, fav_col
		FROM this_year;
run;

* Tables have differnt columns, but SELECT clause same - NO ERROR;
data last_year;
	input id first $ last $ score;
	datalines;
	1001 Brad Cannell 95
	;
run;
data this_year;
	input id first $ last $ fav_col $;
	datalines;
	1001 Brad Cannell blue
	;
run;
proc sql;
	SELECT id, first, last
		FROM last_year
	UNION
	SELECT id, first, last
		FROM this_year;
run;

* Columns have the same name, but different data types - ERROR;
data last_year;
	input id first $ last $ score;
	datalines;
	1001 Brad Cannell 95
	;
run;
data this_year;
	input id first $ last $ score $;
	datalines;
	1001 Brad Cannell A
	;
run;
proc sql;
	SELECT id, first, last, score
		FROM last_year
	UNION
	SELECT id, first, last, score
		FROM this_year;
run;

* Columns have different names, but same data type - NO ERROR (keeps first column name);
data last_year;
	input id first $ last $ score;
	datalines;
	1001 Brad Cannell 95
	;
run;
data this_year;
	input id first $ last $ grade;
	datalines;
	1001 Brad Cannell 96
	;
run;
proc sql;
	SELECT id, first, last, score
		FROM last_year
	UNION
	SELECT id, first, last, grade
		FROM this_year;
run;

/*
INSERT INTO
We can also append new rows to our tables using the INSERT INTO clause. 
Notice that character strings must be wrapped in quotation marks.
*/
data last_year;
	input id first $ last $ score;
	datalines;
	1001 Brad Cannell 95
	;
run;

proc sql;
	INSERT INTO last_year
	VALUES (1001, 'Brad', 'Cannell', 96);
quit;

/*
Update
We can change the values for certain fields in our tables using an UPDATE 
clause.
*/
data grades;
	input id first $ last $ score;
	datalines;
	1001 Brad Cannell 95
	1002 Anne Smith	100
	;
run;

proc sql;
	UPDATE grades
	SET score = 88
	WHERE id = 1001;
quit;

/*
Delete
The DELETE clause functions similarly to the UPDATE clause, except that it 
removes data from your table.
*/
data grades;
	input id first $ last $ score;
	datalines;
	1001 Brad Cannell 95
	1002 Anne Smith	100
	;
run;

proc sql;
	DELETE FROM grades
	WHERE id = 1001;
quit;


/*
Creating tables
When creating a tables we start with the CREATE TABLE clause.
Then inside parentheses we give the variable name, type, and width (optional).
Finally, add the data values using INSERT INTO.
*/
proc sql;
	CREATE TABLE grades
	(
		id num,
		first char(4),
		last char(7),
		score num
	);
	
	INSERT INTO grades
		VALUES(1001, 'Brad', 'Cannell', 95)
		VALUES(1002, 'Anne', 'Smith', 100);
quit;

/*
We can also create new tables that result from querying an existing table
*/
proc sql;
	CREATE TABLE brad_grade AS
	SELECT *
		FROM grades
		WHERE first = "Brad";
quit;

/*
We can add columns using the ALTER TABLE statement.
*/
proc sql;
	ALTER TABLE grades ADD score2 NUM;
quit;

/*
Similarly we can drop columns using the ALTER TABLE statement.
*/
proc sql;
	ALTER TABLE grades DROP score2;
quit;




* Line 181: How do I change the name of the BY column in the returned query? RENAME = in create table or select;
* Go back and capitalize all SQL keywords.;









