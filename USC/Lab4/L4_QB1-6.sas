%macro sample_size(pi1, pi2, alpha=0.05, power=0.90, sided=2);
    /* Calculate Z values for given alpha and power */
    %let z_alpha = %sysfunc(probit(1 - &alpha. / &sided.));
    %let z_beta = %sysfunc(probit(&power.));

    /* Calculate the mean proportion */
    %let pi_bar = %sysevalf((&pi1. + &pi2.) / 2);

    /* Calculate the required sample size */
    %let delta = %sysevalf(&pi1. - &pi2.);
    %let n = %sysevalf((4 * &pi_bar. * (1 - &pi_bar.) * (&z_alpha. + &z_beta.)**2) / (&delta.**2));
    
    /* Round the sample size up to the next integer */
    %let n = %sysfunc(ceil(&n.));

    /* Print the result */
    %put Required Sample Size = &n.;
%mend;

/* Compute N when pi2 is 1% */
%sample_size(0.03, 0.01);

/* Change the expected difference (pi2 to 2%) */
%sample_size(0.03, 0.02);

/* Reduce power to 80% */
%sample_size(0.03, 0.01, power=0.80);

/* Require a stricter significance level of 0.01 */
%sample_size(0.03, 0.01, alpha=0.01);

/* Assume a 1-sided alternative */
%sample_size(0.03, 0.01, sided=1);
