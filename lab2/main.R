data <- read.csv("/home/alex/kubsu/big-data/lab2/data.csv")
berrys <- names(data)[-1]
data <- data[,-1]
#1
print(colMeans(data, na.rm=TRUE))
print(sapply(data, max, na.rm=TRUE))
print(sapply(data, min, na.rm=TRUE))


#3
ratings <- colMeans(data, na.rm=TRUE)
print(sort(ratings, decreasing=TRUE))