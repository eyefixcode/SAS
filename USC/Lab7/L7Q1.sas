*- Lab 7 Question 1;
libname mydata 'Z:/';
/* Read the SUBJDATA dataset and apply formats */
data subjdata;
    set mydata.subjdata; /* Read the SAS dataset from the library */
	options fmtsearch=(mydata formats);
run;
/* Use Proc Means to center variables */
proc means data=subjdata mean;
	var height weight BMI mmef age fev;
run;
/* Add new variables as specified */
data subjdata_new;
	set subjdata;
	Heightc = Height-140.601;
	Weightc = weight-80.573;
	BMIc = BMI-0.026;
	MMEFc = MMEF-2354.57;
	Female = Sex-1;
	Agec = Age-10.060;
	FEVc = FEV - 2019.86;
    Height2 = Heightc*Heightc;
    weight2 = Weightc*Weightc;
    age2 = agec*agec;
    BMI2 = BMIc*BMIc;
	MMEF2 = MMEFc*MMEFc;
	FEV2 = FEVc*FEVc;
	log_FEV = log(FEV);
    log_MMEF = log(MMEF);
run;

/* List the X variables for initial consideration */
proc contents data=subjdata_new;
run;
/* Check for collinearity among X variables */
proc corr data=subjdata_new
	pearson spearman;
	ods output pearsoncorr=pcoef
			   SpearmanCorr=scoef;
	var Asthma Female Race Smoke Age Agec Age2 MMEF MMEFc log_MMEF MMEF2 Height Heightc Height2 Weight Weightc Weight2 BMI BMIc BMI2 FEV FEVc FEV2 log_FEV;
run;

/* Question 2 */
/* Best Subsets */
proc reg data=subjdata_new;
	model fvc= asthma female race smoke age agec age2 mmef mmefc mmef2 weight weightc weight2 BMI BMIc BMI2 FEVc FEV2/selection = maxr;
run;

/* Backward elimination */
proc glmselect data=subjdata_new;
	class asthma female race smoke;
	model fvc = asthma female race smoke age agec age2 mmef mmefc mmef2 height heightc height2 weight weightc weight2 BMI BMIc BMI2 FEVc FEV2/selection = backward details = all hierarchy = single sls = 0.15 showpvalues select =sl stop = sl;
run;

/* Forward selection */
proc glmselect data=subjdata_new;
	class asthma female race smoke;
	model fvc = asthma female race smoke age agec age2 mmef mmefc mmef2 height heightc height2 weight weightc weight2 BMI BMIc BMI2 FEVc FEV2/selection = forward details = all hierarchy = single sls = 0.15 showpvalues select =sl stop = sl;
run;

/* Stepwise selection */
proc glmselect data=subjdata_new;
	class asthma female race smoke;
	model fvc = asthma female race smoke age agec age2 mmef mmefc mmef2 height heightc height2 weight weightc weight2 BMI BMIc BMI2 FEVc FEV2/selection = stepwise details = all hierarchy = single sls = 0.15 showpvalues select =sl stop = sl;
run;

/* Questions 3-4 */
proc reg data=subjdata_new;
	model fvc =female asthma weightc mmef fevc agec age2 bmic bmi2 fev2/ vif;
run;
quit;

/* Question 7 */
proc reg data=subjdata_new;
    model FVC = Weight Height Age Asthma;
	title 'Initial MLR';
run;
proc reg data=subjdata_new;
    model FVC = Weight Age Asthma;
	title 'MLR without Height';
run;
/* Checking for Interaction Effects */
data subjdata_new;
	set subjdata_new;
	Weight_Height = Weight*Height;
	Weight_Age = Weight*Age;
	Weight_Asthma = Weight*Asthma;
	Height_Age = Height*Age;
	Height_Asthma = Height*Asthma;
	Age_Asthma = Age*Asthma;
run;
proc reg data=subjdata_new;
    model FVC = Weight_Height Weight_Age Weight_Asthma Height_Age Height_Asthma Age_Asthma;
	title 'Checking for Interaction Effects';
run;
/* Final Model after Evaluating Confounders and Interactions */
proc reg data=subjdata_new;
    model FVC = Weight Height Age Asthma Weight_Height;
	output out=diag_data p=Predicted r=Residuals;
	title 'Final Model';
run;
/* Diagnostic Plots for Assessing Linear Regression Assumptions */
proc sgplot data=diag_data;
    scatter x=Predicted y=Residuals;
    title 'Residuals vs Predicted Values';
run;
proc univariate data=diag_data normal;
    var Residuals;
    histogram Residuals / normal;
    qqplot Residuals / normal(mu=est sigma=est);
run;
