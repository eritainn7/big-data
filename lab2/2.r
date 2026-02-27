source('lab2/main.R')

counts_people_with_every_berry_eval_great7 <- c()
counts_people_with_every_berry_eval_less3 <- c()
for (name_berry in names(data)) {
    berry_data <- na.omit(data[name_berry])

    count_people <- length(berry_data[berry_data > 7])
    counts_people_with_every_berry_eval_great7 <- c(counts_people_with_every_berry_eval_great7, count_people)

    count_people <- length(berry_data[berry_data < 3])
    counts_people_with_every_berry_eval_less3 <- c(counts_people_with_every_berry_eval_less3, count_people)
}

names(counts_people_with_every_berry_eval_great7) <- names(data)
print("Количество оценок больше 7")
print(counts_people_with_every_berry_eval_great7)

names(counts_people_with_every_berry_eval_less3) <- names(data)
print("Количество оценок меньше 3")
print(counts_people_with_every_berry_eval_less3)