source('lab3/main.R')

read_eval_qatar <- aggregate(read~year, data=student_data_qatar, FUN=mean)
print(read_eval_qatar)
math_eval_qatar <- aggregate(math~year, data=student_data_qatar, FUN=mean)
print(math_eval_qatar)
science_eval_qatar <- aggregate(science~year, data=student_data_qatar, FUN=mean)
print(science_eval_qatar)

par(mfrow=c(1, 2))

plot(read_eval_qatar$year, read_eval_qatar$read, type='b', xlim=c(2000, 2026), col='blue', pch=23, bg='green',
    main="Средние баллы PISA по годам - Катар"
)
lines(math_eval_qatar$year, math_eval_qatar$math, type='b', col='red', pch=23, bg='green')
lines(science_eval_qatar$year, science_eval_qatar$science, type='b', col='purple', pch=23, bg='green')



last_year <- max(student_data_qatar$year)
print(last_year)
data <- c(
    read_eval_qatar$read[read_eval_qatar$year == last_year],
    math_eval_qatar$math[math_eval_qatar$year == last_year],
    science_eval_qatar$science[science_eval_qatar$year == last_year]
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