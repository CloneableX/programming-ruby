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
end

class SongList
  def initialize
    @songs = Array.new
  end

  def append(aSong)
    @songs.push(aSong)
    self
  end

  def deleteFirst
    @songs.shift
  end

  def deleteLast
    @songs.pop
  end

  def [](key)
    return @songs[key] if key.kind_of?(Integer)
    return @songs.find { |aSong| key == aSong.name }
  end
end

list = SongList.new
list.
  append(Song.new('title1', 'artist1', 1)).
  append(Song.new('title2', 'artist2', 2)).
  append(Song.new('title3', 'artist3', 3)).
  append(Song.new('title4', 'artist4', 4))

puts list[0]
puts list[2]
puts list[9]

puts list.deleteFirst
puts list.deleteFirst
puts list.deleteLast
puts list.deleteLast
puts list.deleteLast
