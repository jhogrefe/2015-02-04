# @name - String

class Student
  
  def initialize(options)
    @name = options[:name]
    save
  end
  
  def questions
      # SELECT * FROM questions WHERE student_id = 2;
    DATABASE.execute("SELECT * FROM questions WHERE student_id = #{@id}")
  end
    
  def self.all
     # SELECT * FROM students;
    DATABASE.execute("SELECT * FROM students")
  end
  
  private
  
  def save
    # In SQL, the command would look like: 
    # INSERT INTO students (name) VALUES ("Andrew");
    
    DATABASE.execute("INSERT INTO students (name) VALUES (\"#{@name}\")")
    @id = DATABASE.last_insert_row_id
  end
    
end

# in pry:
# andrew = Student.new({id: 1, name: "Andrew"})
# beth = Student.new({id: 2, name: "Beth"})