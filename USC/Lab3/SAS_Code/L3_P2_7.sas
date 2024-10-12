* Lab #3 Part 2 Question Number 7 ;
libname mydata 'Z:\Lab3';

* Create the new variable CENT_HT without formats;
data mydata.subjdata;
    set mydata.subjdata;
    CENT_HT = height - 140.6;
    format _all_;
run;

* Run the regression using CENT_HT;
proc reg data=mydata.subjdata;
    model mmef = CENT_HT;
run;

* Run the regression using Height and output residuals and predicted values;
proc reg data=mydata.subjdata;
    model mmef = height;
    output out=SASDataSet r=Res p=Pred;
run;

* Analyze the residuals;
proc univariate plot normal data=SASDataSet;
    var Res;
run;
