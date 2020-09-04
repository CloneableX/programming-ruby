# raise
# raise "bad mp3 encoding"
# raise InterfaceException, "Keyboard failure", caller[1..-1]
#

class RetryException < RuntimeError
  attr :okToRetry
  def initialize(okToRetry)
    @okToRetry = okToRetry
  end
end

def readData
  data = nil
  if data.nil?
    raise RetryException.new(true), "transient read error"
  end
end

unread = true
begin
  stuff = readData
rescue RetryException => detail
  if detail.okToRetry && unread
    unread = false
    retry
  end
  raise
end
