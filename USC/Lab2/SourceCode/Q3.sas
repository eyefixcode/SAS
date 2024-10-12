libname mydata "Z:\Lab2";

data subjdata;
  set mydata.subjdata;
run;
/* Question 3 */

/* Define formats */
proc format;
  value YESNOF
    0 = 'No'
    1 = 'Yes';
  value SEXF
    1 = 'Male'
    2 = 'Female';
run;

proc sgplot data=mydata.subjdata;
    hbar asthma / group=sex;
    title "The distribution of asthma prevalence by Gender (Stacked)";
run;
