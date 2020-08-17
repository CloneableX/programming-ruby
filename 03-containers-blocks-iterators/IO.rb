f = File.open("testfile")
f.each do |line|
  print line
end
f.close

class File
  def File.openAndProcess(*args)
    f = File.open(*args)
    yield f
    f.close()
  end

  def File.myOpen(*args)
    f = File.open(*args)
    if block_given?
      yield f
      f.close()
      f = nil
    end
    return f
  end
end

File.openAndProcess("testfile", "r") do |aFile|
  print while aFile.gets
end

File.myOpen("testfile").each do |line|
  print line
end
