data cholesterol;
    input cholesterol @@;
    datalines;
135 150 200 155 212 196 188 151 230 168 ;
run;

proc ttest data=cholesterol;
    var cholesterol;
run;
