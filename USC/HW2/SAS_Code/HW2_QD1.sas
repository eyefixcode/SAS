* Homework 2 Question D1;
libname mydata 'Z:\';
* create scatter of Triglycerides (TG) vs AGE;

*seperate genders;
proc format;
	value SEXformatted 1=m 2=f;
run;

* Create our dataframe;
data HW2_D1;
	set mydata.chol_281;
	label TG="Triglycerides";
	format sex SEXformatted.;
run;

* Double check with print;
proc print data=HW2_D1;
run;

* Create scatter;
proc sgplot data=HW2_D1;
	scatter y=tg x=age/group=sex;
	reg y=tg x=age/group=sex;
	xaxis max=70;
	title 'Scatterplot of Triglycerides (TG) vs Age by Sex(M/F)';
run;
