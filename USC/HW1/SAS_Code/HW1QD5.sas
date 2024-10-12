* - Homework 1 Question D:
* - #5: Calc nonsmokers # vs ever smokers and cross-tabulate smoking history by HIBMI;
proc freq data=HW2_NEW;
	tables SMK;
	tables SMK*HIBMI;
run;

