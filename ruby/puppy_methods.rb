# release 0
class Puppy
  #release 1
  def initialize
    puts "Initializing new puppy instance..."
  end

  def fetch(toy)
    puts "I brought back the #{toy}!"
    toy
  end

  def speak(number)
    number.times { puts "Woof!"}
  end

  def roll_over
    puts "rolls over"
  end

  def dog_years(human_years)
    human_years * 7
  end

  def lick_face(name)
    puts "Licks #{name}'s face \u{1f436}"
  end
end


# driver code
cinnamon = Puppy.new
cinnamon.fetch("shuriken")
cinnamon.speak(5)
cinnamon.roll_over
puts cinnamon.dog_years(1)
cinnamon.lick_face("Jojo")
