data _null_;
    z_value = 1.96;
    p_value = cdf('NORMAL', z_value);
    put p_value=;
run;
