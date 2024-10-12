data a;
    Y = 2 * (1 - probnorm(2.25)); /* Multiply by 2 to include both tails */
    format Y 0.000000; /* format Y to six decimal places */
run;

proc print data=a;
    title 'Two-sided p-value corresponding to Z=2.25 in standard normal distribution';
run;
