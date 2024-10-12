* - HW #3 Question A 1.;
libname mydata 'Z:/';

data nmes_281;
	set mydata.nmes_281;
	logx=log(exp);
	if age ne . then do;
		if age > 65 then linspl = age-65;
		else linspl = 0;
	end;
run;

* Run linear spline reg;
proc reg data=nmes_281;
	model logx=age linspl / clb;
run;


