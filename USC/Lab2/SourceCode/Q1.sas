libname mydata "Z:\Lab2";

data subjdata;
  set mydata.subjdata;
run;

/* Question 1 */
proc sgplot data=mydata.subjdata; 
  histogram fev;
  density fev;
  title "FEV Distribution Normality Check";
  label fev = "Forced Expiratory Volume";
run;
