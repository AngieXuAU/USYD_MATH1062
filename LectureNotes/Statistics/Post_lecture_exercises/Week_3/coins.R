sep <- "-------------------"
box <- c(0.2, 0.2, 0.1, 0.1, 0.05)

draws <- 15
trials <- 10


coin_sample_means <- replicate(trials, mean(sample(box, draws, replace = TRUE))) # nolint

line <- "Expected value of the mean of 15 draws: "
ex <- mean(coin_box)
ex

# part b
line <- "Standard error of the mean of 15 draws: "
stddev <- sd(coin_box)
stddev
stderr <- stddev / sqrt(draws)
stderr

# part c
line <- "Mean and sd of 10 trials"
res <- replicate(trials, mean(sample(box, draws, replace = TRUE)))
mean(res)
sd(res)

line <- "Mean and sd of 1000 trials"
trials <- 1000
res <- replicate(trials, mean(sample(box, draws, replace = TRUE)))
mean(res)
sd(res)
