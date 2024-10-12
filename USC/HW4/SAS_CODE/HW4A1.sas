libname mydata "Z:";
data HW4a;
	set mydata.chol_281;
run;
proc means data=HW4a;
	var AGE LOGCHOL;
	title 'Analysis of Confounding in Multiple Linear Regression Using Louisiana Cholesterol Dataset';
run;
