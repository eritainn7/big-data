source("lab2_2/main.r")

with(data, {
    par(mfrow=c(2, 5))

    hist(Малина, col="pink")
    hist(Клубника, col="red")
    hist(Вишня, col="orange")
    hist(Черешня, col="green")
    hist(Смородина, col="yellow")

    hist(Ежевика, col="purple")
    hist(Голубика, col="blue")
    hist(Арбуз, col="darkgreen")
    hist(Клюква, col="gold")
    hist(Кизил, col="brown")
    par(mfrow=c(1,1))
})

