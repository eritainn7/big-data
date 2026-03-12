source('lab3/gender_analys.r')

par(mfrow=c(1, 2))
hist(student_data_female$math, main="Оценки женщин по математике", col="pink")
hist(student_data_male$math, main="Оценки мужчин по математике", col="lightblue")