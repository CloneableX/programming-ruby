fork do
  puts "In child, pid = #$$"
  exit 99
end

pid = Process.wait
puts "Child process terminated, pid=#{pid}, exit code is #{$? >> 8}"
