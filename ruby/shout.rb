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
