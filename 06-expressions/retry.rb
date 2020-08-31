for i in 1..100
  print "Now at #{i}. Restart?"
  if gets =~ /^y/i
    i = 1
    redo
  end
end
