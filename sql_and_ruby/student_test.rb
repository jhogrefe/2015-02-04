require "minitest/autorun"

require "sqlite3"

DATABASE = SQLite3::Database.new("cadejo_test.db")

require_relative "database_setup.rb"
require_relative "student.rb"
require_relative "question.rb"
# Careful you do not require_relative "database_setup"! It references cadejo.db
# move that to another file so you can run database_setup.rb

class StudentTest < Minitest::Test
  
  # Don't always need to create a setup method, expecially when your test
  # methods need to be more self contained.
  # def setup
  #   @student = Student.new({name: "Jason"})
  # end
  # But it does help if you want to clean your DB each time you run a test.
  
  def setup
    DATABASE.execute("DELETE FROM students") # students is the table name
    DATABASE.execute("DELETE FROM questions") # questions is the table name
  end
  
  def test_list_all_students
    
    DATABASE.execute("DELETE FROM students")
    
    s1 = Student.new ({name: "Andrew"})
    s2 = Student.new ({name: "Alex"})
    
    all_students = Student.all
    
    assert_equal(2, Student.all.length)
  end
  
  def test_student_creation
    student = Student.new({name: "Ruthie"})
    results = DATABASE.execute("SELECT name FROM students WHERE id = #{student.id}")
    added_student = results[0]
    
    assert_equal(1, results.length)
    assert_equal("Ruthie", added_student["name"])
  end
  
  # Test to make sure an empty array is returned.
  def test_student_has_no_questions
    student = Student.new({name: "Jason"})
    assert_equal([], student.questions)
  end

  # Test to make sure an empty array is returned.
  def test_student_has_questions
    student = Student.new({name: "Usman"})
    Question.new({student_id: student.id, question_text: "No question."})
    assert_equal(1, student.questions.length)
  end
  
end

# In pry, to run test file you enter:
# ruby student_test.rb