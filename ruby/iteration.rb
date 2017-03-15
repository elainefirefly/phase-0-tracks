# Release 1
tools = { "doctor" => "stethoscope",
          "plumber" => "wrench",
          "writer" => "pen",
          "painter" => "brush" }

names = ["Holly M", "Joe C","Scott W", "Pike F", "Nana C"]

p tools
tools.each { |profession,tool| puts "The primary tool of a #{profession} is his #{tool}."}
p tools

p names
names.each { |name| puts "Hello world! My name is #{name}." }
names.map! { |name| name[0...-2] }
p names

# Release 2
# 1.
p number_array = [10,3,6,7,2,4]
p number_array.delete_if {|digit| digit < 6 }

p letter_hash={1=>?a, 2=>?b, 3=>?c, 4=>?d}
p letter_hash.delete_if { |digit,_| digit.odd? }

# 2.
p number_array = [10,3,6,7,2,4]
p number_array.select { |digit| digit >= 6 }

p letter_hash={1=>?a, 2=>?b, 3=>?c, 4=>?d}
p letter_hash.select { |_,letter| letter =~ /[bc]/i }

# 3.
p number_array = [10,3,6,7,2,4]
p number_array.keep_if { |digit| digit >= 4 }

p letter_hash={1=>?a, 2=>?b, 3=>?c, 4=>?d}
p letter_hash.keep_if { |_,letter| letter =~ /[bc]/i }

# 4.
p number_array = [10,8,7,6,2,4]
p number_array.drop_while { |digit| digit > 6}

p letter_hash={1=>?a, 2=>?b, 3=>?c, 4=>?d}
class Hash
  def drop_stop
      self.each { |k,_| yield(k,_) ? break : self.delete(k) }
      self
  end
end
p letter_hash.drop_stop { |digit,_| digit == 3 }
