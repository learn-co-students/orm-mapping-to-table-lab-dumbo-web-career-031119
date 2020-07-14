class Student

  # Remember, you can access your database connection anywhere in this class
  #  with DB[:conn]

  attr_accessor :name,:grade
  attr_reader :id

  def initialize(name,grade,id=nil)
    @name = name
    @grade = grade
    @id = nil
  end

  def self.create_table
    sql = <<-SQL
    CREATE TABLE IF NOT EXISTS students(
      id INTEGER PRIMMARY KEY,
      name TEXT,
      album TEXT
    )
    SQL
    DB[:conn].execute(sql)
  end

  def self.drop_table
    sql = <<-SQL(
    DROP TABLE students)
    SQL
    DB[:conn].execute(sql)
  end


  def self.create(key:,grade:)
    sql = <<-SQL
      INSERT INTO students (name,grade)
      VALUES (?,?)
    SQL
     DB[:conn].execute(sql, self.name, self.album)
  end


end
