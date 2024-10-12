libname mydata 'Z:\';
/* Run linear regression with SBP as the dependent variable and BMI as the independent variable */
proc reg data=WORK.Hw2_qa1;
    model SBP = BMI;
    output out=Out2 p=Predicted_SBP lcl=Lower_CI ucl=Upper_CI;
run;

/* Print the input dataset for verification */
proc print data=mydata.Hw2_qa1;
run;

/* Print the output dataset with specific variables of interest */
proc print data=Out2 label;
    var BMI Predicted_SBP Lower_CI Upper_CI;
run;

/* Filter out the observation with BMI=20 */
data Person20;
    set Out2;
    if Person = 20;
run;

/* Print the filtered dataset for BMI=20 */
proc print data=Person20 label;
	var BMI Lower_CI Upper_CI;
run;
