def threeTimes
  yield
  yield
  yield
end

threeTimes { puts "Hello" }

def fabUpTo(max)
  i1, i2 = 1, 1
  while i1 <= max
    yield i1
    i1, i2 = i2, i1 + i2
  end
end

fabUpTo(100) { |f| print f, ' ' }
puts

[1, 3, 5].each { |i| puts i }
puts ["H", "A", "L"].collect {|x| x.succ}
