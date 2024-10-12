libname mydata "Z:\Lab2";

data subjdata;
  set mydata.subjdata;
run;

/* Question 6 */

/* Define formats */
proc format;
  value RACEF
    1 = 'no'
    2 = 'yes';
run;

proc sgpanel data=mydata.subjdata;
	panelby pets;
	vbox FEV;
	title 'Box Plots of FEV those who have pets vs. those who do not';
run;
