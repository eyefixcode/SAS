* - Homework 1 Question F Question 5 - Descriptive statistics;
libname mydata 'Z:\HW1';
/* Calculate descriptive statistics for SBP */
proc means data=mydata.HW2_A mean stddev clm;
    var SBP;
    output out=descriptive_stats mean=Mean_SBP stddev=Std_SBP lclm=LCL_SBP uclm=UCL_SBP;
run;

/* Calculate descriptive statistics for SBP by smoking status */
proc means data=mydata.HW2_A mean stddev clm;
    class SMK;
    var SBP;
    output out=descriptive_stats_by_SMK mean=Mean_SBP stddev=Std_SBP lclm=LCL_SBP uclm=UCL_SBP;
run;

/* Combine the results and print */
data summary_stats;
    set descriptive_stats (in=a)
        descriptive_stats_by_SMK (in=b);
    if a then do;
        Group = 'Overall';
        output;
    end;
    else if b and SMK = 0 then do;
        Group = 'Non-smoker';
        output;
    end;
    else if b and SMK = 1 then do;
        Group = 'Smoker';
        output;
    end;
run;


proc print data=summary_stats noobs;
    var Group Mean_SBP Std_SBP LCL_SBP UCL_SBP;
    title "Descriptive Statistics for SBP";
run;
