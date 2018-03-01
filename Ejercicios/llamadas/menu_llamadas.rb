require "./llamadas.rb"

class Menu
	include Llamada

	def initialize(usuario)
		@telefono = Telefono.new(usuario)
		Menu
	end

	def menu
		system "clear"
		puts "----- ¡Bienvenido a Tu Movil Make It --------"
		puts "-- Menu: "
		puts "---- 1) Agregar contacto"
		puts "---- 2) Realizar llamada"
		puts "---- 3) Colgar llamada"
		puts "---- 5) Historial de llamadas"
		print "Seleccione una opción: "

		opcion = gets.chomp.to_i
		(opcion >= 1 && opcion <= 5) ? accion(opcion) : (puts "opción no valida")

		print "Desea realizar otra acción? (y/n): "
		continuar = gets.chomp.downcase
		continuar == "y" ? menu : (puts "Hasta pronto!!")
	end

	def llamar
		print "Ingrese el contacto a llamar"
		contacto = gets.chomp

	private

	def accion(opcion)
		case opcion

		when 1
			ingreso_gasto("Ingreso")
		when 2
			ingreso_gasto("Gasto")
		when 3 
			registrar_categoria
		when 4
			system "clear"
			if @persona.categorias.count > 0 
				puts "Sus categorias son:"
				@persona.mostrar_categorias
			else
				puts "No tiene categorias asignadas, consulte la opción 3 para ingresar categorias"
			end
		when 5
			print "Ingresa el mes a realizar la consulta: "
			mes = gets.chomp.to_i
			system "clear"
			historial(mes)
		else
			@persona.porcentaje_categorias
		end
	end