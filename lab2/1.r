source('lab2/main.R')

means <- colMeans(data, na.rm=TRUE)
max <- sapply(data, max, na.rm=TRUE)
min <- sapply(data, min, na.rm=TRUE)

print(means)
print(max)
print(min)

colors <- c("pink", "red", rgb(0.112, 0.012, 0.012), rgb(0.247, 0.011, 0.011), 
            rgb(0.003, 0.034, 0.1), rgb(0.161, 0.158, 0.012), rgb(0.05, 0.138, 0.238), 
            rgb(0.053, 0.241, 0.006), rgb(0.236, 0.099, 0.008), rgb(0.182, 0.057, 0.057))


par(mfrow=c(1, 2))
barplot(means, col=colors, names=berrys, main="Средние оценки/Рейтинг")
hist(means, main="Встречаемость оценок")
