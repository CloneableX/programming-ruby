class VU
  include Comparable

  attr :volume

  def initialize(volume)
    @volume = volume
  end

  def to_s
    '#' * @volume
  end

  def <=>(other)
    self.volume <=> other.volume
  end

  def succ
    raise(IndexError, "Volume too big") if @volume >= 9
    VU.new(@volume.succ)
  end
end

medium = VU.new(4)..VU.new(7)
puts medium.to_a
puts medium.include?(VU.new(3))
