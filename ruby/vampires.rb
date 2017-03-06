# Release 3
puts "How many employees to process?"
emp_count = gets.chomp.to_i

emp_count.times {
  # Release 1
  puts "What is your name?"
  name = gets.chomp
  puts "How old are you?"
  age = gets.chomp.to_i
  puts "What year were you born?"
  birth_year = gets.chomp.to_i
  puts "Our company cafeteria serves garlic bread. Should we order some for you? Type 'y' or 'n'."
  order_garlic = gets.chomp == 'y' ? true : false;
  puts "Would you like to enroll in the company's health insurance? Type 'y' or 'n'."
  enroll_insurance = gets.chomp == 'y' ? true : false;

  # Release 2
  correct_age = Time.now.year - birth_year == age
  result = nil
  if correct_age && order_garlic && enroll_insurance
    result = "Probably not a vampire"
  elsif !correct_age && (!order_garlic ^ !enroll_insurance)
    result = "Probably a vampire"
  elsif !correct_age && !order_garlic && !enroll_insurance
    result = "Almost certainly a vampire"
  else
    result = nil
  end

  result = "Definitely a vampire" if name == "Drake Cula" || name == "Tu Fang"

  result ||= "Results inconclusive"

  # Release 4
  allergy = ""
  until allergy == "done"
    puts "Do you have allergies? Type each one and press enter. Type 'done', when list is complete. : "
    allergy = gets.chomp
    if allergy == "sunshine"
      result = "Probably a vampire"
      break
    end
  end

  puts "Vampire Test Result for #{name}: #{result}"
}
