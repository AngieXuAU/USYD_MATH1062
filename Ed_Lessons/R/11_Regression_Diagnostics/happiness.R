# Load the complete global-happiness dataset
happy <- read.csv("Ed_Lessons/R/11_Regression_Diagnostics/global_happiness.csv")

# Check how many rows and columns are in the dataset
dim(happy)

# Display the variable names so we can check the data loaded correctly
names(happy)

# Display the first few values of the two variables used in this challenge
head(
  happy[, c("log_gdp", "life_satisfaction")]
)


# Draw a scatterplot of life satisfaction against log GDP
plot(
  happy$log_gdp,
  happy$life_satisfaction,
  xlab = "Log GDP",
  ylab = "Life satisfaction",
  main = "Life satisfaction and log GDP",
  pch = 19,
  col = "#5B2C91"
)

# Fit the regression line to the complete population
population_model <- lm(
  life_satisfaction ~ log_gdp,
  data = happy
)

# Add the fitted population line to the scatterplot
abline(
  population_model,
  col = "red",
  lwd = 2
)

# Extract and display the population slope
population_slope <- coef(
  population_model
)[["log_gdp"]]

population_slope