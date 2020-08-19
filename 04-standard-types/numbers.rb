num = 8
7.times do
  print num.class, " ", num, "\n"
  num *= num
end

puts

3.times { print "X " }
1.upto(5) { |i| print i, " " }
99.downto(95) { |i| print i, " " }
50.step(80, 5) { |i| print i, " " }

puts

File.open("DATA").each do |line|
  vals = line.split
  print vals[0] + vals[1], " "
end

puts

File.open("DATA").each do |line|
  vals = line.split
  print vals[0].to_i + vals[1].to_i, " "
end
