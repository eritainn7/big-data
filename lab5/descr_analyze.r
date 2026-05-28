pairs(num_data)

pairs(num_data, main= "Студенты", col = c("red","green","blue"))

my_cols <- c("#00AFBB", "#E7B800", "#FC4E07")  
pairs(num_data, main= "Студенты по 'сортам'",pch = 19,  cex = 0.8,
      col = my_cols[iris$Species],
      lower.panel=NULL)
