libname mydata "Z:\Lab2";

data subjdata;
  set mydata.subjdata;
run;

/* Question 4 */
proc sgpanel data=mydata.subjdata;
    panelby townname;
    vbar asthma/group=sex;
run;
