class Student
  
  def initialize(options)
    @name = options[:name]
  end
  
  def save
    # In SQL, the command would look like: 
    # INSERT INTO students (name) VALUES ("Andrew");
    
    DATABASE.execute("INSERT INTO students (name) VALUES (\"#{@name}\")")
  end
    
end