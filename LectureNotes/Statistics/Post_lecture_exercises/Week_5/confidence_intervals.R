3.18 - qnorm(0.995) * 0.07 / sqrt(60)

502 - qnorm(0.95) * 8 / sqrt(64)

library(binom)
binom.confint(53, 86, 0.98, methods = "wilson")

# sanity check
# 1 - confidence interval for the lower bound
n <- 86
lower <- 0.4908717
lower_upper_edge <- lower + qnorm(0.99) * sqrt(lower * (1 - lower) / n)
lower_upper_edge

# 2 - confidence interval for the upper bound
upper <- 0.7279182
upper_lower_edge <- upper - qnorm(0.99) * sqrt(upper * (1 - upper) / n)
upper_lower_edge
