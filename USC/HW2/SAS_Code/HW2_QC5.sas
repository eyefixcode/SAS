* Homework 2 Question C5;
libname mydata 'Z:\';
* Calculate t-test to compare to C3;
proc ttest data=WORK.Hw2_qa1;
	class SMK;
	var SBP;
	title 'T-Test for Systolic Blood Pressure by Smoking Status';
run;
