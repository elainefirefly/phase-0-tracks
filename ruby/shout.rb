# release 3
module Shout
  def yell_angrily(words)
    words + "!!!" + " :("
  end

  def yell_happily(words)
    words.upcase + "! :)"
  end
end

#just playing, not required by module
module Borderize
  def self.create_border(unicode1,unicode2)
    puts
    10.times { print " #{unicode1} #{unicode2} " }
    puts
    puts
  end
end

class Husband
  include Shout
end

class Wife
  include Shout
end

# driver code
hubby = Husband.new
wifey = Wife.new
Borderize.create_border("\u{1f468}", "\u{1f469}")
puts hubby.yell_angrily("Hubby: What? Another purse")
puts wifey.yell_happily("Wifey: It's Chanel")
Borderize.create_border("\u{1f468}", "\u{1f469}")
puts hubby.yell_happily("Hubby: Happy Anniversary")
puts wifey.yell_angrily("Wifey: A vacuum cleaner – you're giving me a vacuum cleaner?")
Borderize.create_border("\u{1f468}", "\u{1f469}")

=begin
# release 1
module Shout
  def self.yell_angrily(words)
    words + "!!!" + " :("
  end

  def self.yell_happily(words)
    words.upcase + "! :)"
  end
end

# driver code
puts Shout.yell_angrily("Get lost")
puts Shout.yell_happily("Congrats")
=end
