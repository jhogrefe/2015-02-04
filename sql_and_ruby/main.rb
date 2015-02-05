require "pry"

# Empower my program with SQLite.
require "sqlite3"

# Load/create our database for this program.
# Use a constant, not a local variable (DATABASE,
# not db for example).
# No harm in running this line again; it will not
# overwrite the database.
DATABASE = SQLite3::Database.new("cadejo.db")

# Get results as a Hash, instead of an Array. (Better readability.)
DATABASE.results_as_hash = true

# Delete existing table of students so I can recreate it.
# Just make sure to comment it out after using it, or it
# will keep overwriting the table every time.
# DATABASE.execute("DROP TABLE students")

# Need the quotation marks below since you are outside of SQLite.
# Do not run this line more than once!
# You cannot have two primary keys in a table!
# DATABASE.execute("CREATE TABLE students (id INTEGER PRIMARY KEY, name TEXT)")
# DATABASE.execute("CREATE TABLE questions (id INTEGER PRIMARY KEY, student_idINTEGER, question_text TEXT)")

require_relative "student.rb"
require_relative "question.rb"

binding.pry

## In pry, you can insert data:
## DATABASE.execute("INSERT INTO students (id, name) VALUES (1, 'Bob')")
##
## And view data:
## DATABASE.execute("SELECT * FROM students")
## 
## This returns an array of hashes.
## 
## all_students.each do |row|
##   puts "The name of a student is #{row['name']}"
## end