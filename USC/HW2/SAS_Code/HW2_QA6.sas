libname mydata 'Z:\';

proc corr data=WORK.Hw2_qa1;
	var SBP;
	with BMI;
run;
proc reg data=WORK.Hw2_qa1;
	model SBP=BMI;
run;
