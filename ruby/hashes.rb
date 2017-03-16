=begin
Pseudocode:
- greet the user (teach my program proper etiquette)
- create a method to get information from user and save info to a hash
- create a helper methods that will ask and retrieve the answer
- create a helper method that will print the info hash
- create a method that will ask for info revision
- re-use helper methods to ask for revision and display the revised info
- provide feedback to user
- exit with a farewell note
=end

def get_info
	client_info = Hash.new()
	puts "Please enter the following client information..."
	client_info[:first_name] = ask("First Name: ")
	client_info[:last_name] = ask("Last Name: ")
	client_info[:home_address] = ask("Home Address: ")
	client_info[:age] = ask("Age: ")
	client_info[:gender] = ask("Gender: ")
	client_info[:married] = ask("Married? Type 'y' or 'n': ")
	client_info[:household_size] = ask("Number of people in the household: ")
	client_info[:number_of_children] = ask("Number of children age 12 and below: ")
	client_info[:rooms_to_design] = get_rooms
	client_info[:favorite_color] = ask("Favorite color: ")
	client_info[:design_theme] = ask("Design theme: ")
	client_info[:budget] = "$ #{ask("Budget (enter whole number only and no symbol): ")}.00"
	display_info(client_info)
	client_info
end

def ask(question)
	puts question
	gets.chomp
end

def get_rooms
	puts "Which rooms in the house to design?\nType each room and press enter. Type 'done' when complete: "
	complete = gets.chomp
	rooms = []
	while complete != "done"
		rooms << complete
		puts "listing rooms... type 'done' when list is complete"
		complete = gets.chomp
	end
	rooms
end

def display_info(info)
	puts " CLIENT INTEL ".center(40, "=")
	puts
	info.each do |item,response|
		item_str = item.to_s.gsub("_", " ").capitalize
		response = response.join ", " if response.is_a? Array
		puts "#{item_str}: #{response}"
	end
	puts
	puts "=".center(40, "=")
end

def revise_entry(info)
	change = ask("Do you need to change any of the information? Type 'y' or 'n':")
	if change.downcase == "y"
		puts "Choose from the list, and type the item you would like to change"
		info.each_key { |item| puts item.to_s }
		choice = ask("Which item? ").to_sym
		if choice == :rooms_to_design
			info[choice] = get_rooms
		else
			info[choice] = ask("What should be the entry for #{choice.to_s}")
		end
		display_info(info)
	end
end

# main starts here
puts "Hello! Welcome to the Client Dossier System."
client_info = get_info
revise_entry(client_info)
puts "Your client info is now saved."
puts "Thank you for using the Client Dossier System. Have a nice day!"
