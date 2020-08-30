inputLine = "p hello"
case inputLine
when "debug"
  print "debug ...."
when /p\s+(\w+)/
  print $1
when "quit", "exit"
  exit
else
  print "Illegal command: #{inputLine}"
end
puts

year = gets.to_i
kind = case year
       when 1850..1889 then "Blues"
       when 1890..1909 then "Ragtime"
       else "Jazz"
       end
puts kind
