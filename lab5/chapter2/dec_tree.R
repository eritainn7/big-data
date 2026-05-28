library(party)

df_nb <- as.data.frame(num_data)
df_nb$cluster <- as.factor(groups)

set.seed(123)
train_indices <- sample(1:nrow(df_nb), size = 0.8 * nrow(df_nb))
train_data <- df_nb[train_indices, ]
test_data <- df_nb[-train_indices, ]

tree_model <- ctree(cluster ~ ., data = train_data)

print(tree_model)

plot(tree_model, type = "simple", main = "Дерево решений для классификации студентов")

plot(tree_model, main = " дерево решений")
