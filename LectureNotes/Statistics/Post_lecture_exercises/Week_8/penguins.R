# metal tag: 12.7 mean, 344 penguins, sd = 3.71
# electronic tag: 11.6 mean, 512 penguins, sd = 4.53
# normally distributed

# mean foraging trips longer if metal tag?

# assumptions
# - normally distributed
# - known standard deviation
# - CLT can be assumed due to large sample size
# - close sample sd -> assume equal population variance
# **choose equal variance t-test**

xm = 12.7
m = 344
sdm = 3.71

xe = 11.6
e = 512
sde = 4.53

sdp = sqrt(((m - 1) * sdm ^ 2 + (e - 1) * sde ^ 2) / (m + e - 2))
sdp

t_value <- (xm - xe) / (sdp * sqrt(1 / m + 1 / e))
t_value

p_value <- pt(t_value, lower.tail = FALSE, df = m + e - 2)
p_value

q <- qt(0.975, m + e- 2) * sdp * sqrt(1 / m + 1 / e)
xm - xe - q
xm - xe + q