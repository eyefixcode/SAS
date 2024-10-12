* - Homework 1 Question F Question 2 ;
libname mydata 'Z:\HW1';
proc sgplot data=mydata.HW2_A;
	vbox SBP / category=SMK;
	xaxis label='Smoking Status';
	yaxis label='Systolic Blood Pressure(SBP)';
	format SMK SMK_binary.;
run;
