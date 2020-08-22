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
    @index = WordIndex.new
  end

  def append(aSong)
    @songs.push(aSong)
    @index.index(aSong, aSong.name, aSong.artist)
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

  def lookup(aWord)
    @index.lookup(aWord)
  end
end

class WordIndex
  def initialize
    @index = Hash.new(nil)
  end

  def index(anObject, *phrases)
    phrases.each do |aPhrase|
      aPhrase.scan /\w[-\w']+/ do |aWord|
        aWord.downcase!
        @index[aWord] = [] if @index[aWord].nil?
        @index[aWord].push(anObject)
      end
    end
  end

  def lookup(aWord)
    @index[aWord.downcase]
  end
end

songFile = File.open("song_file.txt")
songs = SongList.new

songFile.each do |line|
  file, length, name, title = line.chomp.split(/\s*\|\s*/)
  name.squeeze!(" ")
  mins, secs = length.scan(/\d+/)
  songs.append Song.new(title, name, mins.to_i * 60 + secs.to_i)
end
puts songs[1]
puts songs.lookup("Fats")
puts songs.lookup("ain't")
puts songs.lookup("RED")
puts songs.lookup("WoRlD")
