# A manufacturing line historically passes 90% of components.
# In a random sample of 120 components produced after an upgrade,
# 114 pass inspection. We test whether the population pass rate has
# increased: H0: p = 0.90 against HA: p > 0.90.

library("binom")

mu <- 0.9

x <- 114
n <- 120
p <- x / n
dev <- sqrt(mu * (1 - mu) / 120)

p
dev

# H0: p = 0.9, Ha: p > 0.9
# (1) confidence intervals
# INCORRECT:
# # (a) manual
# me <- qnorm(0.975) * dev # nolint
# me
# lower <- p - me # nolint
# upper <- p + me # nolint
# lower
# upper

# (b) built-in
binom.confint(x, n, methods = "wilson")

# (2) prediction interval
me <- qnorm(0.975) * dev
lower <- mu - me
upper <- mu + me
lower
upper

# (3) p_value
pvalue <- 1 - pnorm(p, mean = mu, sd = dev)
pvalue

# (4) z-scores
z <- (p - mu) / dev
z
