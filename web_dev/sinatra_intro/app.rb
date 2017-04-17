# require gems
require 'sinatra'
require 'sqlite3'

db = SQLite3::Database.new("students.db")
db.results_as_hash = true

# write a basic GET route
# add a query parameter
# GET /
get '/' do
  #{}"#{params[:name]} is #{params[:age]} years old."
  #Revising for optional bonus in release 0
  persons = db.execute("SELECT * FROM students WHERE name like '%#{params[:name_pattern]}%';")
  resp = "Search result (#{persons.count} students):<br>"
  persons.each do |person|
    resp << "ID: #{person['id']}<br>"
    resp << "Name: #{person['name']}<br>"
    resp << "Age: #{person['age']}<br>"
    resp << "Campus: #{person['campus']}<br><br>"
  end
  resp
end

# write a GET route with
# route parameters
get '/about/:person' do
  person = params[:person]
  "#{person} is a programmer, and #{person} is learning Sinatra."
end

get '/:person_1/loves/:person_2' do
  "#{params[:person_1]} loves #{params[:person_2]}"
end

# write a GET route that retrieves
# all student data
get '/students' do
  students = db.execute("SELECT * FROM students")
  response = ""
  students.each do |student|
    response << "ID: #{student['id']}<br>"
    response << "Name: #{student['name']}<br>"
    response << "Age: #{student['age']}<br>"
    response << "Campus: #{student['campus']}<br><br>"
  end
  response
end

# write a GET route that retrieves
# a particular student

get '/students/:id' do
  student = db.execute("SELECT * FROM students WHERE id=?", [params[:id]])[0]
  student.to_s
end

get '/contact' do
  "Address:<br>Dev Bootcamp - SF<br>633 Folsom St.<br>San Francisco, CA  94107"
end

get '/great_job/' do
  if params[:name]
    "Great job #{params[:name]}!"
  else
    "Great job!"
  end
end

get '/:number1/plus/:number2' do
  (params[:number1].to_i + params[:number2].to_i).to_s
end
