require "./errors.rb"
require "pry"

module Menu

	class Menu

		include Errors
		attr_accessor :platillos

		def initialize
			@platillos = Hash.new
		end

		def carga_masiva(nombre_archivo)
			if File.file?(nombre_archivo)
				array_platillos = Array.new
				File.open(nombre_archivo).each { |line| array_platillos << line }
				recorrer_archivo(array_platillos)
				puts "Carga exitosa!"
				puts "# de platillos cargados: #{array_platillos.length}"
			else
				raise FileNotFoundError.new("El archivo solicitado no existe")
			end
		end

		def carga_unitaria(codigo, platillo, precio, disponible)
			if !@platillos.key?(codigo.to_s.to_sym)
				agregar_platillo = {platillo: platillo, precio: precio, disponible: disponible}
				@platillos[codigo.to_s.to_sym] = agregar_platillo
				true
			else
				raise PlatilloAlreadyExistsError.new("El codigo ingresado ya existe")
			end
		end

		def mostrar_menu
			num_platillos = @platillos.keys.count
			puts "---- MOSTRANDO MENU ----"
			puts "Numero de platillos: #{num_platillos}"
			@platillos.each do |codigo, valores|
				puts "-Codigo del platillo: #{codigo}"
				puts "---Nombre: #{valores[:platillo]}"
				puts "---Precio: #{valores[:precio]}"
				puts "---Disponible: #{valores[:disponible]}"
				puts ""
			end
		end

		def mostrar_platillo(codigo)
			if existe_codigo(codigo)
				platillo = @platillos[codigo.to_s.to_sym]
				puts "---- MOSTRANDO PRODUCTO ----"
				puts "-Codigo del platillo: #{codigo}"
				puts "---Nombre: #{platillo[:platillo]}"
				puts "---Precio: #{platillo[:precio]}"
				puts "---Disponible: #{platillo[:disponible]}"
				puts ""
			end
		end

		def existe_codigo(codigo)
			if @platillos.key?(codigo.to_s.to_sym)
				true
			else
				raise PlatilloNotFoundError.new("Platillo no encontrado")
			end
		end

		private

		def recorrer_archivo(array_platillos)
			num_platillos = 0

			array_platillos.each do |line|
  			line = line.split(",")
  			#binding.pry
  			platillo = {platillo: line[1].strip, precio: line[2].strip, disponible: line[3].chomp.strip}
  			@platillos[line[0].to_sym] = platillo
  			num_platillos += 1
  		end
  		num_platillos
  	end

	end
end