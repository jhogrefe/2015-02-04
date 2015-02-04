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

# Need the quotation marks below since you are outside of SQLite.
# Do not run this line more than once!
DATABASE.execute("CREATE TABLE students (id INTEGER, name TEXT)")



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