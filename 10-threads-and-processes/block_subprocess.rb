IO.popen("date") {|f| puts "Date is #{f.gets}"}
