# 4.3 Mandatory Pairing
# Paired with Kiv Lo
puts "What is your hamster's name?"
hamster_name = gets.chomp

puts "Is your hamster noisy? Rate between 1-10:"
hamster_volume = gets.chomp.to_i

puts "What is your hamster's fur color?"
hamster_color = gets.chomp

puts "Is your hamster a good candidate for adoption? (y/n)"
hamster_behave = gets.chomp == "y" ? true : false

puts "What is your hamster's estimated age?"
hamster_age = gets.chomp

hamster_age = nil if hamster_age == ""
