# catch(:done) do
#   while line = gets
#     throw :done unless line =~ /.*\t.*/
#     puts line
#   end
#   print "Input ending!!!"
# end
#

def promptAndGet(prompt)
  print prompt
  result = gets.chomp
  throw :quitRequest if result == '!'
  return result
end

catch :quitRequested do
  name = promptAndGet("Name: ")
  age = promptAndGet("Age: ")
  sex = promptAndGet("Sex: ")
end
