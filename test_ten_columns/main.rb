require "pry"

# Empower my program with SQLite.
require "sqlite3"


DATABASE = SQLite3::Database.new("restaurants.db")

# Get results as a Hash, instead of an Array. (Better readability.)
DATABASE.results_as_hash = true

# Delete existing table of students so I can recreate it.
# Just make sure to comment it out after using it, or it
# will keep overwriting the table every time.
# DATABASE.execute("DROP TABLE restaurants")


DATABASE.execute("CREATE TABLE restaurants (
id INTEGER PRIMARY KEY,
name VARCHAR(40),
est YEAR,
type VARCHAR(30),
breakfast INTEGER,
lunch INTEGER,
dinner INTEGER,
address VARCHAR(255),
city VARCHAR(50),
country VARCHAR(60)
)"
)

require_relative "restaurants"

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