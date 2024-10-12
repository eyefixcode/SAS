* - Lab 8: 
Part 1
Question 1;
libname mydata 'Z:\';

* - Create data;
data a;
  input subject druga drugb;
datalines;
1 20 18
2 40 36
3 30 30
4 45 46
5 19 15
6 27 22
7 32 29
8 26 25
;
run; 

* Run T-test;
proc ttest data=a;
	paired druga*drugb;
run;
* reformatted dataset;
data b; 
	set a;
   drop druga drugb;
   *create 1 record for measurement on drug A;
   drug='a';
   Y = druga;
   output;
   *create 2nd record for measurement on drug B;
   drug = 'b';
   Y = drugb;
   output;
run;

* Question 2;
proc glm data=b;
	class subject drug;
	model y = subject drug/solution;
	means drug / tukey alpha=0.05;
run;

* Question 4;
proc glm data=b;
	class drug;
	model y = drug/solution;
	means drug / tukey alpha=0.05;
run;

* Part 2;
data b;
  label y='Attitude' duration='Hours training';
  length ses $ 6;
  do ses = 'Upper', 'Middle', 'Lower';
    do duration = 5, 10, 15;
       input y @;
       output;
    end;
  end;
datalines;
      24      44      38            30      35      26            21      41      42
      33      36      29            21      40      27            18      39      52
      37      25      28            39      27      36            10      50      53
      29      27      47            26      31      46            31      36      49
      42      43      48            34      22      45            20      34      64
;run;
proc print data=b;
run;

* Question B;
proc means data=b;
	class ses duration;
run;

*Question C;
Title "Officer attitude by hours training and neighborhood type";
proc sgpanel data=b;
 panelby duration / columns=3 novarname;
 vbox y / category=ses;
run;


*Question D;
proc glm data=b;
	class duration ses;
	model y=duration ses duration*ses/solution;
	means duration ses/tukey alpha=0.05;
run;

*Question E;
proc sort data=b;
	by ses;
run;
proc glm data=b;
	by ses;
	class duration;
	model y=duration/solution;
	means duration/tukey alpha=0.05;
	title 'Analysis of duration in each SES group';
run;
proc sort data=b;
	by duration;
run;
proc glm data=b;
	by duration;
	class ses;
	model y= ses / solution;
	means ses / tukey alpha=0.05;
	title 'Analysis of SES in each duration group';
run;
