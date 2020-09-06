class Song
  include Comparable
  @@plays = 0

  def initialize(name, artist, duration)
    @name = name
    @artist = artist
    @duration = duration
    @plays = 0
  end

  attr_reader :name, :artist, :duration
  attr_writer :duration

  def durationInMinutes
    @duration / 60.0
  end

  def durationInMinutes=(value)
    @duration = (value * 60).to_i
  end

  def play
    @plays += 1
    @@plays += 1
    "This song: #@plays plays. Total #@@plays plays."
  end

  def <=>(other)
    self.duration <=> other.duration
  end

  def to_s
    return "Song: #{@name}--#{@artist} (#{@duration})"
  end
end

song1 = Song.new("My Way", "Sinatra", 225)
song2 = Song.new("Bicylops", "Fleck", 260)
puts song1 <=> song2
puts song1 < song2
puts song1 == song2
puts song1 > song2
