aFile = File.new("testfile.txt")
aFile.each_byte {|ch| putc ch; putc ?.}
puts

aFile = File.new("testfile.txt")
aFile.each_line {|line| puts "Got #{line.dump}"}
puts

aFile = File.new("testfile.txt")
aFile.each_line("e") {|line| puts "Got #{line.dump}"}
puts

IO.foreach("testfile.txt") {|line| puts line}
puts

lines = IO.readlines("testfile.txt")
puts lines.length
puts lines[0]
