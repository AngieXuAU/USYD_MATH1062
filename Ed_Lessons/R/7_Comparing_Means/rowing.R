# Read the dataset
rowing <- read.csv(
  "Ed_Lessons/R/7_Comparing_Means/erg_wintertraining_div3.csv",
  stringsAsFactors = FALSE
)

# Convert a time stored as minutes:seconds:hundredths into seconds
# This is supplied data-preparation code
time_to_seconds <- function(time_text) {
  pieces <- strsplit(time_text, ":")

  sapply(pieces, function(x) {
    as.numeric(x[1]) * 60 +
      as.numeric(x[2]) +
      as.numeric(x[3]) / 100
  })
}

rowing$time_seconds <- time_to_seconds(rowing$Time)

# DATA WRANGLING
# Keep the first and second 2 km tests
trial1 <- subset(
  rowing,
  Piece == "2k test" & Trial == 1,
  select = c(ID, time_seconds)
)

trial2 <- subset(
  rowing,
  Piece == "2k test" & Trial == 2,
  select = c(ID, time_seconds)
)

# Give the two time columns distinct names
names(trial1)[2] <- "trial1_seconds"
names(trial2)[2] <- "trial2_seconds"

# Match Trial 1 and Trial 2 using athlete ID
matched_times <- merge(trial1, trial2, by = "ID")

# Positive values mean the athlete was faster on Trial 2
d <- matched_times$trial1_seconds -
  matched_times$trial2_seconds

head(matched_times)
# Vector of differences between trial 1 and trial 2
d

# diagnostic plots
par(mfrow = c(1, 3))

hist(
  d,
  main = "Within-athlete differences",
  xlab = "Trial 1 minus Trial 2 (seconds)",
  col = "#d8c8ea",
  border = "white"
)

boxplot(
  d,
  main = "Boxplot of differences",
  ylab = "Trial 1 minus Trial 2 (seconds)",
  col = "#f4b183"
)

qqnorm(d, main = "Differences Q-Q plot")
qqline(d, col = "#7a3e9d", lwd = 2)

par(mfrow = c(1, 1))

# Record the design and t-test you selected
design_choice <- "paired"
diagnosed_quantity <- "within-athlete differences"
chosen_method <- "paired"

# Write one sentence in quotation marks using the study design and diagnostics
diagnostic_reason <- "Paired as each data point is paired with the other corresponding data point for that athlete."

c(
  design = design_choice,
  diagnosed = diagnosed_quantity,
  method = chosen_method,
  reason = diagnostic_reason
)

# test statistic
# Sample summaries
n <- length(matched_times$ID)
d_bar <- mean(d)
s_d <- sd(d)

# Estimated standard error, degrees of freedom and t statistic
se_hat <- s_d / sqrt(n)
df <- n - 1
t_obs <- d_bar / se_hat

round(c(
  n = n,
  d_bar = d_bar,
  s_d = s_d,
  se_hat = se_hat,
  df = df,
  t_obs = t_obs
), 4)


# FINDING p value and multiplier for confidence interval
# Calculate the two-sided p-value using pt()
p_value <- 2 * pt(t_obs, df = df, lower.tail = FALSE)

# Find the multiplier for a 90% confidence interval
t_star <- qt(0.95, df = df)

# Construct the interval for the population mean difference
ci_lower <- d_bar - t_star * se_hat
ci_upper <- d_bar + t_star * se_hat

round(c(
  p_value = p_value,
  t_star = t_star,
  ci_lower = ci_lower,
  ci_upper = ci_upper
), 4)

# AUTOMATIC CALCULATION: verification
# Ask R to carry out the same selected t-test
rowing_test <- t.test(
  matched_times$trial1_seconds, 
  matched_times$trial2_seconds, 
  paired = TRUE, 
  conf.level = 0.90
)

rowing_test

# Compare the manual and t.test() results
round(c(
  manual_t = t_obs,
  t_test_t = unname(rowing_test$statistic),
  manual_p_value = p_value,
  t_test_p_value = rowing_test$p.value
), 6)

round(rbind(
  manual_ci = c(ci_lower, ci_upper),
  t_test_ci = unname(rowing_test$conf.int)
), 4)