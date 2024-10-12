* Lab #3 Part 2 Question Number 6 ;
libname mydata 'Z:\Lab3';

proc reg data=mydata.subjdata;
	model MMEF=Height;
run;

proc means data=mydata.subjdata;
	var Height;
run;
