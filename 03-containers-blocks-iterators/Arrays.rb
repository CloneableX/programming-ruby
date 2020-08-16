a = [3.14159, "pie", 99]
puts a.class
puts a.length
puts a[0]
puts a[1]
puts a[2]
puts a[3]
puts

b = Array.new
puts b.class
puts b.length
puts b[0] = "second"
puts b[1] = "array"
puts b
puts

a = [1, 3, 5, 7, 9]
puts a[-1]
puts a[-2]
puts a[-99]
puts

puts a[1, 3]
puts
puts a[3, 1]
puts
puts a[-3, 2]
puts

b = a[1, 3]
b[0] = "change"
puts b
puts
puts a
puts

puts a[1..3]
puts
puts a[1...3]
puts
puts a[3..3]
puts
puts a[-3..-1]
puts

a = [1, 3, 5, 7, 9]
a[1] = 'bat'
puts a
puts
a[-3] = 'cat'
puts a
puts
a[3] = [9, 8]
puts a
puts
a[6] = 99
puts a
puts

a = [1, 3, 5, 7, 9]
a[2, 2] = 'cat'
puts a
puts
a[2, 0] = 'dog'
puts a
puts
a[1, 1] = [9, 8, 7]
puts a
puts
a[0..3] = []
puts a
puts
a[5] = 99
puts a
puts
