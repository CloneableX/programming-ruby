a = Regexp.new('^\s*[a-z]')
b = /^\s*[a-z]/
c = %r{^\s*[a-z]}

puts a
puts b
puts c
puts

a = "Fats Waller"
puts a =~ /a/
puts a =~ /z/
puts a =~ /ll/
puts

def showRE(a, re)
  if a =~ re
    "#{$`}<<#{$&}>>#{$'}"
  else
    "no match"
  end
end

puts showRE('very interesting', /t/)
puts showRE('Fats Waller', /ll/)
puts showRE('kangaroo', /angar/)
puts showRE('!@%&-_=+', /%&/)
puts showRE('yes | no', /\|/)
puts showRE('yes (no)', /\(no\)/)
puts showRE('are you sure?', /e\?/)
puts showRE("this is\nthe time", /^the/)
puts showRE("this is\nthe time", /is$/)
puts showRE("this is\nthe time", /\Athis/)
puts showRE("this is\nthe time", /\Athe/)
puts showRE("this is\nthe time", /\bis/)
puts showRE("this is\nthe time", /\Bis/)
puts

puts showRE('It costs $12.', /[aeiou]/)
puts showRE('It costs $12.', /[\s]/)
puts showRE('It costs $12.', /\s/)
puts showRE('It costs $12.', /\d/)
puts showRE('It costs $12.', /c.s/)
puts showRE('It costs $12.', /./)
puts showRE('It costs $12.', /\./)
puts

a = 'Gamma [Design Patterns-page 123]'
puts showRE(a, /[]]/)
puts showRE(a, /[B-F]/)
puts showRE(a, /[-]/)
puts showRE(a, /[0-9]/)
puts

a = "The moon is made of cheese"
puts showRE(a, /\w+/)
puts showRE(a, /\s.*\s/)
puts showRE(a, /\s.*?\s/)
puts showRE(a, /[aeiou]{2,99}/)
puts showRE(a, /mo?o/)
puts

a = "red ball blue sky"
puts showRE(a, /d|e/)
puts showRE(a, /al|lu/)
puts showRE(a, /red ball|angry sky/)
puts showRE(a, /blue|red/)
puts showRE(a, /(blue|red) \w+/)
puts showRE(a, /(red|blue) \w+/)
puts showRE(a, /red|blue \w+/)
puts showRE(a, /red (ball|angry) sky/)
puts showRE("the red angry sky", /red (ball|angry) sky/)
puts

puts showRE("banana", /an*/)
puts showRE("banana", /(an)*/)
puts showRE("banana", /(an)+/)
puts

puts "12:50am" =~ /(\d\d):(\d\d)(..)/
puts "Hour is #$1, minute is #$2"
puts "12:50am" =~ /((\d\d):(\d\d))(..)/
puts "Time is #$1"
puts "Hour is #$2, minute is #$3"
puts "AM/PM is #$4"
puts

puts showRE('He said "Hello"', /(\w)\1/)
puts showRE('Mississippi', /(\w+)\1/)
puts

puts showRE('He said "Hello"', /(['"]).*?\1/)
puts showRE("He said 'Hello'", /(['"]).*?\1/)
puts

a = "the quick brown fox"
puts a.sub(/[aeiou]/, '*')
puts a.gsub(/[aeiou]/, '*')
puts a.sub(/\s\S+/, '')
puts a.gsub(/\s\S+/, '')
puts a.sub(/^./) {$&.upcase}
puts a.gsub(/[aeiou]/) {$&.upcase}
puts

def mixedCase(aName)
  aName.gsub(/\b\w/) {$&.upcase}
end

puts mixedCase("fats waller")
puts mixedCase("louis armstrong")
puts mixedCase("strength in numbers")
puts

puts "fred:smith".sub(/(\w+):(\w+)/, '\2, \1')
puts "nercpyitno".gsub(/(.)(.)/, '\2\1')
puts

str = 'a\b\c'
puts str.gsub(/\\/, '\\\\\\\\')
puts str.gsub(/\\/, '\&\&')
puts

puts /cat/.class
puts

re = /(\d+):(\d+)/
md = re.match("Time: 12:34am")
puts md.class
puts md[0]
puts md[1]
puts md[2]
puts md.pre_match
puts md.post_match
puts

md1 = re.match("Time: 12:34am")
md2 = re.match("Time: 10:30am")
puts md1[1, 2]
puts md2[1, 2]
puts

md1 = re.match("Time: 12:34am")
md2 = re.match("Time: 10:30am")
puts [$1, $2]
$~ = md1
puts [$1, $2]
