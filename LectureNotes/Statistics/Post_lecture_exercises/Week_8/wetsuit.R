# Swimmer dataset
df <- data.frame(
  swimmer = 1:12,
  wetsuit = c(1.57, 1.47, 1.42, 1.35, 1.22, 1.75, 1.64, 1.57, 1.56, 1.53, 1.49, 1.51),
  no_wetsuit = c(1.49, 1.37, 1.35, 1.27, 1.12, 1.64, 1.59, 1.52, 1.50, 1.45, 1.44, 1.41),
  diff = c(0.08, 0.10, 0.07, 0.08, 0.10, 0.11, 0.05, 0.05, 0.06, 0.08, 0.05, 0.10)
)

# HATPC:
# assumption - underlying data normality

d <- df$diff # the main data

qqnorm(d)
qqline(d, col = "red")
boxplot(d) # looks normal enough, so proceed with t-test

# test statistic
t_value <- mean(d) / (sd(d) / sqrt(length(d)))
t_value

p_value <- pt(t_value, lower.tail = FALSE, df = 11)
p_value
