* - Homework 1 Question D:
* - #7: Create 'HW2_A.sas7bdat' permanent SAS db from 'HW2_new';
libname mydata 'Z:\HW1';
data mydata.HW2_A;
	set HW2_new;
run;
