market_days <- c("U", "D", "U", "U", "D", "C", "D", "U", "D", "C")

today_is_down <- (market_days[-length(market_days)] == "D")
next_days <- market_days[-1][today_is_down]

mean(next_days == "U")
