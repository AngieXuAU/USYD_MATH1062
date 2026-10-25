# gen z data
x1 <- 150
n1 <- 210

# boomer data
x2 <- 124
n2 <- 200

# probability
p1 <- x1 / n1 # gen z
p2 <- x2 / n2 # boomer

# HATPC
# hypothesis H0: p = p1 - p2 = 0
# Ha: p = p1 - p2 > 0 # nolint

# assumptions: samples are independent and random
p_hat <- (x1 + x2) / (n1 + n2)
se <- sqrt(p_hat * (1 - p_hat) * (1 / n1 + 1 / n2))
z <- (p1 - p2) / se

p_value <- 1 - pnorm(z)
