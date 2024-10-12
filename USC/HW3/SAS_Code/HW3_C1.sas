* - HW #3 Question C 1.;
libname mydata 'Z:/';

data HW3_C1;
	set mydata.subjdata_281;
run;
* - Get quartile data parameters for weight;
proc univariate data=HW3_C1;
	var weight;
run; * - 1/2/3 Quartiles were 66/76/88 respectively;

*redefine df with quartiles;
data HW3_C1;
	set HW3_C1;
	if weight ne . then do;
	if weight<66 then quartile ='1';
		else if 66<=weight<76 then quartile='2';
		else if 76<=weight<88 then quartile='3';
		else if weight >=88 then quartile='4';
	end;
run;
proc freq data=HW3_C1;
	tables weight*quartile / norow nocol nopercent missing;
run;

