source('lab2/main.R')

ratings <- colMeans(data, na.rm=TRUE)
print(sort(ratings, decreasing=TRUE))
