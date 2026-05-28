library(klaR)

df_nb <- as.data.frame(num_data)

df_nb$cluster <- as.factor(groups)

table(df_nb$cluster)

# Разделяем на обучающую и тестовую выборки (80/20)
set.seed(123)
train_indices <- sample(1:nrow(df_nb), size = 0.8 * nrow(df_nb))
train_data <- df_nb[train_indices, ]
test_data <- df_nb[-train_indices, ]

X_train <- train_data[, -which(names(train_data) == "cluster")]
y_train <- train_data$cluster
X_test <- test_data[, -which(names(test_data) == "cluster")]
y_test <- test_data$cluster


nb_model <- NaiveBayes(cluster ~ ., data = train_data)
print(nb_model)

# Априорные вероятности
print("Априорные вероятности:")
print(nb_model$apriori)

# Параметры распределений
print("Средние и дисперсии по признакам:")
print(nb_model$tables)


#_____________________________________
# Предсказание на тестовых данных
predictions <- predict(nb_model, newdata = X_test)

# Результаты предсказания
head(predictions$class)  
head(predictions$posterior)

# Матрица ошибок (confusion matrix)
conf_matrix <- table(Actual = y_test, Predicted = predictions$class)
print("Матрица ошибок:")
print(conf_matrix)

# Точность
accuracy <- sum(diag(conf_matrix)) / sum(conf_matrix)
cat("Точность модели:", round(accuracy * 100, 2), "%\n")

# Ошибка
error_rate <- 1 - accuracy
cat("Ошибка:", round(error_rate * 100, 2), "%\n")

