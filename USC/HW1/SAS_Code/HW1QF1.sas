* - Homework 1 Question F Question 1
Query 'HW2_A.sas7bdat' and find if mean SBP statistically significantly different = T-test to compare means;
libname mydata 'Z:\HW1';
proc ttest data=mydata.HW2_A h0=120;
	var SBP;
run;
