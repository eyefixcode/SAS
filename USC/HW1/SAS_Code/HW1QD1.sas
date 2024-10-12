* - Homework 1 Question D:
* - #1: Create a SAS dataset from 'ex0502_281.dat' named HW2 w/ EXPANDTABS Option enabled;

data HW2;
	infile 'Z:\HW1\ex0502_281.dat' expandtabs;
	input ID SBP QUET AGE SMK;
run;

* - Double check successful via print;
proc print data=HW2;
run;
