source('lab3/main.R')

read_eval_ukr <- aggregate(read~year, data=student_data_ukr, FUN=mean)
print(read_eval_ukr)
math_eval_ukr <- aggregate(math~year, data=student_data_ukr, FUN=mean)
print(math_eval_ukr)
science_eval_ukr <- aggregate(science~year, data=student_data_ukr, FUN=mean)
print(science_eval_ukr)

par(mfrow=c(1, 2))

plot(read_eval_ukr$year, read_eval_ukr$read, type='b', xlim=c(2000, 2026), col='blue', pch=23, bg='green',
    main="Средние баллы PISA по годам - Украина"
)
lines(math_eval_ukr$year, math_eval_ukr$math, type='b', col='red', pch=23, bg='green')
lines(science_eval_ukr$year, science_eval_ukr$science, type='b', col='purple', pch=23, bg='green')



last_year <- max(student_data_ukr$year)
print(last_year)
data <- c(
    read_eval_ukr$read[read_eval_ukr$year == last_year],
    math_eval_ukr$math[math_eval_ukr$year == last_year],
    science_eval_ukr$science[science_eval_ukr$year == last_year]
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