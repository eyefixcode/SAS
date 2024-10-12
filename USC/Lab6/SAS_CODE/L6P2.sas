libname mydata 'Z:';
/* Suppress missing format errors */
options nofmterr;

/* Part 2 */
/* 1. Frequency distribution of race */
proc freq data=mydata.subjdata;
    tables race;
run;

/* 2. Create a subset dataset including only Hispanic and Non-Hispanic White subjects */
data subrace; 
    set mydata.subjdata;
    where race in (3, 4); /* 3=Hispanic, 4=Non-Hispanic White */
run;

/* Regression of FEV on Age for SUBRACE */
proc reg data=subrace;
    model fev = age;
    title 'Regression of FEV on Age for Hispanic and Non-Hispanic White Subjects';
run;

/* 3. */
proc sort data=subrace;
	by race;
run;
proc reg data=subrace;
	by race;
	model fev=age;
	title 'Regression FEV on Age by Ethnicity';
run;

/* 4. */
/* Step 1: Calculate means and variances by group1 */
proc means data=mydata.subjdata n mean var;
    by group1;
    var var1 outcome1;
    where outcome1 ne .; /* Ensure outcome1 is not missing */
run;
/* Step 2: Perform calculations for the t-test */
data prob4;
    /* Input the known values */
    n_group1 = 94; /* Sample size for group1 (e.g., subset1) */
    n_group2 = 174; /* Sample size for group2 (e.g., subset2) */
    mse_group1 = 107805; /* Mean Squared Error for group1 */
    mse_group2 = 79914; /* Mean Squared Error for group2 */
    var1_group1 = 0.1496; /* Variance of var1 for group1 */
    var1_group2 = 0.1458; /* Variance of var1 for group2 */
    beta_group1 = 38.3; /* Slope for group1 */
    beta_group2 = 239.2; /* Slope for group2 */
    /* Calculate pooled MSE */
    mse_pooled = ((n_group1 - 2) * mse_group1 + (n_group2 - 2) * mse_group2) / (n_group1 + n_group2 - 4);
    /* Calculate standard error of the difference in slopes */
    s_diff = mse_pooled * (1 / ((n_group1 - 1) * var1_group1) + 1 / ((n_group2 - 1) * var1_group2));
    /* Compute the t-statistic */
    t = (beta_group1 - beta_group2) / sqrt(s_diff);
    /* Compute the p-value */
    p = 2 * (1 - probt(abs(t), n_group1 + n_group2 - 4));
    /* Output the results */
    output;
run;
/* Print the results */
proc print data=prob4;
    var t p mse_pooled s_diff;
    title 'T-test for Difference in Slopes of FEV on Age between Hispanic and White Groups';
run;

/* 5. */
proc glm data=subrace;
	class race;
	model fev = race age race*age / solution;
	title 'Ethnicity and Age-By-Ethnicity interaction';
run;

