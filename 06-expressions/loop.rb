file = File.open('ordinal.txt')
while file.gets
  print if /third/../fifth/
end
puts

file = File.open('ordinal.txt')
while file.gets
  print if ($. == 1) || /eig/..($. == 3) || /nin/
end
puts

print "Hello\n" while false
begin
  print "Goodbye\n"
end while false
