3.times do
  print 'Ho! '
end
puts

0.upto(9) do |x|
  print x, " "
end
puts

0.step(12, 3) {|x| print x, " "}
puts

[1, 1, 2, 3, 5].each {|val| print val, " "}
puts

File.open("ordinal.txt").grep /d$/ do |line|
  print line
end
puts

for var in [1, 1, 2, 3, 5]
  print var, " "
end
puts

[1, 1, 2, 3, 5].each do |var|
  print var, " "
end
puts

for var in 1..3
  print var, " "
end
puts

for line in File.open("ordinal.txt").find_all {|l| l =~ /d$/}
  print line.chomp, " "
end
puts

class Periods
  def each
    yield "Classical"
    yield "Jazz"
    yield "Rock"
  end
end

periods = Periods.new
for period in periods
  print period, " "
end
