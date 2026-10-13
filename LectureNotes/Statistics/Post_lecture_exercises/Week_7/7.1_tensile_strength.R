tensile_strength <- c(
  422, 418, 417, 414, 423, 412, 420, 415, 409, 427,
  416, 419, 414, 421, 417, 418, 426, 411, 423, 416,
  410, 419, 413, 425, 420, 415, 422, 417, 414, 418,
  416, 421, 409, 424, 418, 417, 415, 420, 413, 422,
  419, 416, 417, 425, 410, 414, 421, 418, 416, 423,
  415, 412, 420, 417, 419, 418, 416, 422, 414, 421
)

boxplot(tensile_strength)
hist(tensile_strength)
qqnorm(tensile_strength)
qqline(tensile_strength, col = "red")

nh <- 415
n <- length(tensile_strength)
t <- (mean(tensile_strength) - nh) / (sd(tensile_strength) / sqrt(n))
t

p_val <- 2 * pt(t, df=59, lower.tail = FALSE)
p_val

t_val <- qt(0.975, df = n - 1)
lower <- mean(tensile_strength) - t_val * sd(tensile_strength) / sqrt(n)
upper <- mean(tensile_strength) + t_val * sd(tensile_strength) / sqrt(n)

lower
upper