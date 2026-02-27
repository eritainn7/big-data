#24
x1 <- scan(n=1)
y1 <- scan(n=1)

x2 <- scan(n=1)
y2 <- scan(n=1)

n <- readline("Count points: ")

plot(c(x1, x2), c(y1, y1), type="l", col="red", xlim=c(x1, x2), ylim=c(y1, y2))
lines(c(x1, x2), c(y2, y2), col="red")
lines(c(x1, x1), c(y1, y2), col="red")
lines(c(x2, x2), c(y1, y2), col="red")

x_coords <- runif(n,  min(x1, x2), max(x1, x2))
y_coords <- runif(n, min(y1, y2), max(y1, y2))

coords <- matrix(data = c(x_coords, y_coords), nrow = length(x_coords), ncol = 2)
points(coords)
print(coords)