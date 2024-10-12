* Lab #3 Part 2 Question Number 5 ;
libname mydata 'Z:\Lab3';

proc corr data=mydata.subjdata;
	var MMEF;
	with height htinches;
run;
