puts 'escpae using "\\"'
puts 'That\'s right'
puts

puts "Seconds/day: #{24*60*60}"
puts "#{'Ho! ' * 3}Merry Christmas"
puts "This is line #$."
puts

puts %q/general single-quote string/
puts %Q!general double-quote string!
puts %Q{Seconds/day: #{24*60*60}}
puts

aString = <<END_OF_STRING
  The body of the string
  is the input line up to
  one ending with the same
  text that followed the '<<'
END_OF_STRING
puts aString

print <<-STRING2
  Concat
    enate
    STRING2
