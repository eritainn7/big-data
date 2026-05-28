df <- read.csv("~/kubsu/big-data/lab5/student_data.csv", stringsAsFactors = FALSE)

# Функция для преобразования колонок с "3+"
convert_to_numeric <- function(x) {
  x <- as.character(x)
  x[x == "3+"] <- "3"
  return(as.numeric(x))
}

# Создаем числовой датафрейм
df_numeric <- data.frame(
  math = df$math,
  read = df$read,
  science = df$science,
  wealth = df$wealth,
  escs = df$escs,
  stu_wgt = df$stu_wgt,
  computer_n = convert_to_numeric(df$computer_n),
  car = convert_to_numeric(df$car)
)

# Проверяем структуру
str(df_numeric)

# Заменяем NA медианой
df_imputed <- as.data.frame(lapply(df_numeric, function(x) {
  x[is.na(x)] <- median(x, na.rm = TRUE)
  return(x)
}))

# Проверяем, что NA нет
sum(is.na(df_imputed))

# Стандартизация
df_scaled <- scale(df_imputed)

# K-means
set.seed(123)
km <- kmeans(df_scaled, centers = 3, nstart = 25)

# Результаты
table(km$cluster)
