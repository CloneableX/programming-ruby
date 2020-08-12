class Song
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

  def to_s
    return "Song: #{@name}--#{@artist} (#{@duration})"
  end

#  def duration=(newDuration)
#    @duration = newDuration
#  end

#  def name
#    @name
#  end
#
#  def artist
#    @artist
#  end
#
#  def duration
#    @duration
#  end
end

aSong = Song.new("Bicylops", "Fleck", 260)
puts aSong.inspect
puts aSong.to_s
puts aSong.name
puts aSong.artist
puts aSong.duration

aSong.duration = 257
puts aSong.duration

puts aSong.durationInMinutes
aSong.durationInMinutes = 4.2
puts aSong.duration

s1 = Song.new("Song1", "Artist1", 234)
s2 = Song.new("Song2", "Artist2", 345)

puts s1.play
puts s2.play
puts s1.play
puts s1.play

class KaraokeSong < Song
  def initialize(name, artist, duration, lyrics)
    super(name, artist, duration)
    @lyrics = lyrics
  end

#  def to_s
#    return "KS: #{@name}--#{@artist} (#{@duration}) [#{@lyrics}]"
#  end

   def to_s
     super + " [#{@lyrics}]"
   end
end

aSong = KaraokeSong.new("My Way", "Sinatra", 225, "And now, the...")
puts aSong.to_s
