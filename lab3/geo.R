source('lab3/main.R')

read_eval_geo <- aggregate(read~year, data=student_data_georgia, FUN=mean)
print(read_eval_geo)
math_eval_geo <- aggregate(math~year, data=student_data_georgia, FUN=mean)
print(math_eval_geo)
science_eval_geo <- aggregate(science~year, data=student_data_georgia, FUN=mean)
print(science_eval_geo)

par(mfrow=c(1, 2))

plot(read_eval_geo$year, read_eval_geo$read, type='b', xlim=c(2000, 2026), ylim=c(370, 420), col='blue', pch=23, bg='green',
    main="Средние баллы PISA по годам - Грузия"
)
lines(math_eval_geo$year, math_eval_geo$math, type='b', col='red', pch=23, bg='green')
lines(science_eval_geo$year, science_eval_geo$science, type='b', col='purple', pch=23, bg='green')



last_year <- max(student_data_georgia$year)
print(last_year)
data <- c(
    read_eval_geo$read[read_eval_geo$year == last_year],
    math_eval_geo$math[math_eval_geo$year == last_year],
    science_eval_geo$science[science_eval_geo$year == last_year]
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
