source('lab3/main.R')

read_eval_israel <- aggregate(read~year, data=student_data_israel, FUN=mean)
print(read_eval_israel)
math_eval_israel <- aggregate(math~year, data=student_data_israel, FUN=mean)
print(math_eval_israel)
science_eval_israel <- aggregate(science~year, data=student_data_israel, FUN=mean)
print(science_eval_israel)

par(mfrow=c(1, 2))

plot(read_eval_israel$year, read_eval_israel$read, type='b', xlim=c(2000, 2026), col='blue', pch=23, bg='green',
    main="Средние баллы PISA по годам - Израиль"
)
lines(math_eval_israel$year, math_eval_israel$math, type='b', col='red', pch=23, bg='green')
lines(science_eval_israel$year, science_eval_israel$science, type='b', col='purple', pch=23, bg='green')



last_year <- max(student_data_israel$year)
print(last_year)
data <- c(
    read_eval_israel$read[read_eval_israel$year == last_year],
    math_eval_israel$math[math_eval_israel$year == last_year],
    science_eval_israel$science[science_eval_israel$year == last_year]
)
barplot(data, xlab=last_year, 
    col=c('blue', 'red', 'purple'),
    cex.lab = 4,
)

legend("topleft", 
        legend = c("Чтение", "Математика", "Наука"),
        fill = c("blue", "red", "purple"),
        title = "Дисциплины",
        xpd=TRUE,
        cex = 2,
        bty = "n"
    )