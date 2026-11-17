n <- 66
p <- 0.2
e <- n * p

obs <- c(18, 9, 15, 13, 11)
t_obs <- sum((obs - e)^2 / e)

chisq.test(c(18, 9, 15, 13, 11), p = c(rep(0.2, 5)))
