* Lab #3 Part 1 Question Number 3b ;
data L3_3b;
	set L3_2;
	TankVol380 = TankLast-380;
run;

proc reg data=L3_3b;
	model TankVol = TankVol380/clb;
run;
