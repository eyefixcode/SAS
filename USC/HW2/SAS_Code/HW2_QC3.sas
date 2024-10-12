* Homework 2 Question C;
libname mydata 'Z:\';
* Determine means SBP for nonSMK vs SMK;
* sort data;
proc sort data=WORK.Hw2_qa1;
	by SMK;
run;

* get means;
proc means data=WORK.Hw2_qa1;
	var SBP;
	by SMK;
	title 'Mean Systolic Blood Pressure (sorted by Smoking Status)';
run;

* regress;
proc reg data=WORK.Hw2_qa1;
	model SBP=SMK;
	title 'Regression of Systolic Blood Pressure on Smoking Status Groups';
run;
