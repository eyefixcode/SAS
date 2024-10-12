* - Homework 1 Question B:
* - #2: Format dates to show 'MM/DD/YY';
data chs;
	infile 'Z:\HW1\chs_281.dat';
	input ID $ 1-3 SEX 5 RACE 8 CITY $ 11-23 @25 BIRTHDAT mmddyy8.@35 TESTDAT mmddyy8. HEIGHT 45-47 WEIGHT 48-50 CARPET GASSTOVE SMOKE ASTHMA;
	format BIRTHDAT TESTDAT mmddyy8.;
run;
proc print data=chs;
run;

