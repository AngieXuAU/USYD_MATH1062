
sep = "-------------------"
sep

coin_box <- c(0.2, 0.2, 0.1, 0.1, 0.05)

draws = 15
trials = 10


coin_sample_means = replicate(trials, mean(sample(coin_box, draws, replace= TRUE)))