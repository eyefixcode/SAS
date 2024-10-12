
data Finance;
	infile 'Z:\Lab1\FINANCE.DAT';
	input income $ gender $ Financial_plan $;
run;

* - Code from Q4 'GYMMONEY2;
* - Gather data from 'BOTH' dataset;
data BOTH;
    infile 'Z:/Lab1/BOTH.DAT';
    input ID Height Weight;
run;
* - Print 'BOTH' Query Results;
proc contents data=BOTH;
run;
proc print data=BOTH;
run;

* - Code from Q3 'GYMMONEY';
* - Create 'MONEY' from 'INCOME.DAT';
data MONEY;
	infile 'Z:/Lab1/INCOME.DAT';
	input ID Income $ L_Name $;
run;
* - Sort 'MONEY' by 'ID';
proc sort data=MONEY;
	by ID;
run;

data GYM;
    infile 'Z:/Lab1/GYM.DAT';
    input ID Gender $ Age Weight;
run;
* - Sort 'GYM' by 'ID';
proc sort data=GYM;
	by ID;
run;
* - Merge 'GYM' and 'MONEY' into 'GYMMONEY' and create DAT file;
data GYMMONEY;
	merge GYM(in=a) MONEY(in=b);
	by ID;
	if a or b;
	file 'Z:/Lab1/GYMMONEY.DAT';
	put ID Gender $ Age Weight Income $ L_Name $;
run;


* - Combine 'GYMMONEY' with 'BOTH' dataset;
data GYMMONEY2;
    merge GYMMONEY BOTH;
    by ID;
	file 'Z:/Lab1/GYMMONEY2.DAT';
	put ID Gender $ Age Weight Income $ L_Name $ Height;
run;


* - Print Updated 'GYMMONEY2' dataset;
proc contents data=GYMMONEY2;
run;
proc print data=GYMMONEY2;
run;
* - end code q4;

proc sort data=finance;
	by income gender;
proc sort data=GYMMONEY2;
	by income gender;
run;

data GYMMONEY3;
	merge GYMMONEY2 finance;
	by income gender;
run;
proc contents data=GYMMONEY3;
run;
proc print data=GYMMONEY3;
run;
