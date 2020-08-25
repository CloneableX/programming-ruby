print "(t)imes or (p)lus:"
times = gets
print "number: "
number = gets.to_i

# if times =~ /^t/
#   puts((1..10).collect {|n| n * number}.join(", "))
# else
#   puts((1..10).collect {|n| n + number}.join(", "))
# end

if times =~ /^t/
  cal = proc {|n| n * number}
else
  cal = proc {|n| n + number}
end
puts (1..10).collect(&cal).join(", ")
