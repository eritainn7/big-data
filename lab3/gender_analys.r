source('lab3/main.R')

print(unique(student_data$gender))

student_data_female <- na.omit(student_data[student_data$gender == "female",])
student_data_male <- na.omit(student_data[student_data$gender == "male",])

female_read <- aggregate(read~year, data=student_data_female, FUN=mean)
print(female_read)

female_math <- aggregate(math~year, data=student_data_female, FUN=mean)
print(female_math)

female_science <- aggregate(science~year, data=student_data_female, FUN=mean)
print(female_science)

par(mfrow=c(2, 3))

pie_female_2006 <- c(482.3744, 454.2525, 479.8016)
pie(pie_female_2006, col=c("blue", "red", "purple"), main="Средние оценки по дисциплинам.\nЖенщины", cex.main=2, labels=NA)

legend("top", 
        legend = c("Чтение", "Математика", "Наука"),
        fill = c("blue", "red", "purple"),
        title = "Дисциплины",
        xpd=TRUE,
        cex = 2,
        bty = "n",
    )

pie_female_2009 <- c(484.7753, 446.1374, 466.3192)
pie(pie_female_2009, col=c("blue", "red", "purple"), labels=NA)

pie_female_2012 <- c(483.1017, 444.4243, 467.9812)
pie(pie_female_2012, col=c("blue", "red", "purple"), labels=NA)

barplot(pie_female_2006, col=c("blue", "red", "purple"), xlab=2006, cex.lab=5)
barplot(pie_female_2009, col=c("blue", "red", "purple"), xlab=2009, cex.lab=5)
barplot(pie_female_2012, col=c("blue", "red", "purple"), xlab=2012, cex.lab=5)


