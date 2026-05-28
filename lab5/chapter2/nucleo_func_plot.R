library(klaR)

# ============================================
# ВИЗУАЛИЗАЦИЯ ПЛОТНОСТЕЙ
variables <- names(train_data)[names(train_data) != "cluster"]

nb_vis <- NaiveBayes(cluster ~ ., data = train_data, usekernel = TRUE)

# Графики плотностей
par(mfrow = c(2, 4), mar = c(4, 4, 3, 2))

for(i in 1:length(variables)) {
  var_name <- variables[i]
  densities <- nb_vis$tables[[var_name]]
  
  # Диапазон значений для переменной
  x_range <- seq(min(train_data[, var_name]), max(train_data[, var_name]), length = 100)
  
  max_density <- 0
  for(k in 1:length(densities)) {
    if(is.list(densities[[k]])) {
      dens <- density(densities[[k]]$x)
      max_density <- max(max_density, max(dens$y))
    } else {
      dens_vals <- dnorm(x_range, densities[[k]]$mean, densities[[k]]$sd)
      max_density <- max(max_density, max(dens_vals))
    }
  }
  
  plot(x_range, rep(0, length(x_range)), type = "n",
       main = var_name, xlab = var_name, ylab = "Плотность",
       ylim = c(0, max_density * 1.1))
  
  colors <- c("red", "green3", "blue")
  for(k in 1:length(densities)) {
    if(is.list(densities[[k]])) {
      
      dens <- density(densities[[k]]$x)
      lines(dens, col = colors[k], lwd = 2)
      
      polygon(c(dens$x, rev(dens$x)), 
              c(dens$y, rep(0, length(dens$y))), 
              col = adjustcolor(colors[k], alpha.f = 0.2), 
              border = NA)
    } else {
     
      y_vals <- dnorm(x_range, densities[[k]]$mean, densities[[k]]$sd)
      lines(x_range, y_vals, col = colors[k], lwd = 2)
      polygon(c(x_range, rev(x_range)), 
              c(y_vals, rep(0, length(y_vals))), 
              col = adjustcolor(colors[k], alpha.f = 0.2), 
              border = NA)
    }
  }
  
 
  if(i == 1) {
    legend("topright", legend = paste("Кластер", 1:3), 
           col = colors, lwd = 2, cex = 0.7, fill = adjustcolor(colors, alpha.f = 0.2))
  }
}

par(mfrow = c(1, 1))

