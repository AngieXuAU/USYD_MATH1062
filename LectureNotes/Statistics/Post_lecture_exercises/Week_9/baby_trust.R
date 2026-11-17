# reliable
x1 <- 18
n1 <- 30

# unreliable
x2 <- 10
n2 <- 30

p1 <- x1 / n1
p2 <- x2 / n2

p_hat <- (x1 + x2) / (n1 + n2)
se <- sqrt(p_hat * (1 - p_hat) * (1 / n1 + 1 / n2))

z <- (p1 - p2) / se

p_value <- 1 - pnorm(z)
