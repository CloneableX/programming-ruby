class Bowdlerize
  def initialize(aString)
    @value = aString.gsub(/[aeiou]/, '*')
  end

  def +(other)
    Bowdlerize.new(self.to_s + other.to_s)
  end

  def to_s
    @value
  end
end

a = Bowdlerize.new("damn ")
a += "shame"
print a
