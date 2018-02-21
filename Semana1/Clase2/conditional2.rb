num = 24

if num >= 10
	if num <= 20
		"El numero se encuentra entre 10 y 20 "
	else
		"El numero no es menor que 20"
	end
else
	"El numero no es mayor que 10"
end

puts (num >= 10 && num <= 20) ? "El numero se encuentra entre 10 - 20" : "El numero no se encuentra en el ranog de 10 - 20"