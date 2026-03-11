source("lab2_2/main.r")

with(data, {
    # Поиск медианы
    mediana <- c()
    var_seq <- sort(Вишня)
    if (length(var_seq) %% 2 == 0) {
        mediana <- (var_seq[length(var_seq)/2] + var_seq[length(var_seq)/2 + 1])/2
    } else {
        mediana <- var_seq[round(length(var_seq)/2)]
    }


    colors <- c()
    for (evaluate in Вишня) {
        if (evaluate == max(Вишня)) {
            colors <- c(colors, "red")
        }
        else if (evaluate == mean(Вишня)) {
            colors <- c(colors, "black")
        } 
        else if (evaluate == mediana) {
            colors <- c(colors, "blue")
        }
        else {
            colors <- c(colors, "gray")
        }
    }

    barplot(Вишня, col=colors)
})