#9
count <- as.integer(readline("How elems in vector: "))
x <- scan(n=count)

if (sum(x - as.integer(x) != 0) > 0) {
  print("Only integer!")
  x <- NA
}
x
y <- c(
  x[x %% 2 == 0],
  x[x %% 3 == 0],
  x[x %% 4 == 0],
  x[x %% 5 == 0]
)
y <- unique(y)
print(length(y))

#24
