libname mydata "Z:";
data HW4b;
	set mydata.chol_281;
	AGE10=AGE/10;
run;

proc glm data=HW4b;
	model LOGCHOL = AGE FEMALE AGE*FEMALE;
	title 'Association between Age and Log(Cholesterol) Differ by Sex';
run;

