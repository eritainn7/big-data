#1
p <- 7:4
print(p)
q <- 0:3 
print(q)

print(p + q)
print(p - q)
print(p * q)
print(p / q)
print(p ^ q)

#2
v <- 1:20
v[v %% 2 != 0] <- 0
print(v)

v <- 0:19
v <- 2 ^ v
print(v)

v <- 10 ^ (0:4)
print(v)

#3
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

#4
vec3 <- seq(from=3, to=27, by=3)
print(vec3[c(2, 5, 7)])
print(vec3[length(vec3) - 1])
print(vec3[-length(vec3) + 1])
print(vec3[-6])
print(vec3[100])
print(vec3[-c(1, length(vec3))])
print(vec3[(4 < vec3) & (10 > vec3)])
print(vec3[vec3 < 4 | vec3 > 10])
  



