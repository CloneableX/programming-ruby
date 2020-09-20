pipe = IO.popen("-", "w+")
if pipe
  pipe.puts "Get a job"
  $stderr.puts "Child says #{pipe.gets.chomp}"
else
  $stderr.puts "Dad says #{gets.chomp}"
  puts "Ok"
end
