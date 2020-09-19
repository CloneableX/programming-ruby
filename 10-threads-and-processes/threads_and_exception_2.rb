Thread.abort_on_exception = true
threads = []
6.times do |i|
  threads << Thread.new(i) {
    raise "Boom!" if i == 3
    puts i
  }
end

threads.each {|aThread| aThread.join}
