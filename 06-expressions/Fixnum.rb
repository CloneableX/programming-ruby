class Fixnum
  alias oldPlus +

  def +(other)
    oldPlus(other).succ
  end
end

puts 1 + 2
a = 3
puts a += 4
