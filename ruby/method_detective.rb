# Replace in the "<???>" with the appropriate method (and arguments, if any).
# Uncomment the calls to catch these methods red-handed.

# When there's more than one suspect who could have
# committed the crime, add additional calls to prove it.

"iNvEsTiGaTiOn".swapcase
# => “InVeStIgAtIoN”

"zom".insert(1,'o')
# => “zoom”

"zom".sub("o","oo")
# => “zoom”

"zom".gsub("o","oo")
# => “zoom”

"enhance".center(15)
# => "    enhance    "

"Stop! You’re under arrest!".upcase
# => "STOP! YOU’RE UNDER ARREST!"

"the usual".concat(" suspects")
#=> "the usual suspects"

"the usual".insert(-1, " suspects")
#=> "the usual suspects"

" suspects".prepend("the usual")
# => "the usual suspects"

" suspects".insert(0, "the usual")
# => "the usual suspects"

"The case of the disappearing last letter".chop
# => "The case of the disappearing last lette"

"The case of the disappearing last letter".slice(0...-1)
# => "The case of the disappearing last lette"

"The mystery of the missing first letter".slice(1..-1)
# => "he mystery of the missing first letter"

"The mystery of the missing first letter".sub("T","")
# => "he mystery of the missing first letter"

"Elementary,    my   dear        Watson!".squeeze
# => "Elementary, my dear Watson!"

"Elementary,    my   dear        Watson!".gsub(/\ +/," ")
# => "Elementary, my dear Watson!"

"z".ord
# => 122

"z".getbyte
# => 122

# (What is the significance of the number 122 in relation to the character z?)
# 122 is the decimal ASCII code for the character z

"How many times does the letter 'a' appear in this string?".count("a")
# => 4
