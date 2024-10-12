* Homework #2 Question A2;
* Test Linear Assumptions; 
libname mydata 'Z:\';
proc reg data=WORK.Hw2_qa1;
    model SBP = BMI/clb;
    output out=Out r=Residuals p=Predictions;
run;

*Plot Loess;
proc sgplot data=Out;
    scatter x=BMI y=Residuals;
    loess x=BMI y=Residuals/clm;
	refline 0 / axis=y lineattrs=(color=red);
run;

*Assess Distribution shape;
proc univariate plot normal data=Out;
	var Residuals;
run;

