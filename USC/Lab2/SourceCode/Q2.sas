libname mydata "Z:\Lab2";

data subjdata;
  set mydata.subjdata;
run;

/* Question 2 */
proc reg data=mydata.subjdata;
  model mmef = htinches; 
  output out=residuals predicted=predictedvalues;
run;

/* Question 2.1 */
proc sgplot data=residuals;
  histogram MMEF / fillattrs=(color=blue) transparency=0.5;
  density MMEF / type=kernel;
  xaxis label='Residuals';
  yaxis label='Density';
run;

/* Question 2.2 */
proc sgplot data=residuals;
  loess x=PredictedValues y=MMEF / degree=1;
  refline 0 / axis=y;
  xaxis label='Predicted Values';
  yaxis label='Residuals';
run;
