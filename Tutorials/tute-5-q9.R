box <- c(rep(0, 3), rep(1, 22))

exp_val <- mean(box) * 200
exp_val

std_error <- sqrt(200) * sd(box)
std_error
