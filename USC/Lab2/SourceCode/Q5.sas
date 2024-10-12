libname mydata "Z:\Lab2";

data subjdata;
  set mydata.subjdata;
run;

/* Question 5 */
proc sgplot data=mydata.subjdata;
	scatter y=MMEF x=htinches;
	reg y=MMEF x=htinches / cli clm;
	label mmef='Maximal mid expiratory flow' htinches='Height';
	title 'Scatter and Regression of MMEF on HTINCHES';
run;
