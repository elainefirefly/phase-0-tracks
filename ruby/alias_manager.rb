=begin
Pseudocode:
- create an empty hash to store the data into
- display a user interface
- create and call a method that will get the real name from the user - pass the hash as a parameter
- within this method, create a loop that will allow the user to enter more names
- check if the user typed 'done' or user did not type any letters, if so, exit the loop
- within the loop, generate an alias by calling a helper method
- the alias helper method must break the string into individual names and feed it to another helper method
- create a helper method that will breakdown name into characters to itirate and feed each character to an
  appropriate helper method that will determine and return the next character
- create 2 other helper methods, one that will provide the next vowel and one that will provide
  the next consonant - call appropriately
- once the fake name is generated, save it to the hash
- check if the hash is empty, if not, print the list of agents and aliases generated
- display an interface and thank the user before exiting the program
=end

def get_real_name(agents)
	puts "Type agent's name and press enter:"
	real_name = gets.chomp
	while real_name != "done" && real_name.strip != ""
		agents[real_name] = generate_fake_name(real_name)
		puts "Alias generated: #{agents[real_name]}"
		puts "Type another name or type 'done' to exit generator:"
		real_name = gets.chomp
	end
end

def generate_fake_name(real_name)
	real_name.split.map { |name| modify_name(name) }.reverse.join ' '
end

def modify_name(name)
	fake_name = ""
	name.chars do |letter|
		if letter =~ /[^a-z]/i
			fake_name << letter
		elsif letter =~ /[aeiou]/i
			fake_name << next_vowel(letter)
		else
			fake_name << next_consonant(letter)
		end
	end
	fake_name
end

def next_vowel(letter)
	vowels = %w{a e i o u}
	next_index = (vowels.index(letter.downcase) + 1) % 5
	letter == letter.upcase ? vowels[next_index].upcase : vowels[next_index]
end

def next_consonant(letter)
	consonants = ("b".."z").select { |c| c =~ /[^aeiou]/ }
	next_index = (consonants.index(letter.downcase) + 1) % 21
	letter == letter.upcase ? consonants[next_index].upcase : consonants[next_index]
end

def print_data(data)
	puts
	puts "  AGENTS & ALIASES  ".center(50, "=")
	puts
	data.each { |real,fake| puts "Agent #{real} is also known as #{fake}." }
	puts
	puts "".center(50, "=")
end

# main starts here
agents = {}
puts "  ALIAS MANAGER  ".center(50, "=")
puts
get_real_name(agents)
print_data(agents) if !agents.empty?
puts "Thank you for using Alias Manager. Carry on!"
