#Construir una aplicacion (usando POO) que permita llamar, colgar, y mostrar el historial
#de llamadas con la duracion de cada una, no se puede llamar si ya hay una llamada previa,
# demás debe poder mostrar la llamada actual

class Historial
	attr_accessor :num_llamadas, :historia
end

class Telefono < Historial
	attr_accessor :propietario, :destino, :duracion, :llamada, :inicio, :fin

	def initialize(owner)
		@llamada = false
		@propietario = owner
		@num_llamadas = 0
		@historia = Array.new
	end

	def llamar(destino)
		if @llamada
			puts "Existe otra llamada en curso, debe colgar primero"
		else
			@inicio = Time.now()
			@historia << destino
			@llamada = true
		end
	end

	def colgar
		@fin = Time.now()
		@llamada = false
		@duracion = @fin - @inicio
		@historia[-1] += ",#{@duracion.to_i}"
	end

	def historial
		puts "Su historial de llamadas es:"
		@historia.each do |element|
			puts "--#{element.split(',')}"
		end
	end

end

wilmer = Telefono.new("Wilmer")
wilmer.llamar("Miledy")
sleep(5)
wilmer.colgar
wilmer.llamar("Carlos")
sleep(2)
wilmer.colgar
wilmer.historial