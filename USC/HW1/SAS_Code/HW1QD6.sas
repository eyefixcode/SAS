* - Homework 1 Question D:
* - #6: Find Min/Max BMI val within each level of HIBMI;
proc means data=HW2_NEW min max;
	class HIBMI;
	output out=MinMax min(BMI)=Min_BMI max(BMI)=Max_BMI;
run;

* - Print to check results;
proc print data=MinMax;
run;
