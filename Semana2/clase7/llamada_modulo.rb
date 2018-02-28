require "./modulo.rb"

class Person
	include MyModule

	thing_one = ThingOne.new
	thing_one.method_thing_one
	puts MAX_CONNECTIONS
end

class People
	include System
	include System::Currency

	systema = Systema.new
	systema.method_systema

	dollar = Dollar.new
	dollar.method_dollar
end