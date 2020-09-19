count = 0
arr = []

10.times do |i|
  arr[i] = Thread.new {
    sleep(rand(0)/10.0)
    Thread.current["mycount"] = count
    count += 1
  }
end

arr.each {|aThread| aThread.join; print aThread["mycount"], ", "}
puts "count=#{count}"
