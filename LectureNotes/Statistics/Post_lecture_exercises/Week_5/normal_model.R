# P(x < 13.3)

pnorm(13.3, 10, 2.3)

z <- (13.3 - 10) / 2.3

pnorm(z)


# Compute P(3 < X < 27)
x <- 36
dev <- 12
pnorm(27, x, dev) - pnorm(3, x, dev)

# Using qnorm
z <- qnorm(0.95)
c <- 60 + 4 * z

# finding endpoints a, b
z <- qnorm(0.73)
x <- 20
dev <- 5
b <- x + z * dev
a <- x - z * dev

# comparing two distributions
x <- 100
dev <- 5
# probability of a to be more than 110
1 - pnorm(110, x, dev)
# probability of b to be more than 110
dev <- 10
1 - pnorm(110, x, dev)

# another exercise
x <- 18
dev <- 4
pnorm(9, x, dev) + (1 - pnorm(22, x, dev))
pnorm(9, x, dev) + pnorm(22, x, dev, lower.tail = FALSE)

# reaction times
x <- 225
dev <- 50
pnorm(180, x, dev)
x <- 210
dev <- 40
pnorm(180, x, dev)

# more reaction times
x <- 225
dev <- 50
# P (200 < X < 260)
pnorm(260, 225, 50) - pnorm(200, 225, 50)
# scaled to standard normal
pnorm(0.7) - pnorm(-0.5)
