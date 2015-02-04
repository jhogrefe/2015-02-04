# @id   - Integer
# @name - String

class Student
  
  def initialize(options)
    @id   = options[:id]
    @name = options[:name]
  end
  
  def save
    # In SQL, the command would look like: 
    # INSERT INTO students (id, name) VALUES (1, "Andrew");
    
    DATABASE.execute("INSERT INTO students (id, name) VALUES (#{@id}, \"#{@name}\")")
  end
    
end

# in pry:
# andrew = Student.new({id: 1, name: "Andrew"})
# beth = Student.new({id: 2, name: "Beth"})