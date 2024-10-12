data a;
    Y = probit(0.8); /* Finding the Z-value corresponding to the 80th percentile */
    format Y 0.000000; /* format Y to six decimal places */
run;

proc print data=a;
    title 'Z-value corresponding to the 80th percentile of the standard normal distribution';
run;
