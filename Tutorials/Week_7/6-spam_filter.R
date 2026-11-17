p0 <- 0.12
n <- 300
x <- 28

p_hat <- x / n
stderr <- sqrt(p0 * (1 - p0) / n)
z <- (p_hat - p0) / stderr

pval <- pnorm(z)
