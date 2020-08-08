def echo_ruby
  ARGF.each {|line| print line if line =~ /Ruby/ }
end

echo_ruby
