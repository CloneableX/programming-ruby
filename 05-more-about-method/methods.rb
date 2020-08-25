def coolDude(arg1 = "Miles", arg2 = "Coltrane", arg3 = "Roach")
  "#{arg1}, #{arg2}, #{arg3}."
end

puts coolDude
puts coolDude("Bart")
puts coolDude("Bart", "Elwood")
puts coolDude("Bart", "Elwood", "Linus")
puts

def varargs(arg1, *rest)
  "Got #{arg1} and #{rest.join(', ')}"
end

puts varargs("one")
puts varargs("one", "two")
puts varargs "one", "two", "three"
puts

def takeBlock(p1)
  if block_given?
    yield(p1)
  else
    p1
  end
end

puts takeBlock("no block")
puts takeBlock("no block") {|s| s.sub(/no /, '')}
puts

class TaxCalculator
  def initialize(name, &block)
    @name, @block = name, block
  end

  def getTax(amount)
    "#@name on #{amount} = #{@block.call(amount)}"
  end
end

tc = TaxCalculator.new("Sales tax") {|amt| amt * 0.075}
puts tc.getTax(100)
puts tc.getTax(250)
puts

def five(a, b, c, d, e)
  "I was passed #{a}, #{b}, #{c}, #{d}, #{e}"
end

puts five(1, 2, 3, 4, 5)
puts five(1, 2, 3, *['a', 'b'])
puts five(*(10..14).to_a)
