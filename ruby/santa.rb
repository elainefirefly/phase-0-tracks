class Santa
  attr_reader :gender, :ethnicity

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

end

# release 1 driver code:
santa_fam = []
genders = %w{female male bisexual gay lesbian transgender queer}
ethnicity = %w{White Black Native\ American Alaska\ Native Hispanic Asian\ American Native\ Hawaiian Pacific\ Islander}
9.times { santa_fam << Santa.new(genders[rand(7)], ethnicity[rand(8)]) }
puts "Santa List:"
santa_fam.each_with_index { |santa,idx| puts "#{idx + 1}. A #{santa.gender} #{santa.ethnicity} santa is born." }

=begin
# release 0 driver code:
smelly_santa = Santa.new
smelly_santa.speak
smelly_santa.eat_milk_and_cookies("dark choco macadamia cookie")
=end
