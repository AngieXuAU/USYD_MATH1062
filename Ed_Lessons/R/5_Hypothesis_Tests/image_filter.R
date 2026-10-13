#
x <- 52
n <- 500

p0 <- 0.08
p_hat <- x / n
dev <- sqrt(p0 * (1 - p0) / n)

z <- (p_hat - p0) / dev
z
pvalue <- 1 - pnorm(z)
pvalue
