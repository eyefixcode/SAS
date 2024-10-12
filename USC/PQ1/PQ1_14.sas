data a;
    Y = probnorm(2.25);
run;

proc print data=a;
    title 'One-sided p-value corresponding to Z=2.25 in standard normal distribution';
run;
