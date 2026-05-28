library(scatterplot3d)

s3d <- scatterplot3d(num_data[,c(1, 4, 5)], main= "Студенты", pch = 16, color=c('red', 'green', 'blue')[groups])

s3d <- scatterplot3d(num_data[,c(1, 6, 4)], main= "Студенты", pch = 16, color=c('red', 'green', 'blue')[groups], angle = 45)

s3d <- scatterplot3d(num_data[,c(1, 4, 8)], main= "Студенты", pch = 16, color=c('red', 'green', 'blue')[groups])


