puts defined? 1
puts defined? dummy
puts defined? printf
puts defined? String
puts defined? $&
puts defined? $_
puts defined? Math::PI
puts defined? (c, d = 1, 2)
puts defined? 42.abs

handle = if 1 < 3
           2
         end
puts handle
