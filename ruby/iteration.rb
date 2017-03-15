# Release 1
tools = { "doctor" => "stethoscope",
          "plumber" => "wrench",
          "writer" => "pen",
          "painter" => "brush" }

names = ["Holly M", "Joe C","Scott W", "Pike F", "Nana C"]

p tools
tools.each { |key,val| puts "The primary tool of a #{key} is his #{val}."}
p tools

p names
names.each { |name| puts "Hello world! My name is #{name}." }
names.map! { |name| name[0...-2] }
p names
