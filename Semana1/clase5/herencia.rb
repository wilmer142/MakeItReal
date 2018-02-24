class Employee
	def salary
		puts "Calculando salario"
	end
end

class Manager < Employee
	def salary
		puts "calculando bono"
		super # esta linea llama el metodo salary de employee
	end
end

manager = Manager.new
manager.salary

puts "*"*20

class Parent
	def initialize
		puts "Este es el constructor de Parent"
	end
end

class Child < Parent
	def initialize
		puts "Este es el constructor de hijo"
		super
	end
end

child = Child.new
