require 'net/http'

pages = %w(
  www.rubycentral.com
  www.awl.com
  www.programaticprogrammer.com
)

threads = []

for page in pages
  threads << Thread.new(page) {|webPage|
    link = Net::HTTP.new(webPage, 80)
    puts "Fetching: #{webPage}"
    resp, data = link.get('/', nil)
    puts "Got #{webPage}: #{resp.message}"
  }
end

threads.each {|aThread| aThread.join}
