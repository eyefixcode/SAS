* - Homework 1 Question F Question 3 - Find difference in mean SBP Smokers vs NonSmokers - NonParametric, Wilcoxon rank-sum test should be used;
libname mydata 'Z:\HW1';
proc npar1way data=mydata.HW2_A wilcoxon;
	class SMK;
	var SBP;
	format SMK SMK_binary.;
run;
