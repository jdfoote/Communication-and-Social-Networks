# Change the seed if you really want it to be diff each year
set.seed(2022)
cards <- c(1:10, 6, 8)

r1 <- sample(cards, length(cards), replace=F)
print(r1)

r2 <- sample(cards, length(cards), replace=F)
print(r2)

r3 <- sample(cards, length(cards), replace=F)
print(r3)
