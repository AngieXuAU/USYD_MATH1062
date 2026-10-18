# Read the dataset
penguins <- read.csv("Ed_Lessons/R/7_Comparing_Means/penguins.csv")

# Keep Adélie and Chinstrap penguins with recorded flipper lengths
comparison <- subset(
  penguins,
  species %in% c("Adelie", "Chinstrap") &
    !is.na(flipper_length_mm)
)

# Create one numerical vector for each species
adelie <- comparison$flipper_length_mm[
  comparison$species == "Adelie"
]

chinstrap <- comparison$flipper_length_mm[
  comparison$species == "Chinstrap"
]

# Display a group boxplot and one Q-Q plot for each species
par(mfrow = c(1, 3))

boxplot(
  flipper_length_mm ~ species,
  data = comparison,
  main = "Flipper lengths by species",
  xlab = "Species",
  ylab = "Flipper length (mm)",
  col = c("#d8c8ea", "#f4b183")
)

qqnorm(adelie, main = "Adelie Q-Q plot")
qqline(adelie, col = "#7a3e9d", lwd = 2)

qqnorm(chinstrap, main = "Chinstrap Q-Q plot")
qqline(chinstrap, col = "#7a3e9d", lwd = 2)

par(mfrow = c(1, 1))

# Compare the sample sizes and standard deviations
data.frame(
  species = c("Adelie", "Chinstrap"),
  sample_size = c(length(adelie), length(chinstrap)),
  mean_mm = c(mean(adelie), mean(chinstrap)),
  sd_mm = c(sd(adelie), sd(chinstrap))
)

# Record the design and procedure you selected
design_choice <- "independent"
chosen_method <- "pooled"

# Write one sentence in quotation marks using evidence from the diagnostics
diagnostic_reason <- "Each measurement relates to only one penguin, the data appears normally distributed and the standard deviations are similar."

c(
  design = design_choice,
  method = chosen_method,
  reason = diagnostic_reason
)

# Sample sizes, means and standard deviations
m <- length(adelie)
n <- length(chinstrap)
x_bar <- mean(adelie)
y_bar <- mean(chinstrap)
s_x <- sd(adelie)
s_y <- sd(chinstrap)

# Standard deviation and estimated standard error for the selected procedure
s_p <- sqrt(((m - 1) * s_x^2 + (n - 1) * s_y^2) / (m + n - 2))
se_hat <- s_p * sqrt(1/m + 1/n)

# Observed difference, degrees of freedom and t statistic
difference <- x_bar - y_bar
df <- m + n - 2
t_obs <- (difference - 0) / se_hat

# data summary for key variables
round(c(
  m = m,
  n = n,
  x_bar = x_bar,
  y_bar = y_bar,
  s_x = s_x,
  s_y = s_y,
  s_p = s_p,
  se_hat = se_hat,
  difference = difference,
  df = df,
  t_obs = t_obs
), 4)

# p value and confidence interval
# Calculate the two-sided p-value using pt()
p_value <- 2 * pt(t_obs, df = df)
p_value

# Find the multiplier for a 95% confidence interval using qt()
t_star <- qt(0.975, df = df)
t_star

# Construct the interval for mu_A - mu_C
ci_lower <- difference - t_star * se_hat
ci_upper <- difference + t_star * se_hat

round(c(
  p_value = p_value,
  t_star = t_star,
  ci_lower = ci_lower,
  ci_upper = ci_upper
), 4)

# Ask R to carry out the same procedure
penguin_test <- t.test(adelie, chinstrap, mu = 0, alternative = "two.sided", var.equal = TRUE, conf.level = 0.99)

penguin_test

# Compare the manual and t.test() results
round(c(
  manual_t = t_obs,
  t_test_t = unname(penguin_test$statistic),
  manual_p_value = p_value,
  t_test_p_value = penguin_test$p.value
), 6)

round(rbind(
  manual_ci = c(ci_lower, ci_upper),
  t_test_ci = unname(penguin_test$conf.int)
), 4)