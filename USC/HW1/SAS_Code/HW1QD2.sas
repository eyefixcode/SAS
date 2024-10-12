* - Homework 1 Question D:
* - #2: Create HW2_NEW from HW2, 
(a)add labels(SBP/QUET//SMK), 
(b)ID=Person, 
(c)Calculate BMI from QUET (BMI= QUET/100*703.1),
(d)Create binary var HIBMI 1=(BMI>25kg/m^2) and 0=(BMI<=25kg/m^2),
(e)PROC FORMAT HIMBI(1/0=heavy/light) and SMK(1/0=non-smoker/smoker)
Create vars AGESQ and LNAGE
;
*- Formatting definitions;
proc format;
	value HIBMI_binary 1='heavy' 0='light';
	value SMK_binary 1='smoker' 0='non-smoker';
run;

* - Create a new dataset 'HW2_NEW' from 'HW2';
data HW2_NEW;
	set WORK.HW2;
	*- Add Labels (SBP/QUET/SMK);
	label SBP = 'Systolic Blood Pressure' QUET = 'Quetlet Index' SMK = 'Smoking History';
	*- Rename ID to person;
	rename ID = PERSON;
	*- Calculate BMI;
	BMI = QUET/100*703.1;
	*- Logic for HIBMI_Binary;
	if BMI > 25 then HIBMI=1;
	else HIBMI=0;
	*-Create new vars (AGESQ LNAGE);
	AGESQ = AGE**2;
	LNAGE = log(AGE);
	*-Add in Formats from earlier;
	format HIBMI HIBMI_binary. SMK SMK_binary.;
run;

* - Double check successful via print;
proc print data=HW2_NEW;
run;
