* OLD
*Import all data files 'lablq1' 'lablq2' 'lab2ql' 'lab2q2';
data LAB1Q1;
    infile 'Z:\Lab3\lab1q1.dat';
    input ID 1-4 Sex $ 6 HtFeet 8 HtInches 9-10 Race 12 BirthM 14-15 BirthD 16-17 LabNum 19;
run;
data LAB2Q1;
    infile 'Z:\Lab3\lab2q1.dat';
    input ID 1-4 Sex $ 6 HtFeet 8 HtInches 9-10 Race 12 BirthM 14-15 BirthD 16-17 LabNum 19;
run;
data LAB1Q2;
    infile 'Z:\Lab3\lab1q2.dat';
    input ID Transportation GasPrice 4.2 Suv Carmake $10. Tankvol Tanklast city $33-48 +1 OneWay 5.2 SchTimes LabNum;
run;
data LAB2Q2;
    infile 'Z:\Lab3\lab2q2.dat';
    input ID Transportation GasPrice 4.2 Suv Carmake $10. Tankvol Tanklast city $33-48 +1 OneWay 5.2 SchTimes LabNum;
run;

* Sort Data prior to merge;
proc sort data=LAB1Q1;
    by id;
run;
proc sort data=LAB2Q1;
    by id;
cun;
proc sort data=LAB1Q2;
    by id;
run;
proc sort data=LAB2Q2;
    by id;
run;

* Merge data;
data EARLYLAB;
    merge LAB1Q1 LAB1Q2;
    by id;
run;

data LATELAB;
    merge LAB2Q1 LAB2Q2;
    by id;
run;

*Add newly merge data into L3_1;
data L3_1;
    set early late;
run;
proc sort data=L3_1;
    by sex;
run;

*NEW WAY;
*DEFINE macro;
%macro import_data(filename, dataset);
    data &dataset;
        infile "Z:\Lab3\&filename..dat";
        %if &dataset in (LAB1Q1, LAB2Q1) %then %do;
            input ID 1-4 Sex $ 6 HtFeet 8 HtInches 9-10 Race 12 BirthM 14-15 BirthD 16-17 LabNum 19;
        %end;
        %else %if &dataset in (LAB1Q2, LAB2Q2) %then %do;
            input ID Transportation GasPrice 4.2 Suv Carmake $10. Tankvol Tanklast city $33-48 +1 OneWay 5.2 SchTimes LabNum;
        %end;
    run;
%mend;

*import data;
%import_data(lab1q1, LAB1Q1);
%import_data(lab2q1, LAB2Q1);
%import_data(lab1q2, LAB1Q2);
%import_data(lab2q2, LAB2Q2);

*Sort data;
%macro sort_data(dataset);
    proc sort data=&dataset;
        by id;
    run;
%mend;

%sort_data(LAB1Q1);
%sort_data(LAB2Q1);
%sort_data(LAB1Q2);
%sort_data(LAB2Q2);

*Merge the datasets;
data EARLYLAB;
    merge LAB1Q1 LAB1Q2;
    by id;
run;

data LATELAB;
    merge LAB2Q1 LAB2Q2;
    by id;
run;

*Combine EARLYLAB/LATELAB;

data L3_1;
    set EARLYLAB LATELAB;
run;

proc sort data=L3_1;
    by sex;
run;

