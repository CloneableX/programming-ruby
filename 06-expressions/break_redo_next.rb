while gets
  next if /^\s*#/
  break if /^END/
  redo if gsub!(/`(.*?)`/) {eval($1)}
end

i = 0
loop do
  i += 1
  next if i < 3
  print i
  break if i > 4
end
