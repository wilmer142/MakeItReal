class Game

	def initialize
		@@num_attempts = 1
		@@number = rand(1..10)
	end

	def adivina(guess_number)
		if guess_number == @@number
		 	puts "Muy bien! Lo lograste en #{@@num_attempts} intentos!"
		 	true
		else
			@@num_attempts += 1
		 	puts "Lo siento! No es el número, intenta nuevamente."
		 	false
		end
	end

	def iniciar_juego
		found = false
		until found 
			print "Adivina el número de 1 a 10 que estoy pensando: "
			found = adivina(gets.chomp.to_i)
		end
	end

end