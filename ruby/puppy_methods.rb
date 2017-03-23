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

# release 2
class Kitten
  def initialize
 	  puts "New kitten coming..."
  end

  def follow_yarn(yard)
    puts "Runs #{yard} yards"
  end

  def climb
    furniture = ["table", "chair", "person", "bookcase"]
    puts "climbs up #{furniture.sample}"
  end
end


# driver code
cinnamon = Puppy.new
cinnamon.fetch("shuriken")
cinnamon.speak(5)
cinnamon.roll_over
puts cinnamon.dog_years(1)
cinnamon.lick_face("Jojo")

kittenz_den = []
50.times {kittenz_den << Kitten.new}
kittenz_den.each_with_index do |kitten,idx|
  puts "This is kitten number #{idx + 1}"
  kitten.follow_yarn(rand(1..100))
  kitten.climb
end
