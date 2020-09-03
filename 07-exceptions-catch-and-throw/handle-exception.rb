opName = "song.txt"
opFile = File.open(opName, "w")

begin
  while data = socket.read(512)
    opFile.write(data)
  end

rescue SystemCallError
  $stderr.print "IO failed:" + $!
  opFile.close
  File.delete(opName)
  raise
end

begin
  eval string
rescue SyntaxError, NameError => boom
  print "String doesn't compile: " + boom
rescue StandardError => bang
  print "Error running script: " + bang
end
