data blood_pressure;
    input ID Placebo Hydrochlorothiazide;
    datalines;
1 211 181
2 210 172
3 210 196
4 203 191
5 196 167
6 190 161
7 191 178
8 177 160
9 173 149
10 170 119
11 163 156
;
run;
proc ttest data=blood_pressure;
    paired Placebo*Hydrochlorothiazide;
run;
