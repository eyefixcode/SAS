libname mydata "Z:\Lab2";

data subjdata;
  set mydata.subjdata;
run;

/* Question 7 */

proc sgplot data=mydata.subjdata;
	vbar asthma/response=fvc stat=mean;
	vbar asthma/response=fev stat=mean transparency=0.1 barwidth=0.5;
	title 'Bar charts of Mean FEV and FVC by Asthma Status';
run;
