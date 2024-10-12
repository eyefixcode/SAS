* Quiz 1 Study Guide

text file: data.txt
John    25
Alice   30
Bob     22
;
* Read a text file;
DATA mydata;
    INFILE 'C:\path\to\data.txt'; /* Specify the path to your text file */
    INPUT Name $ 1-7 Age 8-9;    /* Column input method: Name from columns 1-7 and Age from columns 8-9 */
RUN;

PROC PRINT DATA=mydata;
RUN;

* Read SAS data set;
DATA new_data;
    SET old_data;    /* Read the SAS data set 'old_data' */
RUN;

PROC PRINT DATA=new_data;
RUN;

* How to use linbname;
LIBNAME mylib 'C:\myfolder';    /* Assign the libref 'mylib' to the directory 'C:\myfolder' */

/* Access a data set in the library */
DATA mylib.new_data;
    SET mylib.old_data;
RUN;

PROC PRINT DATA=mylib.new_data;
RUN;


* One-level and two-level SAS names;
/* One-level name */
DATA temp_data;
    SET old_data;
RUN;

/* Two-level name */
LIBNAME mylib 'C:\myfolder';
DATA mylib.perm_data;
    SET mylib.old_data;
RUN;


*Assign Vars;
DATA example;
    SET old_data;
    NewVar = 10;    /* Create a new variable 'NewVar' and assign it the value 10 */
RUN;

PROC PRINT DATA=example;
RUN;


* Create vars using if/then;
DATA example;
    SET old_data;
    IF Age >= 18 THEN Adult = 1;
    ELSE Adult = 0;    /* Create a new variable 'Adult' based on the value of 'Age' */
RUN;

PROC PRINT DATA=example;
RUN;


* SAS missing values;
DATA example;
    SET old_data;
    /* Handle missing values */
    IF Age = . THEN Age = 0;    /* Replace missing numeric values with 0 */
    IF Name = ' ' THEN Name = 'Unknown';    /* Replace missing character values with 'Unknown' */
RUN;

PROC PRINT DATA=example;
RUN;


* How to Use KEEP/DROP;
DATA subset;
    SET old_data;
    KEEP Name Age;    /* Keep only the variables 'Name' and 'Age' */
RUN;

PROC PRINT DATA=subset;
RUN;


DATA subset;
    SET old_data;
    DROP Salary;    /* Drop the variable 'Salary' */
RUN;

PROC PRINT DATA=subset;
RUN;


* Create SAS Data set by selecting observations;
DATA subset;
    SET old_data;
    IF Age > 20;    /* Keep only observations where 'Age' is greater than 20 */
RUN;

PROC PRINT DATA=subset;
RUN;

** PROC CONTENTS;
PROC CONTENTS DATA=old_data;
RUN;

** PROC FREQ;
PROC FREQ DATA=old_data;
    TABLES Gender;    /* Specify the variables to create frequency tables for */
RUN;

** PROC UNIVARIATE;
PROC UNIVARIATE DATA=old_data;
    VAR Age;    /* Specify the variables to analyze */
RUN;

** PROC SORT;
PROC SORT DATA=old_data;
    BY Age;    /* Sort the data set by 'Age' */
RUN;


* 1-sample T-test;
PROC TTEST DATA=old_data H0=50;    /* H0 is the known value to compare against */
    VAR Age;    /* The variable being tested */
RUN;


* 2-sample T-test;
PROC TTEST DATA=old_data;
    CLASS Group;    /* The variable that defines the two groups */
    VAR Age;    /* The variable being tested */
RUN;

* Paired T-test;
PROC TTEST DATA=old_data;
    PAIRED Before*After;    /* The paired variables */
RUN;

* Wilcoxon Signed Rank Test;
PROC UNIVARIATE DATA=old_data;
    VAR Difference;    /* The difference between the paired samples */
    SIGNRANK;    /* Specify the signed rank test */
RUN;


* Wilcoxon Rank Sum Test;
PROC NPAR1WAY DATA=old_data WILCOXON;
    CLASS Group;    /* The variable that defines the two groups */
    VAR Age;    /* The variable being tested */
RUN;


* Simple Linear Regression;
PROC REG DATA=old_data;
    MODEL Y = X;    /* Y is the dependent variable, X is the independent variable */
RUN;

* Pearson Correlation Coefficient;
PROC CORR DATA=old_data;
    VAR X Y;    /* The variables being tested */
RUN;

* Interpret output from PROC UNIVARIATE;
PROC UNIVARIATE DATA=old_data;
    VAR Age;    /* The variable being analyzed */
RUN;

* Creating Residuals and Predicted Values;
PROC REG DATA=old_data;
    MODEL Y = X;
    OUTPUT OUT=results P=predicted R=residual;
RUN;

PROC PRINT DATA=results;
RUN;


* Geometric Mean of Y (log(Y)=X);
DATA log_data;
    SET old_data;
    log_Y = LOG(Y);
RUN;

PROC MEANS DATA=log_data MEAN CLM;
    VAR log_Y;
RUN;

DATA geometric_mean;
    SET log_data;
    geom_mean = EXP(log_Y);
RUN;

PROC PRINT DATA=geometric_mean;
RUN;

* Pearson Correlation;
PROC CORR DATA=old_data;
	VAR X Y;
RUN;

* R^2 Calculation;
R² = (SSY - SSE) / SSY;

* Relationship between R and Beta;
R = (SSX / SSY) * ß;


* Evaluating Assumptions:

1-Sample t-test, 2-Sample t-test, Paired t-test
Normality: Check if the data is approximately normally distributed (PROC UNIVARIATE normality tests).
Random Sampling: Ensure the data comes from a random sample.

Linear Regression
Independence: Residuals should be independent.
Linearity: Relationship between independent and dependent variables should be linear.
Equal Variance (Homoscedasticity): Residuals should have constant variance at all levels of the independent variable.
Normality: Residuals should be approximately normally distributed.
;

* SAS Code for Checking Assumptions;
PROC REG DATA=old_data;
    MODEL Y = X;
    OUTPUT OUT=residuals P=predicted R=residual RSTUDENT=rstudent;
RUN;

PROC UNIVARIATE DATA=residuals;
    VAR




