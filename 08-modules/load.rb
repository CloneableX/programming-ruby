5.times do |i|
  File.open("temp.rb", "w") {|f|
    f.puts "module Temp\ndef Temp.var() #{i} end\nend"
  }
  load "temp.rb"
  puts Temp.var
end
