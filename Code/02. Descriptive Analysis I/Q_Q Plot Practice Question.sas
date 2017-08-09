/*Problem 2.2 from Regression methods in biostatistics:
Generate pseudo-random data from it normal distribution 
using a computer program or statistics package. In Stata 
this can be done using the generate command and the function 
invnorm(uniform()). Now generate a normal Q-Q plot for these data. 
Do this for several samples of size 10, 50, and 200. How well do 
the Q-Q plots approximate straight lines? This is valuable practice 
for judging how well an actual data set can be expected to approximate 
a straight line.*/

/*Eric Vittinghoff;David Glidden;Steve Shiboski;Charles E. McCulloch. 
Regression Methods in Biostatistics: Linear, Logistic, Survival, 
and Repeated Measures Models (Kindle Locations 412-414). Kindle Edition.*/ 

DATA a;
  DO i=1 to 10;
    weight = 150 + normal(-1);
    OUTPUT;
  END;
RUN;
 
PROC univariate DATA=a plot;
  var weight;
RUN;


DATA b;
  DO i=1 to 50;
    weight = 150 + normal(-1);
    OUTPUT;
  END;
RUN;
 
PROC univariate DATA=b plot;
  var weight;
RUN;

DATA c;
  DO i=1 to 200;
    weight = 150 + normal(-1);
    OUTPUT;
  END;
RUN;
 
PROC univariate DATA=c plot;
  var weight;
RUN;
