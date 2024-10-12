* Lab #3 Part 2 Question Number 1 ;
libname mydata 'Z:\Lab3';
proc format;
    value YESNOF
        1 = 'Yes'
        0 = 'No';
run;
data mydata.subjdata;
    set mydata.subjdata;
    format asthma;
run;
proc ttest data=mydata.subjdata;
    class asthma;
    var mmef;
run;

