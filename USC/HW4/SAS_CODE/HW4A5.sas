libname mydata "Z:";
data HW4a;
	set mydata.chol_281;
	AGE10=AGE/10;
run;
proc reg data=HW4a;
	model LOGCHOL=AGE10 WT HT/clb;
	title'Linear Regression of Log(Chol) on AGE10 with Weight and Height Adjustments';
run;
