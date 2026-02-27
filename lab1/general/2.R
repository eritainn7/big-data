v <- 1:20
v[v %% 2 != 0] <- 0
print(v)

v <- 0:19
v <- 2 ^ v
print(v)

v <- 10 ^ (0:4)
print(v)