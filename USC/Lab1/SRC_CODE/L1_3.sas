* - Define main dir;
libname mylib 'Z:/Lab1';

* - Create 'MONEY' from 'INCOME.DAT';
data MONEY;
	infile 'Z:/Lab1/INCOME.DAT';
	input ID Income $ L_Name $;
run;
* - Sort 'MONEY' by 'ID';
proc sort data=MONEY;
	by ID;
run;

* - Print 'MONEY';
proc contents data=MONEY;
run;
proc print data=MONEY;
run;

* - code from Q1;
data GYM;
    infile 'Z:/Lab1/GYM.DAT';
    input ID Gender $ Age Weight;
run;
* - Sort 'GYM' by 'ID';
proc sort data=GYM;
	by ID;
run;
* - Print 'GYM';
proc contents data=GYM;
run;
proc print data=GYM;
run;

* - Merge 'GYM' and 'MONEY' into 'GYMMONEY' and create DAT file;
data GYMMONEY;
	merge GYM(in=a) MONEY(in=b);
	by ID;
	if a or b;
	file 'Z:/Lab1/GYMMONEY.DAT';
	put ID Gender $ Age Weight Income $ L_Name $;
run;

* - Print 'GYMMONEY';
proc contents data=GYMMONEY;
run;
proc print data=GYMMONEY;
run;
