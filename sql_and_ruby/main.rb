require "pry"

# Empower my program with SQLite.
require "sqlite3"


# Load/create our database for this program.
# Use a constant, not a local variable (DATABASE,
# not db for example).
# No harm in running this line again; it will not
# overwrite the database.
DATABASE = SQLite3::Database.new("cadejo.db")


require_relative "database_setup.rb"
require_relative "student.rb"
require_relative "question.rb"


binding.pry
