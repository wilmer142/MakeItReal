class Person

	attr_accessor :name

	def initialize(name)
		@name = name
		puts "se ejecuta el metodo initialize #{@name}"
	end

	def greet(another_person_name)
		"hola #{another_person_name}, me llamo #{@name}"
	end

=begin
	def name
		@name
	end

	def name=(name)
		@name = name
	end
=end

	private
	def metodo_secreto
		"no me pueden ejecutar fuera del contexto"
	end

end

person = Person.new("Wilmer") # .new crea una instancia de la clase

puts person.greet("Miledy")

puts person.name = "Papu"

