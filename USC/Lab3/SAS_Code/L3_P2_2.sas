* Lab #3 Part 2 Question Number 2 ;
libname mydata 'Z:\Lab3';

data subjdata;
    set mydata.subjdata(keep=asthma mmef);
run;


proc reg data=subjdata;
    model mmef = asthma;
run;
