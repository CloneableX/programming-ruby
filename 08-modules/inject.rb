module Inject
  def inject(n)
    each do |value|
      n = yield(n, value)
    end
    n
  end

  def sum(initial = 0)
    inject(initial) {|n, value| n + value}
  end

  def multiply(initial = 1)
    inject(initial) {|n, value| n * value}
  end
end

class Array
  include Inject
end

puts [1, 2, 3, 4, 5].sum
puts [1, 2, 3, 4, 5].multiply

class Range
  include Inject
end

puts (1..5).sum
puts (1..5).multiply
puts ('a'..'m').sum('Letters: ')
