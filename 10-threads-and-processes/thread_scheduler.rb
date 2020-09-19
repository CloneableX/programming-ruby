t = Thread.new {sleep 0.1; Thread.pass; Thread.stop;}
puts t.status
t.run
puts t.status
t.run
puts t.status
