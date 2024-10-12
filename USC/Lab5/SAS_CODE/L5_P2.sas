* Lab #5 Part 2;
*Define dir;
libname mydata 'Z:/';

options nofmterr; /* Use this if formats are not available */

* get dataframe;
data L5_P2;
	set mydata.subjdata;
run;

* run correlation procedure;
proc corr data=L5_P2;
	var mmef height weight bmi age;
run;


* Simple Linear regressions;
*Reg MMEF on Height;
proc reg data=L5_P2;
	model mmef=Height;
run;
*Reg MMEF on Weight;
proc reg data=L5_P2;
	model mmef=Weight;
run;
*Reg MMEF on BMI;
proc reg data=L5_P2;
	model mmef=BMI;
run;
*Reg MMEF on Age;
proc reg data=L5_P2;
	model mmef=Age;
run;



*MLR;
proc reg data=L5_P2;
	model mmef = height weight bmi age;
	title 'Multiple Linear Regression Model for MMEF on height, weight, bmi, and age';
run;


proc reg data=L5_P2;
	model mmef= weight age sex;
	title 'Multiple Linear Regression Model for MMEF on weight, age, and sex';
run;

