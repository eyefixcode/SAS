* HW 5 
Question B1;
libname mydata 'Z:\';
data chol;
	title 'Chol dataset';
	set mydata.chol_281;
	age2=age**2; * create var for age squared;
	label age='Age (years)';
	label tg='Triglycerides';
run;
proc reg data=chol;
	title 'Regression log(HDL) on Age, Age^2, and Female';
	model loghdl= age age2 female/tol vif;
run;
data f_test;
    /* Define sums of squares and degrees of freedom */
    SS_1 = 9.94015;       
    SS_2 = 10.6851;      
    DF_1 = 186;       
    DF_2 = 189;       
    /* Compute the F-statistic */
    F_value = ((SS_2 - SS_1) / (DF_2 - DF_1)) / (SS_1 / DF_1);
    /* Degrees of freedom for numerator and denominator */
    DF_num = DF_2 - DF_1;
    DF_den = DF_1;
    /* Compute p-value */
    p_value = 1 - probf(F_value, DF_num, DF_den);
run;
proc print data=f_test;
	title 'Compute F-Test';
run;
* Continue check x-var for collinearity issues;
proc corr data=chol;
	title 'Correlation age vs age^2';
	var age age2;
run;
*Question B2 - Center age on mean;
proc means data=chol;
	var age;
run;
* create centage and centage2;
data chol;
	set chol;
	centage = age - 28.6465517;
	centage2 = centage**2;
run;
* refit model with new centered vars;
proc reg data=chol;
	title 'Regression log(HDL) on Age(centered), Age^2(centered), and Female';
	model loghdl=centage centage2 female/tol vif;
run;
*Question B3 - Double check corr again on new centered model;
proc corr data=chol;
	title 'Correlation age(centered) vs age^2(centered)';
	var centage centage2;
run;
*Question B4 check jackknife, leverage, cooks D, dfbeta(largest cooks D only);
proc reg data=chol;
	title 'Regression log(HDL) on Age(centered), Age^2(centered), and Female (W/ JackKnife, leverage, Cooks D, DFBETA';
	model loghdl=centage centage2 female/r influence;
	output out=QB4 rstudent=jackknife h=lev cookd=cooks;
run;
*clean data missing vals;
data QB4_clean;
	set QB4;
	if cmiss(loghdl, centage, female) then do;
		jackknife= .;
		lev= .;
		cooks= .;
	end;
run;
proc univariate data=QB4_clean;
	title 'Jackknife Residual';
	var jackknife;
	id jackknife;
run;
proc univariate data=QB4_clean;
	title 'Leverage';
	var lev;
	id lev;
run;
proc univariate data=QB4_clean;
	title 'Cooks Distance';
	var cooks;
	id cooks;
run;
* Question B5 - compute t-test;
data ttest;
   	t = -3.00593; /* t-statistic value for observation 53's jackknife residual */
    total_obs = 190;   /* Total number of observations (non-missing) */
    num_parameters = 5;
    df = total_obs - num_parameters; /* Degrees of freedom */
    /* Calculate p-value for the two-tailed test */
    abs_t = abs(t); /* Absolute value of t-statistic */
    p_val = (1-probt(abs_t,df))*2; /* Two-tailed p-value */
    /* Adjust alpha level for multiple comparisons using Bonferroni correction */
    bonferroni_alpha = 0.05 / total_obs; 
run;
proc print data=ttest;
    title 'Calculation for T-Test and Adjusted Alpha';
run;
proc print data=mydata.chol_281;
run;
