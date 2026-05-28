set.seed(123)

library(factoextra)
num_data <- df_scaled[sample(1:nrow(df_scaled)), ]
# метод локтя
fviz_nbclust(num_data, 
             kmeans, 
             method = "wss",
             k.max = 8,      
             nstart = 3,     
             verbose = FALSE)

#метод силуэта
fviz_nbclust(num_data, 
             kmeans, 
             method = "silhouette",
             k.max = 8,      
             nstart = 3,     
             verbose = FALSE)

#метод статистики разрыва
library(cluster)
gap_stat <- clusGap(num_data, FUN=kmeans, nstart=3, K.max=6, B = 100)
fviz_gap_stat(gap_stat)

library(parameters)
library(NbClust)
library(mclust)

n_clust <- n_clusters(num_data, package = c("easystats", "NbClust", "mclust"), standardize = FALSE)
plot(n_clust)

