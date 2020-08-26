puts `date`
puts `dir`.split " "
puts %x{echo "Hello there"}
puts $?

alias oldBackquote `

def `(cmd)
  result = oldBackquote(cmd)
  if $? != 0
    raise "Command #{cmd} failed"
  end
  result
end
puts `date`
puts `data`
