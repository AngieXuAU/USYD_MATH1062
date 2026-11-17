# two sample equal variance t test

u_x <- 48.2
u_y <- 43.5
n_x <- 12
n_y <- 14
s_x <- 4.1
s_y <- 4.4

pooled_stddev <- sqrt(((n_x - 1) * s_x^2 + (n_y - 1) * s_y^2) / (n_x + n_y - 2))
stderr <- pooled_stddev * sqrt(1 / n_x + 1 / n_y)
t <- (u_x - u_y) / stderr

p_val <- pt(t, df = n_x + n_y - 2, lower.tail = FALSE)
