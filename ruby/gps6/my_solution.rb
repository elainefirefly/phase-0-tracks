# Virus Predictor

# I worked on this challenge [by myself, with: ].
# We spent [#] hours on this challenge.

# require_relative loads the file in the same directory of the file that called it
# require relative method signature returns true if the file is found and returns false
# if not and will generate a load error.
# it differs from require because it saves you the effort to provide the path, it's like a syntactic sugar for require
# also it will not look at your load path folders if it doesn't find the file
# in the current directory

require_relative 'state_data'

class VirusPredictor
# creating the VirusPredictor object and initializes the instance with it's variables and initial values.
  def initialize(state_of_origin, population_density, population)
    @state = state_of_origin
    @population = population
    @population_density = population_density
  end
# calls the methods predicted_deaths and speed_of_spread
  def virus_effects
    puts "#{@state} will lose #{predicted_deaths} people in this outbreak and will spread across the state in #{speed_of_spread} months.\n\n"
  end

  private
#calculating the number of deaths depending on population density
# to predict the severity of the outbreak
# it produces a printout of the findings but returns nothing
  def predicted_deaths
    # predicted deaths is solely based on population density
    number_of_deaths = case @population
    when 200..Float::INFINITY then @population * 0.4
    when 150..199 then @population * 0.3
    when 100..149 then @population * 0.2
    when 50..99 then @population * 0.1
    else @population * 0.05
    end
    number_of_deaths.floor
  end
# calculates how fast the virus spreads depending on density
# it will print out the findings and return nil
  def speed_of_spread #in months
    # We are still perfecting our formula here. The speed is also affected
    # by additional factors we haven't added into this functionality.
    speed = case @population_density #since speed is 0.0, there is no need for the '+='
    when 200..Float::INFINITY then 0.5
    when 150..199 then 1.0
    when 100..149 then 1.5
    when 50..99 then 2.0
    else 2.5
    end
  end
end

#=======================================================================

# DRIVER CODE
 # initialize VirusPredictor for each state
STATE_DATA.each { |state,report| VirusPredictor.new(state, report[:population_density], report[:population]).virus_effects }
#=======================================================================
# Reflection Section
=begin
What are the differences between the two different hash syntaxes shown in the state_data file?
The outer hash uses a rocket syntax and string as key, the inner hash uses the colon syntax using a symbol as a key. The symbol key is immutable and not garbage collected, so using it has pros and cons depending on what I will be using it for.

What does require_relative do? How is it different from require?
require_relative is a syntactic sugar for require and current folder path.
Unlike require, if it does not find the file in the current folder, it
will immediately give you a load error.  Require will require the path
and if it does not find it in that path, it will look in the list of paths
in $LOAD_PATH.

What are some ways to iterate through a hash?
There are a number of ways to iterate through a hash depending on what you are trying to achieve and the data that you are trying to extract. One can iterate using a
enumerables like .each, .select, .each_key, .each_pair, or the lesser Ruby-like way of a for loop.

When refactoring virus_effects, what stood out to you about the variables, if anything?
Assignment to variables are repeated many times throughout each method, which was unnecessary.  Also, ivars do not need to be passed around since they have the scope of the class definition.
It also uses unnecessary operation like += when the result is the same as =.
The rounding of the numbers can be done when the final calculation is made and the final value is reached.
This is a good example of a working code, but not a clever and DRY one.

What concept did you most solidify in this challenge?
Iterating through data structure makes so much sense especially when dealing with big data.  Also, when I think that a code looks lean, it really is not, I can further shrink it down and make it better.
=end
