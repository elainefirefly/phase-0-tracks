# Method to create a list
# input: string of items separated by spaces (example: "carrots apples cereal pizza")
# steps:
  # split the string and assign it to an array
  # set default quantity of one
  # print the list to the console [can you use one of your other methods here?]
# output: fill array as hash keys with quantities as the value

def create_list(grocery_items)
  grocery_list = Hash.new(0)
  grocery_items.split.each { |item| grocery_list[item] += 1 }
  grocery_list
end

# Method to add an item to a list
# input: list, item name, and optional quantity
# steps: Use symbols, create new item and quantity, and add it to our hash
# output: Updated list with added item

def add_item(grocery_list,new_item,quantity=1)
  grocery_list[new_item] = quantity
end

# Method to remove an item from the list
# input: list and item name
# steps: find the item in the list and delete it
# output: updated list with removed item

def remove_item(grocery_list, item)
  grocery_list.delete(item)
end

# Method to update the quantity of an item
# input: list and item name and quantity
# steps: reassign quantity of the item
# output: updated list

def update_quantity(grocery_list, item, quantity)
  grocery_list[item] = quantity
end

# Method to print a list and make it look pretty
# input: list
# steps: iterate through the list and print each item and quantity
# output: screen display of grocery list

def print_list(grocery_list)
  puts " GROCERY LIST ".center(50, "=")
  puts
  grocery_list.each { |item,qty| puts "#{item} qty: #{qty}" }
  puts
  puts "=".center(50, "=")
end

# driver code
grocery_list = create_list("apples milk cereal")
print_list(grocery_list)
add_item(grocery_list, "lemonade", 2)
add_item(grocery_list, "tomatoes", 3)
add_item(grocery_list, "onions")
add_item(grocery_list, "ice cream", 4)
print_list(grocery_list)
remove_item(grocery_list, "lemonade")
print_list(grocery_list)
update_quantity(grocery_list, "ice cream", 1)
print_list(grocery_list)


=begin
Release 4: Reflection
What did you learn about pseudocode from working on this challenge?
I learned that it will be easier for me to tackle syntax if I have
focused on the logic first, and that's what pseudocode is for.

What are the tradeoffs of using arrays and hashes for this challenge?
While arrays and hashes make it possible to create complex data structure, it also complicates the code, and the developer must be comfortable using them to be able to access data properly. Luckily,
this tradeoff is much bearable with Ruby than any other language I have
encountered in my learning.

What does a method return?
A method returns the result of the last statement that was evaluated

What kind of things can you pass into methods as arguments?
objects and blocks

How can you pass information between methods?
using parameters/arguments

What concepts were solidified in this challenge, and what concepts are still confusing?
I'm pretty familiar with Ruby and methods, so I think it was pretty solid already.  However, I did get practice pseudocoding, which I don't usually do because I'm used to the Ruby syntax already.
=end
