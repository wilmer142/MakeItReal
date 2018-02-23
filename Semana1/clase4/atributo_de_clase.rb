class Person
	
	@@people_count = 0

	def initialize
		@@people_count +=1
	end

	def self.people_count
		@@people_count
	end

end

person1 = Person.new
person2 = Person.new
person3 = Person.new

puts Person.people_count