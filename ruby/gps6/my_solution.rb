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
STATE_DATA.each do |state,report|
  VirusPredictor.new(state, report[:population_density], report[:population]).virus_effects
end
#=======================================================================
# Reflection Section
