# release 3
module Shout
  def yell_angrily(words)
    words + "!!!" + " :("
  end

  def yell_happily(words)
    words.upcase + "! :)"
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
hubby.yell_angrily("What? Another purse")
wifey = Wife.new
wifey.yell_happily("It's Chanel")

hubby.yell_happily("It's a boy")
wifey.yell_angrily("")






=begin
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
