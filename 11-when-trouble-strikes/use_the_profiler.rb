require "profile"

class Peter
  def initialize
    @value = 0
  end

  def rob(amt)
    @value += amt
    amt
  end
end

class Paul
  def initialize(amt)
    @value = amt
  end

  def pay(amt)
    @value -= amt
    amt
  end
end

peter = Peter.new
paul = Paul.new(1000)
1000.times do
  peter.rob(paul.pay(10))
end
