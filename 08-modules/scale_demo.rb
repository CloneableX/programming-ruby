module MajorScale
  def majorNum
    @numNotes = 7 if @numNotes.nil?
    @numNotes
  end
end

module PentatonicScale
  def pentaNum
    @numNotes = 5 if @numNotes.nil?
    @numNotes
  end
end

class ScaleDemo
  include MajorScale
  include PentatonicScale
  def initialize
    puts majorNum
    puts pentaNum
  end
end

ScaleDemo.new
