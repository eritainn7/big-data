# Сравнение моделей
comparison <- data.frame(
  Модель = c("Naive Bayes", "Decision Tree", "Random Forest"),
  Точность = c(accuracy, accuracy_tree, accuracy_rf)
)

print(comparison)

# Визуальное сравнение
library(ggplot2)
ggplot(comparison, aes(x = Модель, y = Точность, fill = Модель)) +
  geom_bar(stat = "identity", width = 0.6) +
  geom_text(aes(label = paste0(round(Точность * 100, 1), "%")), 
            vjust = -0.5, size = 5) +
  theme_minimal() +
  labs(title = "Сравнение точности моделей",
       x = "Модель",
       y = "Точность") +
  ylim(0, 1) +
  scale_fill_manual(values = c("Naive Bayes" = "lightblue", 
                               "Decision Tree" = "lightgreen", 
                               "Random Forest" = "salmon"))
