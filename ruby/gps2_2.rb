# Method to create a list
# input: string of items separated by spaces (example: "carrots apples cereal pizza")
# steps:
  # split the string and assign it to an array
  # set default quantity of one
  # print the list to the console [can you use one of your other methods here?]
# output: fill array as hash keys with quantities as the value

def create_list(grocery_items)
  grocery_list = Hash.new(1)
  items.split.each { |item| grocery_list[item] }
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

#driver code
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
