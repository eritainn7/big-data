buildPlot <- function(country_df, years, name) {
  plot(years, country_df$Quality.of.Life.Index, type='l', xlim=c(2014, 2026), col='red', ylim=c(10, 225), xlab="Годы", ylab="Индексы", main=name)
  lines(years, country_df$Purchasing.Power.Index, col='green')
  lines(years, country_df$Safety.Index, col='orange')
  lines(years, country_df$Health.Care.Index, col='pink')
  lines(years, country_df$Cost.of.Living.Index, col='purple')
  lines(years, country_df$Property.Price.to.Income.Ratio, col='yellow')
  lines(years, country_df$Traffic.Commute.Time.Index, col='brown')
  lines(years, country_df$Pollution.Index, col='blue')
  lines(years, country_df$Climate.Index, col=rgb(0.100, 0.50, 0.70))
  
  # legend("top", legend = names(country_df)[c(-1, -2)], 
  #        cex = 0.7, 
  #        fill=c("red", "green", "orange", "pink", 'purple', 'yellow', 'brown', 'blue', rgb(0.100, 0.50, 0.70)))
}

georgia_data <- read.csv(file="~/kubsu/big-data/lab4/data/Georgia/aggregate.csv")
greece_data <- read.csv(file="~/kubsu/big-data/lab4/data/Greece/aggregate.csv")
israel_data <- read.csv(file="~/kubsu/big-data/lab4/data/Israel/aggregate.csv")
netherlands_data <- read.csv(file="~/kubsu/big-data/lab4/data/Netherlands/aggregate.csv")
ukraine_data <- read.csv(file="~/kubsu/big-data/lab4/data/Ukraine/aggregate.csv") 

par(mfrow = c(2, 3))

buildPlot(georgia_data, c(2015, 2019:2026), "Грузия")
buildPlot(greece_data, 2014:2026, "Греция")
buildPlot(israel_data, 2014:2026, "Израиль")
buildPlot(netherlands_data, 2014:2026, "Нидерланды")
buildPlot(ukraine_data, 2014:2026, "Украина")

plot(2014, xaxt = "n", yaxt = "n", xlab='', ylab='')
legend("top", legend = names(georgia_data)[c(-1, -2)],
       cex = 1,
       fill=c("red", "green", "orange", "pink", 'purple', 'yellow', 'brown', 'blue', rgb(0.100, 0.50, 0.70)))
par(mfrow = c(1, 1))
