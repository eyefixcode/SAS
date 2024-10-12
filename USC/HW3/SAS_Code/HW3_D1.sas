* - HW #3 Question D 1.;
libname mydata 'Z:/';
data pval;
	y=1-probf(21.074,3,19);
run;
proc print data=pval;
run;
