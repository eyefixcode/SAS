libname mydata 'Z:';
/* A1 */
proc means data=mydata.subjdata;
	class townname;
	var NO2 ozone pm10;
	title 'Basic Relationships';
run;
/* A2 */
proc sgplot data=mydata.subjdata;
	scatter y=fev x=pm10;
	reg y=fev x=pm10;
	title 'FEV versus PM10';
run;
/* A3 */
proc reg data=mydata.subjdata;
    model fev = pm10 / clb;
    ods output ParameterEstimates=PE;
    ods output ANOVA=ANOVA;
    ods output FitStatistics=FitStats;
	title 'Regression of FEV on PM10';
run;
/* B1 */
proc reg data=mydata.subjdata;
	model fev = pm10 sex height/clb;
	title 'Regression of FEV on PM10 w/ adjustments for sex and height';
run;
/* C1 */
proc reg data=mydata.subjdata;
	model fev = asthma/clb;
	title 'Regression of FEV on Asthma';
run;
proc reg data=mydata.subjdata;
	model pm10 = asthma/clb;
	title 'Regression of PM10 on Asthma';
run;
/* C2 */
proc reg data=mydata.subjdata;
	model fev = pm10 sex height asthma/clb;
	title 'Regression of FEV on PM10 w/ adjustments for sex, height, and asthma';
run;
/* D1 */
proc format;
    value RACEF 1='Asian' 2='Black' 3='Hispanic' 4='Other' 5='White (baseline)';
run;
/* Model for FEV regressed on race */
proc glm data=mydata.subjdata;
    class race;
    model fev = race / solution;
    title 'Regression of FEV on Race';
run;
/* Model for PM10 regressed on race */
proc glm data=mydata.subjdata;
    class race;
    model pm10 = race / solution;
    title 'Regression of PM10 on Race';
run;
/* D2 */
proc glm data=mydata.subjdata;
    class race;
    model fev = pm10 sex height race / solution;
    title 'Regression of FEV on PM10, Sex, Height, and Race';
run;

