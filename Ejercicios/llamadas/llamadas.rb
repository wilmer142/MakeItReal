#Construir una aplicacion (usando POO) que permita llamar, colgar, y mostrar el historial
#de llamadas con la duracion de cada una, no se puede llamar si ya hay una llamada previa,
# demás debe poder mostrar la llamada actual

module Llamada

	class Historial
		attr_accessor :historias, :num_llamadas
	end

	class Telefono < Historial
		attr_accessor :propietario, :contactos, :en_uso

		def initialize(owner)
			@en_uso = false
			@propietario = owner
			@num_llamadas = 0
			@historias = Array.new
			@contactos = Hash.new
		end

		def llamar(contacto)
			if @en_uso
				puts "Existe otra llamada en curso, no es posible realizar la acción"
			else
				@inicio = Time.now()
				historia = {contacto: contacto, tipo: "llamada"}
				@historias.push() 
				@llamada = true
			end
		end

		def colgar
			@fin = Time.now()
			@llamada = false
			duracion = @fin - @inicio
			@historias[-1][:duracion] = duracion
		end

		def historial
			puts "Su historial de llamadas es:"
			@historias.each do |element|
				puts "--#{element.split(',')}"
			end
		end

		def agregar_contactos(nombre, telefono)
			if existe_contacto(contacto) ?
		end

		def existe_contacto(contacto)
			@contactos.key?(contacto) ? true : false
		end


	end
end
