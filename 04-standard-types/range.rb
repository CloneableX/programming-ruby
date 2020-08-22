puts (1..10).to_a
puts ('bar'..'bat').to_a
puts

digits = 0..9
puts digits.include?(5)
puts digits.min
puts digits.max
puts digits.reject {|i| i < 5}
puts

puts (1..10) === 5
puts (1..10) === 15
puts (1..10) === 3.1415926
puts ('a'..'j') === 'c'
puts ('a'..'j') === 'z'

while gets
  print if /start/../end/
end
