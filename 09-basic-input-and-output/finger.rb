require "socket"

client = TCPSocket.open('localhost', 'finger')
client.send("oracle\n", 0)
puts client.readlines
client.close
