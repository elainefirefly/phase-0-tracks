# Replace in the "<???>" with the appropriate method (and arguments, if any).
# Uncomment the calls to catch these methods red-handed.

# When there's more than one suspect who could have
# committed the crime, add additional calls to prove it.

puts "iNvEsTiGaTiOn".swapcase
# => “InVeStIgAtIoN”

puts "zom".insert(1,'o')
# => “zoom”

puts "zom".sub("o","oo")
# => “zoom”

puts "zom".gsub("o","oo")
# => “zoom”

puts "enhance".center(15)
# => "    enhance    "

puts "Stop! You’re under arrest!".upcase
# => "STOP! YOU’RE UNDER ARREST!"

puts "the usual".concat(" suspects")
#=> "the usual suspects"

puts "the usual".insert(-1, " suspects")
#=> "the usual suspects"

puts " suspects".prepend("the usual")
# => "the usual suspects"

puts " suspects".insert(0, "the usual")
# => "the usual suspects"

puts "The case of the disappearing last letter".chop
# => "The case of the disappearing last lette"

puts "The case of the disappearing last letter".slice(0...-1)
# => "The case of the disappearing last lette"

puts "The mystery of the missing first letter".slice(1..-1)
# => "he mystery of the missing first letter"

puts "The mystery of the missing first letter".sub("T","")
# => "he mystery of the missing first letter"

puts "Elementary,    my   dear        Watson!".squeeze
# => "Elementary, my dear Watson!"

puts "Elementary,    my   dear        Watson!".gsub(/\ +/," ")
# => "Elementary, my dear Watson!"

puts "z".ord
# => 122

puts "z".getbyte(0)
# => 122

# (What is the significance of the number 122 in relation to the character z?)
puts "122 is the decimal ASCII code for the character z"

puts "How many times does the letter 'a' appear in this string?".count("a")
# => 4
