# require gems
require 'sinatra'
require 'sqlite3'

set :public_folder, File.dirname(__FILE__) + '/static'

db = SQLite3::Database.new("students.db")
db.results_as_hash = true

# show students on the home page
get '/' do
  @students = db.execute("SELECT * FROM students")
  erb :home
end

get '/students/new' do
  erb :new_student
end

get '/students/:id' do
  id = params[:id]
  @student = db.execute("SELECT * FROM students WHERE id=?",id)
  erb :student_page
end

post '/student/update' do
  new_name = params["name"]
  id = params["id"]
  db.execute("UPDATE students SET name=? WHERE id=?", [new_name, id])
  redirect '/'
end

# create new students via
# a form
post '/students' do
  db.execute("INSERT INTO students (name, campus, age) VALUES (?,?,?)", [params['name'], params['campus'], params['age'].to_i])
  redirect '/'
end

# add static resources
