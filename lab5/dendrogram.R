head(num_data)
dist.students <- dist(num_data)
clust.students <- hclust(dist.students, "ward.D")

data <- as.data.frame(num_data)
plot(clust.students, data$math, cex=0.5)
rect.hclust(clust.students, k=3, border = "red")

groups <- cutree(clust.students, k=3)
g1 <- colMeans(num_data[groups==1, 1:8])
g2 <- colMeans(num_data[groups==2, 1:8])
g3 <- colMeans(num_data[groups==3, 1:8])
df <- data.frame(g1, g2, g3)
matr_data <- as.matrix(df)
barplot(matr_data, col=rainbow(8))

barplot(matr_data, ylim=c(0,1),  
        main = "Группы студентов", axes = FALSE, 
        col=rainbow(8), beside=TRUE)
axis(2, at = 0:5, labels = 0:5)
legend("top", legend = rownames(df), col=c("red","green","blue","yellow"), lwd=10, bty = "n")

barplot(matr_data, ylim=c(-1, 1), main="Группы студентов", axes = FALSE, beside = TRUE)
axis(2, at=0:8, labels=0:8)

boxplot(matr_data, ylim=c(-1, 1), main="Группы студентов", axes = FALSE, beside = TRUE)
axis(2, at=0:8, labels=0:8)

# K-means
km <- kmeans(df_scaled, centers = 3, nstart = 25)

# Результаты
table(km$cluster)

