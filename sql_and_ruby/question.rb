class Question
  
  def initialize(options)
    @student_id    = options[:student_id]
    @question_text = options[:question_text]
  end
  
  def save
    # INSERT INTO questions (student_id, question_text) VALUES (3, "Why?");
    DATABASE.execute("INSERT INTO questions (student_id, question_text) VALUES (#{@student_id}, '#{@question_text}')")
  end
  
  def self.all
    #                 SELECT * FROM questions;
    DATABASE.execute("SELECT * FROM questions")
  end
  
end
