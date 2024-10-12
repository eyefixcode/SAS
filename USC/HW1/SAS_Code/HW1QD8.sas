* - Homework 1 Question D:
* - #8: Query 'HW2_A.sas7bdat' create temp data set named 'HW2_AGE' only keep PERSON, AGE, AGESQ, LNAGE;
libname mydata 'Z:\HW1';
/* Redefine the formats to avoid error prompt */
proc format;
    value HIBMI_binary
        1 = 'heavy'
        0 = 'light';
    value SMK_binary
        1 = 'smoker'
        0 = 'non-smoker';
run;

data HW2_AGE;
	set mydata.HW2_A;
	keep PERSON AGE AGESQ LNAGE;
run;

* - Double check results;
proc print data=HW2_AGE;
run;
