source('lab3/main.R')

read_eval_jordan <- aggregate(read~year, data=student_data_jordan, FUN=mean)
print(read_eval_jordan)
math_eval_jordan <- aggregate(math~year, data=student_data_jordan, FUN=mean)
print(math_eval_jordan)
science_eval_jordan <- aggregate(science~year, data=student_data_jordan, FUN=mean)
print(science_eval_jordan)

par(mfrow=c(1, 2))

plot(read_eval_jordan$year, read_eval_jordan$read, type='b', xlim=c(2000, 2026), col='blue', pch=23, bg='green',
    main="Средние баллы PISA по годам - Иордания"
)
lines(math_eval_jordan$year, math_eval_jordan$math, type='b', col='red', pch=23, bg='green')
lines(science_eval_jordan$year, science_eval_jordan$science, type='b', col='purple', pch=23, bg='green')



last_year <- max(student_data_jordan$year)
print(last_year)
data <- c(
    read_eval_jordan$read[read_eval_jordan$year == last_year],
    math_eval_jordan$math[math_eval_jordan$year == last_year],
    science_eval_jordan$science[science_eval_jordan$year == last_year]
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