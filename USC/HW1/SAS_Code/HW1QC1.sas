* - Homework 1 Question C:
* - #1: Read 'heart.sas7bdat' and create 'HEART_Tmp';
libname mydata 'Z:\HW1\';
data HEART_Tmp;
	set mydata.heart;
run;
