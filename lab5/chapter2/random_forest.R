# Загружаем библиотеку
library(randomForest)

# Подготовка данных (у вас уже есть)
df_nb <- as.data.frame(num_data)
df_nb$cluster <- as.factor(groups)

# Разделение на обучающую и тестовую выборки
set.seed(123)
train_indices <- sample(1:nrow(df_nb), size = 0.8 * nrow(df_nb))
train_data <- df_nb[train_indices, ]
test_data <- df_nb[-train_indices, ]

# Обучение Random Forest
set.seed(123)
rf_model <- randomForest(cluster ~ ., 
                         data = train_data,
                         ntree = 500,        
                         mtry = sqrt(ncol(train_data) - 1),  
                         importance = TRUE,  
                         proximity = TRUE)   

# Вывод информации о модели
print(rf_model)

# Ошибка по деревьям
plot(rf_model, main = "Ошибка Random Forest")
legend("topright", legend = colnames(rf_model$err.rate), 
       col = 1:4, lty = 1, cex = 0.8)

