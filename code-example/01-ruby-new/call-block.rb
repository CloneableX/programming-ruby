def callBlock
  yield
  yield
end

callBlock { puts "In the block" }
