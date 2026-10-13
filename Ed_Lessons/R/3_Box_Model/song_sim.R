box <- c(1, rep(0, 4))

n <- 100
results <- replicate(n, (sum(sample(box, 3))) >= 1)

head(results)
mean(results)
