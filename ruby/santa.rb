class Santa

  def initialize
    puts "Initializing Santa instance..."
  end

  def speak
    puts "Ho, ho, ho! Haaaappy holidays!"
  end

  def eat_milk_and_cookies(cookie)
    puts "That was a good #{cookie}!"
  end

end

# driver code:
smelly_santa = Santa.new
smelly_santa.speak
smelly_santa.eat_milk_and_cookies("dark choco macadamia cookie")
