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

# let's just use two approaches anyway... METHOD 1:
# test-statistic:
nh <- 5
mu <- mean(ai_sentiment)
stddev <- sd (ai_sentiment)
n <- length(ai_sentiment)

t_stat <- (mu - nh) / (stddev / sqrt(n))
t_stat

# p-value:
p_val <- 2 * pt(t_stat, df = n - 1, lower.tail = FALSE)
p_val 

# conclusion:
# above 0.05, so accept the null hypothesis