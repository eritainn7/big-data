source('lab3/main.R')

read_eval_netherlands <- aggregate(read~year, data=student_data_netherlands, FUN=mean)
print(read_eval_netherlands)
math_eval_netherlands <- aggregate(math~year, data=student_data_netherlands, FUN=mean)
print(math_eval_netherlands)
science_eval_netherlands <- aggregate(science~year, data=student_data_netherlands, FUN=mean)
print(science_eval_netherlands)

par(mfrow=c(1, 2))

plot(read_eval_netherlands$year, read_eval_netherlands$read, type='b', xlim=c(2000, 2026), col='blue', pch=23, bg='green',
    main="Средние баллы PISA по годам - Нидерланды"
)
lines(math_eval_netherlands$year, math_eval_netherlands$math, type='b', col='red', pch=23, bg='green')
lines(science_eval_netherlands$year, science_eval_netherlands$science, type='b', col='purple', pch=23, bg='green')



last_year <- max(student_data_netherlands$year)
print(last_year)
data <- c(
    read_eval_netherlands$read[read_eval_netherlands$year == last_year],
    math_eval_netherlands$math[math_eval_netherlands$year == last_year],
    science_eval_netherlands$science[science_eval_netherlands$year == last_year]
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