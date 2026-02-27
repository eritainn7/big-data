a <- 1 / (1:50)
b <- 1 / (2:51)
print(sum(a * b))

print(sum(2 ^ -(0:20)))

a <- 1:28
a <- a[a %% 3 == 1]

b <- 0:9
b <- 3 ^ b

print(sum(a/b))
x <- a/b
print(sum(x > 0.5))