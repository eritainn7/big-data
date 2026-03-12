source('lab3/main.R')

read_eval_jordan <- aggregate(read~year, data=student_data_jordan, FUN=mean)
read_eval_geo <- aggregate(read~year, data=student_data_georgia, FUN=mean)
read_eval_greece <- aggregate(read~year, data=student_data_greece, FUN=mean)
read_eval_israel <- aggregate(read~year, data=student_data_israel, FUN=mean)
read_eval_netherlands <- aggregate(read~year, data=student_data_netherlands, FUN=mean)
read_eval_qatar <- aggregate(read~year, data=student_data_qatar, FUN=mean)
read_eval_ukr <- aggregate(read~year, data=student_data_ukr, FUN=mean)

plot(read_eval_ukr$year, read_eval_ukr$read, type='b', xlim=c(2000, 2026), col='blue', pch=23, bg='black',
    main="Средние баллы по математике"
)

legend("top", 
        legend = c("Украина", "Грузия", "Греция", "Израиль", "Нидерланды", "Катар", "Иородания"),
        fill = c("blue", "red", "purple", "orange", "cyan", "lightgreen", "yellow"),
        title = "Изменение оценок мо математике",
        xpd=TRUE,
        cex = 1.5,
        bty = "n",
    )

lines(read_eval_geo$year, read_eval_geo$read, type='b', xlim=c(2000, 2026), col='red', pch=23, bg='green')
lines(read_eval_greece$year, read_eval_greece$read, type='b', xlim=c(2000, 2026), col='purple', pch=23, bg='green')
lines(read_eval_israel$year, read_eval_israel$read, type='b', xlim=c(2000, 2026), col='orange', pch=23, bg='green')
lines(read_eval_netherlands$year, read_eval_netherlands$read, type='b', xlim=c(2000, 2026), col='cyan', pch=23, bg='green')
lines(read_eval_qatar$year, read_eval_qatar$read, type='b', xlim=c(2000, 2026), col='lightgreen', pch=23, bg='green')
lines(read_eval_jordan$year, read_eval_jordan$read, type='b', xlim=c(2000, 2026), col='yellow', pch=23, bg='brown')
