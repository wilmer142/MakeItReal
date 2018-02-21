print "Digita tu edad: "
edad = gets.chomp

if edad < 18
	puts "Eres menor de edad"
elsif edad >= 18 && edad <= 28
	puts "Eres mayor de edad y joven"
elsif edad > 28 && edad < 60
	puts "Vas para viejo"
else
	puts "Eres de la tercera edad"
end