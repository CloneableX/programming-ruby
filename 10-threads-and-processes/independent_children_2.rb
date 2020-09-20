Signal.trap("CLD") {
  puts "Child terminated"
}

exec("sort testfile.txt > output.txt") if fork == nil
Process.wait
