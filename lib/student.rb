class Student

	attr_reader :id
	attr_accessor :name, :grade

	@@all = []

	def initialize(id = nil, name, grade)
		@id = id
		@name = name
		@grade = grade

		@@all << self
	end

	def self.create_table
		sql = <<-SQL
				CREATE TABLE students (
				id INTEGER PRIMARY KEY,
				name TEXT,
				grade INTEGER
			);
			SQL

	DB[:conn].execute(sql)
	end

	def self.drop_table
			sql = <<-SQL
				DROP TABLE students;
			);
			SQL
		DB[:conn].execute(sql)
	end

	def save
		sql = <<-SQL
		  INSERT INTO students (name, grade)
		  VALUES (?, ?)
		SQL

		DB[:conn].execute(sql, self.name, self.grade)
	end

	def self.create(name, grade)
		student = Student.new(name, grade)
		student.save
		student
	end

	# def self.all
	# 	@@all
	# end

  # Remember, you can access your database connection anywhere in this class
  #  with DB[:conn]

end
