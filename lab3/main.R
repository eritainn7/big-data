# install.packages("~/R_libs/learningtower_1.1.0.tar.gz", lib = "~/R_libs", repos = NULL, type = "source")
library("learningtower", lib="~/R_libs")

if (file.exists("lab3/student_data.csv") == FALSE) {
    student_data <- load_student("all")
    write.csv(subset(student_data, country==c('UKR', 'GEO', 'GRC', 'JOR', 'QAR', 'ISR', 'NLD')), 
        file = "lab3/student_data.csv", append = FALSE, quote = TRUE, sep = " ")
}
student_data <- read.csv("lab3/student_data.csv")

student_data_ukr <- subset(student_data, country=='UKR')
student_data_georgia <- subset(student_data, country=='GEO')
student_data_greece <- subset(student_data, country=='GRC')
student_data_jordan <- subset(student_data, country=='JOR')
student_data_qatar <- subset(student_data, country=='QAR')
student_data_israel <- subset(student_data, country=='ISR')
student_data_netherlands <- subset(student_data, country=='NLD')


