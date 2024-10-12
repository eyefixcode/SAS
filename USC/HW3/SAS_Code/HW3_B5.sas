* - HW #3 Question B 5.;
*Estimate the geometric mean of Tg for females with BMI=21, height=61, and age=27. (Use SAS as a calculator);
libname mydata 'Z:/';

data HW3_B5;
	y = exp(4.152+0.050*1+0.026*21+0.010*27-0.011*61);
	title 'Geometric mean of Tg for Females with BMI=21, height=61, and age=27';
run;
proc print data=HW3_B5;
run;
