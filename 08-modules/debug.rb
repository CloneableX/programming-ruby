module Debug
  def whoAmI?
    "#{self.class} : #{self.to_s}"
  end
end

class Phonograph
  include Debug
end

class EightTrack
  include Debug
end

ph = Phonograph.new
et = EightTrack.new

puts ph.whoAmI?
puts et.whoAmI?
