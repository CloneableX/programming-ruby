a = 1
b = 2
puts a, b
a, b = b, a
puts a, b
puts

x = 0
a, b, c = x, (x += 1), (x += 1)
puts a, b, c
puts

a = [1, 2, 3, 4]
b, c = a
print b, ' ', c, "\n"
b, *c = a
print b, ' ', c, "\n"
b, c = 99, a
print b, ' ', c, "\n"
b, *c = 99, a
print b, ' ', c, "\n"
b, c = 99, *a
print b, ' ', c, "\n"
b, *c = 99, *a
print b, ' ', c, "\n"

b, (c, d), e = 1, 2, 3, 4
print b, ' ', c, ' ', d, ' ', e, "\n"
b, (c, d), e = [1, 2, 3, 4]
print b, ' ', c, ' ', d, ' ', e, "\n"
b, (c, d), e = 1, [2, 3], 4
print b, ' ', c, ' ', d, ' ', e, "\n"
b, (c, d), e = 1, [2, 3, 4], 5
print b, ' ', c, ' ', d, ' ', e, "\n"
b, (c, *d), e = 1, [2, 3, 4], 5
print b, ' ', c, ' ', d, ' ', e, "\n"
