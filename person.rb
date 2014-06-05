class Person
	attr_reader :name
	def initialize(name)
		@name=name
	end

	def greet
		puts "Hi, my name is #{name}"
	end
end


class Student < Person
	def learn
		puts "I get it!"
	end
end

class Instructor < Person
	def teach
		puts "Everything in Ruby is an Object"
	end
end

Chris = Instructor.new("Chris")
Chris.greet

Cristina = Student.new("Cristina")
Cristina.greet

Chris.teach

Cristina.learn

Cristina.teach #This won't work because a) you have to know to teach / 
# and b) the teach method is not defined in the Student class, of which 
#Cristina is an instance. 