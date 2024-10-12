* Lab #3 Part 2 Question Number 4 ;
libname mydata 'Z:\Lab3';

proc sgplot data=mydata.subjdata;
	scatter y=mmef x=htinches;
	reg y=mmef x=htinches;
run;
