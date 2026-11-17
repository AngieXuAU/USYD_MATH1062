observed <- c(35, 68, 38, 19)
probabilities <- c(0.25, 0.35, 0.25, 0.15)
n <- sum(observed)
expected <- probabilities * n

chisq.test(x = observed, p = probabilities)

t_obs <- sum((observed - expected)^2 / expected)
1 - pchisq(t_obs, 3)
