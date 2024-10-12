* - Homework 1 Question F Question 3 - Find difference in mean SBP Smokers vs NonSmokers - Normality Assumed, T-Test should be used;
libname mydata 'Z:\HW1';
proc ttest data=mydata.HW2_A;
	class SMK;
	var SBP;
	format SMK SMK_binary.;
run;
