* Lab #3 Part 1 Question Number 2;
data L3_2;
	set L3_1;
	Height = (HtFeet*12)+HtInches;
run;

proc print data=L3_2;
run;
