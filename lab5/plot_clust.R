# Центры кластеров в исходных единицах
centers_original <- as.data.frame(
  t(apply(km$centers, 1, function(x) {
    x * attr(df_scaled, "scaled:scale") + attr(df_scaled, "scaled:center")
  }))
)
print("Центры кластеров:")
print(centers_original)

pca <- prcomp(df_scaled)
plot(pca$x[,1], pca$x[,2], col = km$cluster, 
     pch = 19, main = "K-means кластеры",
     xlab = "PC1", ylab = "PC2")
legend("topright", legend = unique(km$cluster), col = unique(km$cluster), pch = 19)

fviz_cluster(km, num_data, ellipse.type = "norm")
