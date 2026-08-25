# Import library for ggplot functions
library(tidyverse)

set.seed(42)  # for reproducibility

# Define the box model
particle_box <- c(0, 1, 1, 2)

# Simulation settings
particles_per_minute <- 5 #sample size
n_minutes <- 10000

# Simulate sample means
particle_sample_means <- replicate(n_minutes, mean(sample(particle_box, particles_per_minute, replace = TRUE)))

# Convert to data frame for ggplot
df <- data.frame(particle_sample_mean = particle_sample_means)