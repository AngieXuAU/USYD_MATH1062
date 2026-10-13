ai_sentiment = c(rep(2,6), rep(3,3), rep(4,3),
rep(5,5), rep(6,4), rep(7,6),
rep(8,7), rep(9,1), rep(10,3))

# HATPC: hypothesis, assumptions, test-statistic, p-value, conclusion

# hypothesis:
# test the claim that mean student sentiment to LT aimpact of AI is
# mu = 5 at alpha = 0.05 significance level

# assumptions:
# underlying data is normally distributed
# to check this assumption ~
boxplot(ai_sentiment) # looks symmetric enough
qqnorm(ai_sentiment)
qqline(ai_sentiment, col = "red") # I don't think a traditional t-test should be used

# bootstrap method:
nh <- 5
mu <- mean(ai_sentiment)
stddev <- sd (ai_sentiment)

set.seed(123)

t_stars <- 0
x_bar <- mean(ai_sentiment)
n <- length(ai_sentiment)

for(i in 1:10000){
  # Your code here, for each iteration i, take a bootstrap sample, compute the bootstrap t-statistic and add it to t_stars  
  bs_sample <- sample(ai_sentiment, n, replace = TRUE)
  bs_mean <- mean(bs_sample)
  bs_sd <- sd(bs_sample)

  t_stars[i] <- (bs_mean - mu) / (bs_sd / sqrt(n))
}

bootstrap_dist <- data.frame(t_star = t_stars)

library(ggplot2)
ggplot(bootstrap_dist, aes(x=t_star)) +
  geom_histogram(fill="skyblue", color="pink") +
  labs(title="Bootstrap-t distribution", x="t*") +
  theme_minimal()


# test-statistic
t_obs <- (mu - nh) / (stddev / sqrt(n))
p_val <- mean(abs(t_stars) >= abs(t_obs))
p_val

p_val2 <- 2 * mean(t_stars >= t_obs) # this value matches confidence interval
p_val2

# alternately, using the confidence interval:
# determine the l and u multipliers in the bootstrap-t distribution
u <- quantile(t_stars, prob = c(.975))
l <- quantile(t_stars, prob = c(.025))

# bootstrap confidence interval - not related to the test statistic 
ci <- mu - c(u, l) * stddev / sqrt(n)
names(ci) <- c("Lower", "Upper")
ci