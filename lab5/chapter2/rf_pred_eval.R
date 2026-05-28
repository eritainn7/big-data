# Предсказание на тестовых данных
predictions_rf <- predict(rf_model, newdata = test_data)

# Матрица ошибок
conf_matrix_rf <- table(Actual = test_data$cluster, Predicted = predictions_rf)
print("Матрица ошибок (Random Forest):")
print(conf_matrix_rf)

# Точность
accuracy_rf <- sum(diag(conf_matrix_rf)) / sum(conf_matrix_rf)
cat("Точность модели Random Forest:", round(accuracy_rf * 100, 2), "%\n")

# Метрики по каждому классу
precision_rf <- diag(conf_matrix_rf) / colSums(conf_matrix_rf)
recall_rf <- diag(conf_matrix_rf) / rowSums(conf_matrix_rf)
f1_rf <- 2 * precision_rf * recall_rf / (precision_rf + recall_rf)

metrics_rf <- data.frame(
  Класс = levels(test_data$cluster),
  Точность = round(precision_rf, 3),
  Полнота = round(recall_rf, 3),
  F1 = round(f1_rf, 3)
)
print("Метрики по классам (Random Forest):")
print(metrics_rf)

# Вероятности классов
prob_predictions <- predict(rf_model, newdata = test_data, type = "prob")
head(prob_predictions)
