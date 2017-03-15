# Release 1
tools = { "doctor" => "stethoscope",
          "plumber" => "wrench",
          "writer" => "pen",
          "painter" => "brush" }

names = ["Holly M", "Joe C","Scott W", "Pike F", "Nana C"]

p tools
tools.each { |key,val| puts "The primary tool of a #{key} is his #{val}."}
p tools

p names
names.each { |name| puts "Hello world! My name is #{name}." }
names.map! { |name| name[0...-2] }
p names

# Release 2
# 1.
p num_arr = [10,3,6,7,2,4]
p num_arr.delete_if {|n| n <= 6 }

p letter_hash={1=>?a, 2=>?b, 3=>?c, 4=>?d}
p letter_hash.delete_if { |k,_| k.odd? }

# 2.
p num_arr = [10,3,6,7,2,4]
p num_arr.select { |n| n >= 6 }

p letter_hash={1=>?a, 2=>?b, 3=>?c, 4=>?d}
p letter_hash.select { |_,v| v =~ /[bc]/i }

# 3.
p num_arr = [10,3,6,7,2,4]
p num_arr.keep_if { |n| n > 4}

p letter_hash={1=>?a, 2=>?b, 3=>?c, 4=>?d}
p letter_hash.keep_if { |_,v| v =~ /[bc]/i }

# 4.
p num_arr = [10,8,7,6,2,4]
accepted_num = num_arr.drop_while { |n| n < 6}
p num_arr

p letter_hash={1=>?a, 2=>?b, 3=>?c, 4=>?d}
class Hash
  def drop_stop
      self.each { |k,_| yield(k,_) ? break : self.delete(k) }
      self
  end
end
p letter_hash.drop_stop { |k,_| k == 3 }
