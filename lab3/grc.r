source('lab3/main.R')

read_eval_greece <- aggregate(read~year, data=student_data_greece, FUN=mean)
print(read_eval_greece)
math_eval_greece <- aggregate(math~year, data=student_data_greece, FUN=mean)
print(math_eval_greece)
science_eval_greece <- aggregate(science~year, data=student_data_greece, FUN=mean)
print(science_eval_greece)

par(mfrow=c(1, 2))

plot(read_eval_greece$year, read_eval_greece$read, type='b', xlim=c(2000, 2026), col='blue', pch=23, bg='green',
    main="Средние баллы PISA по годам - Греция"
)
lines(math_eval_greece$year, math_eval_greece$math, type='b', col='red', pch=23, bg='green')
lines(science_eval_greece$year, science_eval_greece$science, type='b', col='purple', pch=23, bg='green')



last_year <- max(student_data_greece$year)
print(last_year)
data <- c(
    read_eval_greece$read[read_eval_greece$year == last_year],
    math_eval_greece$math[math_eval_greece$year == last_year],
    science_eval_greece$science[science_eval_greece$year == last_year]
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