* Homework 2 Question C1;
libname mydata 'Z:\';

* Create boxplots;
proc sgplot data=WORK.Hw2_qa1;
    vbox SBP / category=SMK;
	title 'SBP vs SMK Boxplots';
run;
*Create Scatterplot w/reg;
proc sgplot data=WORK.Hw2_qa1;
	scatter y=SBP x=SMK;
	reg y=SBP x=SMK;
	title 'SBP vs SMK Scatterplots with Regression';
run;
