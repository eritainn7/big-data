# Предсказание на тестовых данных
predictions_tree <- predict(tree_model, newdata = test_data)

# Матрица ошибок
conf_matrix_tree <- table(Actual = test_data$cluster, Predicted = predictions_tree)
print("Матрица ошибок (Decision Tree):")
print(conf_matrix_tree)

# Точность
accuracy_tree <- sum(diag(conf_matrix_tree)) / sum(conf_matrix_tree)
cat("Точность модели Decision Tree:", round(accuracy_tree * 100, 2), "%\n")

# Метрики по каждому классу
precision_tree <- diag(conf_matrix_tree) / colSums(conf_matrix_tree)
recall_tree <- diag(conf_matrix_tree) / rowSums(conf_matrix_tree)
f1_tree <- 2 * precision_tree * recall_tree / (precision_tree + recall_tree)

metrics_tree <- data.frame(
  Класс = levels(test_data$cluster),
  Точность = round(precision_tree, 3),
  Полнота = round(recall_tree, 3),
  F1 = round(f1_tree, 3)
)
print("Метрики по классам (Decision Tree):")
print(metrics_tree)
