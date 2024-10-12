* Homework 2 Question B 3;
libname mydata 'Z:\';

/* Print the dataset to find the BMI of person 3 */
proc print data=WORK.Hw2_qa1 (obs=3);
run;

/* Direct Regression Prediction with Confidence Intervals */
proc reg data=WORK.Hw2_qa1;
    model SBP = BMI / clb cli;
    output out=PredResults p=PredictedSBP lclm=LowerCI uclm=UpperCI;
run;

/* Print results to check */
proc print data=PredResults;
run;

/* Extract BMI of person 3 */
data Person3;
    set WORK.Hw2_qa1 (firstobs=3 obs=3);
    keep BMI;
run;

data HW2_Pred_Person3;
    set PredResults;
    if BMI in (select BMI from Person3);
run;

proc print data=HW2_Pred_Person3;
    var BMI PredictedSBP LowerCI UpperCI;
run;

/* Calculate BMI of person 3 */
data _null_;
    set WORK.Hw2_qa1 (firstobs=3 obs=3);
    call symput('Person3BMI', BMI);
run;

/* Center the BMI values */
data WORK.Hw2_Centered;
    set WORK.Hw2_qa1;
    CenteredBMI = BMI - &Person3BMI;
run;

/* Fit regression model using centered BMI */
proc reg data=WORK.Hw2_Centered;
    model SBP = CenteredBMI / clb cli;
    output out=CenteredResults p=CenteredPredictedSBP lclm=CenteredLowerCI uclm=CenteredUpperCI;
run;

/* Print results to check */
proc print data=CenteredResults;
run;

/* Filter for person 3 */
data Centered_Pred_Person3;
    set CenteredResults;
    if CenteredBMI = 0;
run;

proc print data=Centered_Pred_Person3;
    var BMI CenteredPredictedSBP CenteredLowerCI CenteredUpperCI;
run;



