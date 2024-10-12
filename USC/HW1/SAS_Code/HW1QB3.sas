* - Homework 1 Question B:
* - #3: Create permanent copy of CHS dataset and name 'CHS';
libname mydata 'Z:\HW1\';
data mydata.chs;
	set chs;
run;
