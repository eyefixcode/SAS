data blood_pressure;
    input ID Group Placebo;
    datalines;
1 0 211
2 0 210
3 0 210
4 0 203
5 0 196
6 0 190
7 0 191
8 0 177
9 0 173
10 0 170
11 0 163
12 1 181
13 1 172
14 1 196
15 1 191
16 1 167
17 1 161
18 1 178
19 1 160
20 1 149
21 1 119
22 1 156
;
run;
proc ttest data=blood_pressure;
    class Group;
    var Placebo;
    ods select ttests;
run;
