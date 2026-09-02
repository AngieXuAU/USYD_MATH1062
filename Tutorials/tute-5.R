# question 5

box5 <- c(1, 2, 3, 3, 4, 4, 5, 5)

mean(box5)
sd(box5)

s <- mean(box5) * 64
s

std_error <- mean(box5) / sqrt(64)
std_error

# separator ------------

box7 <- c(-1, 0, 0, 1, 2)

x <- mean(box7)
x
n <- length(box7)
std_dev <- sd(box7) * sqrt((n - 1) / n)
std_dev

# sample mean
exp <- x
exp
std_error <- std_dev / sqrt(25)
std_error

# sample sum
s <- x * 25

std_error_sum <- std_dev * sqrt(25)
