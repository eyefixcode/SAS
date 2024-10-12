libname mydata 'Z:\';
* Homework 2 Question B 1
  1a. BMI;
proc reg data=WORK.Hw2_qa1;
	model SBP=BMI / clb;
	title "Question HW2_B1a: Regression SBP on BMI";
run;

* 1b. BMI - 21.8;
data WORK.Hw2_qb1b;
	set WORK.HW2_qa1;
	BMI218 = BMI-21.8;
run;
proc reg data=WORK.Hw2_qb1b;
	model SBP=BMI218 / clb;
	title "Question HW2_B1b: Regression SBP on BMI - 21.8";
run;

* 1c. BMI - BMI average;
proc means data=WORK.Hw2_qa1;
	var BMI;
	output out=out mean=BMIavg;
run;

data WORK.Hw2_qb1c;
	set Hw2_qa1;
	_Type_=0;
run;

data MEANdiff;
	merge Hw2_qb1c out;
	by _Type_;
	BMIdiff = BMI-BMIavg;
run;

proc reg data=WORK.MEANdiff;
	model SBP=BMIdiff / clb;
	title "Question HW2_B1c: Regression SBP on (BMI - Average BMI)";
run;



