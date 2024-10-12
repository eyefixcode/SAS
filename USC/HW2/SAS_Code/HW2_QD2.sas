* Homework 2 Question D2;
libname mydata 'Z:\';
* run correlation procedure TG vs Age;

* sort the data;
proc sort data=HW2_D1;
	by Sex;
run;

* run corr;
proc corr data=HW2_D1 outp=CORRtgage;
	by Sex;
	var tg;
	with age;
	title 'Correlation TG vs Age';
run;

* adjust dataframe to calc z-value;
data NEWdf;
	set CORRtgage;
	where _Type_ = 'CORR';
	zval = 0.5*log((1+tg)/(1-tg));
run;

* double check via print;
proc print data=NEWdf;
run;	

* Calculate test statistic;
data TestStatistic;
	zval=(0.35401-0.43215)/(sqrt(1/92+1/92));
	pval=2*probnorm(zval);
run;

proc print data=TestStatistic;
run;

