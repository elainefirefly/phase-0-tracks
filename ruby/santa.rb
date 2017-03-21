class Santa
  attr_reader :age, :ethnicity, :reindeer_ranking
  attr_accessor :gender

  def initialize(gender,ethnicity)
    puts "Initializing Santa instance..."
    @gender = gender
    @ethnicity = ethnicity
    @reindeer_ranking = %w{Rudolph Dasher Dancer Prancer Vixen Comet Cupid Donner Blitzen}
    @age = 0
  end

  def speak
    puts "Ho, ho, ho! Haaaappy holidays!"
  end

  def eat_milk_and_cookies(cookie)
    puts "That was a good #{cookie}!"
  end

  def celebrate_birthday
    @age += 1
  end

  def get_mad_at(name)
    @reindeer_ranking.delete(name)
    @reindeer_ranking.push(name)
  end
end

# release 1
santa_fam = []
genders = %w{female male bisexual gay lesbian transgender queer}
ethnicity = %w{White Black Native\ American Alaska\ Native Hispanic Asian\ American Native\ Hawaiian Pacific\ Islander}
9.times { santa_fam << Santa.new(genders[rand(7)], ethnicity[rand(8)]) }

# release 1 driver code: (added attr_reader for testing)
puts "Santa List:"
santa_fam.each_with_index { |santa,idx| puts "#{idx + 1}. A #{santa.gender} #{santa.ethnicity} santa is born." }

# release 2 driver code:
#assign age to each santa
santa_fam.each do |santa|
  #due to some mystical cookie maturity booster
  rand(99).times { santa.celebrate_birthday }
  #queers are undecided, so they will likely decide eventually
  santa.gender = genders[rand(6)] if santa.gender == "queer"
  #sudden growth spurt can cause dangerous mood swings...
  if santa.age > 60
    santa.get_mad_at(santa.reindeer_ranking[rand(7)])
    puts "REINDEER RANKING ALERT!!!"
    santa.reindeer_ranking.each_with_index { |reindeer,idx| puts "Rank #{idx+1} #{reindeer}" }
  end
end

puts "Revised Santa List:"
santa_fam.each_with_index { |santa,idx| puts "#{idx + 1}. A #{santa.gender} #{santa.ethnicity} santa turned #{santa.age} years old." }



=begin
# release 0 driver code:

smelly_santa = Santa.new
smelly_santa.speak
smelly_santa.eat_milk_and_cookies("dark choco macadamia cookie")

=end
