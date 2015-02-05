# @name - String

class Student
  
  attr_reader :id #this allows you to read private methods when testing!
  attr_accessor :name, :age, :hometown
  
  def initialize(options)
    @name = options[:name]
    @age = options[:age]
    @hometown = options[:hometown]
    save
  end
  
  # SETTER METHOD:
  # Take all the attributes for this object and make sure those are the 
  # values in this object's corresponding row in the 'students' table.
  def sync
    student_attributes = []
    
    #EXAMPLE  [:@name, :@age, :@hometown]
    instance_variables.each do |i|
                                               # from :@name
      student_attributes << i.to_s.delete("@") # to   name
      
    end
    
    query_components_array = []

    student_attributes.each do |a|

      value = self.send(a) # self.name   .... self.send("name")

      if value.is_a?(Integer)
        query_componenets_array << "#{a} = #{value}"
      else
        query_componenets_array << "#{a} = '#{value}'"
      end
    end
    query_string = query_components_array.join(", ")
    
    # The following connects classes to tables:
    DATABASE.execute("UPDATE students SET #{query_string} WHERE id = #{id}")
  end
  
  # Public: #questions
  # Get the questions asked by this student.
  #
  # Returns:
  # Array - Rows from 'questions' table for this student.
  def questions
      # SELECT * FROM questions WHERE student_id = 2;
    DATABASE.execute("SELECT * FROM questions WHERE student_id = #{@id}")
  end
  
  # Public: .all
  # Get all the students (Class Method)
  # 
  # Returns:
  # Array - Rows from 'students' with all information.
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