* Lab #3 Part 2 Question Number 3 ;
libname mydata 'Z:\Lab3';

proc sgplot data=mydata.subjdata;
	scatter y=mmef x=height;
	reg y=mmef x=height;
run;
