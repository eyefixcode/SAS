libname mydata "Z:";
data HW4b;
	set mydata.chol_281;
	AGE10=AGE/10;
run;
/* Sorting Data */
proc sort data=HW4b;
    by FEMALE;
run;

/* Regression Analysis */
proc reg data=HW4b outest=estimates;
    model LOGCHOL = AGE / clb;
    by FEMALE;
    output out=varout r=residuals p=predictions;
run;

/* Residual Analysis */
proc univariate data=varout normal plot;
    var residuals;
    by FEMALE;
run;

/* Plot of Residuals */
proc sgplot data=varout;
    scatter x=predictions y=residuals / group=FEMALE;
    refline 0 / axis=y lineattrs=(color=black pattern=dash);
    title 'Residual Plot by Sex';
run;

/* Summary of Model Estimates */
proc print data=estimates;
    title 'Summary of Model Estimates by Sex';
run;
