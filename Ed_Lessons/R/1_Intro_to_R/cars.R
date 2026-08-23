head(mtcars)

dim(mtcars)
names(mtcars)

mtcars$wt
mtcars$qsec
horse_power <- mtcars$hp
mean(horse_power)

high_mpg_cars <- mtcars %>%
    filter(mpg > 25)
