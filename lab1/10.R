count <- as.integer(readline("How elems in vector: "))
x <- scan(n=count)

if (sum(x - as.integer(x) != 0) > 0) {
  print("Only integer!")
  # x <- NA
}

if ((sum(x > 100) > 0) || (sum(x < 1) > 0)) {
  print("Onlu nums with [1; 100]")
}

print(x)
y <- c(
  x[x %% 2 == 0],
  x[x %% 3 == 0],
  x[x %% 4 == 0],
  x[x %% 5 == 0]
)
y <- unique(y)
print(length(y))
