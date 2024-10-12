* - Homework 1 Question C:
* - #3: Save to permanent db under 'HEART_perm';
libname mydata 'Z:\HW1';
data mydata.HEART_perm;
	set Heart_Tmp;
run;
* - print to double check successful retrieval from perm db;
proc print data=mydata.HEART_perm;
run;
