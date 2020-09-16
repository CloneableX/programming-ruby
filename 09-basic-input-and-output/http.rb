require 'net/http'

h = Net::HTTP.new('www.pragprog.com', 80)
h.use_ssl = true
resp, data = h.get('/index.html')
puts resp.message
if resp.message == "OK"
  puts "connect success"
  data.scan(/<img src="(.*)"/) {|x| puts x}
end
