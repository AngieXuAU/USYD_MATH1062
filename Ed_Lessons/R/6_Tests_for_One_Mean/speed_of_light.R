# Convert the Experiment 4 readings back to km/s
speed_exp4 <- morley$Speed[morley$Expt == 4] + 299000

# Enter the modern accepted value in km/s
modern_speed <- 299792.458

speed_exp4

# We are testing H0: mu = 299792.458 against HA: mu != 299792.458

# Display three diagnostic plots side by side
par(mfrow = c(1, 3))

hist(
  speed_exp4,
  main = "Experiment 4 readings",
  xlab = "Measured speed (km/s)",
  col = "#d8c8ea",
  border = "white"
)

boxplot(
  speed_exp4,
  main = "Boxplot",
  ylab = "Measured speed (km/s)",
  col = "#f4b183"
)

qqnorm(speed_exp4, main = "Normal Q-Q plot")
qqline(speed_exp4, col = "#7a3e9d", lwd = 2)

# Return later plots to the usual one-panel layout
par(mfrow = c(1, 1))

# Calculate the sample summaries
n <- # Your code
  x_bar <- # Your code here
  s <- # Your code here

  # Calculate the estimated standard error and observed t statistic
  se_hat <- # Your code here
  df <- # Your code here
  t_obs <- # Your code here

  round(c(
    n = n,
    x_bar = x_bar,
    s = s,
    se_hat = se_hat,
    df = df,
    t_obs = t_obs
  ), 4)
