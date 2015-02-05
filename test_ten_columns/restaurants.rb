# @name - String

class Restaurants
  
  def initialize(options)
    @name = options[:name]
    save
  end
    
  def self.all
     # SELECT * FROM students;
    DATABASE.execute("SELECT * FROM restaurants")
  end
  
  private
  
  def save
    # In SQL, the command would look like: 
    # INSERT INTO restaurants (name) VALUES ("Taco Bell");
    
    DATABASE.execute("INSERT INTO restaurants (name) VALUES (\"#{@name}\")")
    # @id = DATABASE.last_insert_row_id
  end
    
end

# DATABASE.execute("INSERT INTO restaurants (name, est, type, breakfast, lunch, dinner, address, city, country) VALUES ('Taco Bell', 1974, 'Mexican', 1, 1, 1, '900 Fort Street', 'Omaha', 'United States')")