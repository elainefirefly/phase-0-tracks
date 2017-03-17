school = {
  "facilities" => [["classrooms", 40], ["restrooms", 8] , ["cafeteria", 2], ["clinic", 1], ["gym", 1]],
  "personnel" => [
                  {name: "Mr. Smith", position: "Principal", availability: ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"]},
                  {name: "Mrs. Roldan", position: "Counselor", availability: ["Monday", "Wednesday", "Friday"]},
                  {name: "Mr. Harley", position: "Coach", availability: ["Tuesday", "Thursday", "Friday"]},
                  {name: "Ms. Benson", position: "Instructor", availability: ["Monday", "Tuesday", "Thursday"]}
                ],
  "curriculum" => ["elementary", "middle_school", "high_school"],
  "events" => {
    "may" => [["Teachers' Day", Time.new(2017,5,2)], ["Mother's Day", Time.new(2017,5,14)]],
    "june" => ["Foundation Day", Time.new(2017,6,12)],
    "july" => [["Independence Day", Time.new(2017,7,4)],["Cow Appreciation Day", Time.new(2017,7,15)],["National Lasagna Day", Time.new(2017,7,29)]]
  }
}

puts "Which days will Ms. Benson be in campus?"
days = school["personnel"].select { |employee| employee[:name] == "Ms. Benson" }.first[:availability].join(", ")
puts "Ms. Benson is available every #{days}."

puts "How many days until Cow Appreciation Day?"
count = (school["events"]["july"].select { |event| event[0] == "Cow Appreciation Day" }[0][1] - Time.now).floor / 60 /60 / 24
puts "It's #{count} days until Cow Appreciation Day."

puts "What is the ratio between classrooms and restrooms in school?"
classroom_count = school["facilities"].select { |room| room[0] == "classrooms" }[0][1]
restroom_count = school["facilities"].select { |room| room[0] == "restrooms" }.last[1]
ratio = classroom_count/restroom_count.rationalize
puts "The ratio of classrooms to restrooms in school is #{ratio}."
