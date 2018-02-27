require './ingresos.rb'
require 'io/console'

class Banco
	
	attr_reader :persona

	def initialize
		print "Ingresa tu usuario: "
		name = gets.chomp
		print "Ingresa tu contraseña: "
		password = STDIN.noecho(&:gets).chomp
		@persona = Persona.new(name)
		menu
	end

	def menu
		system "clear"
		puts "----- ¡Bienvenido #{@persona.nombre}! --------"
		puts "---- Te encuentras en el Banco Make It Real---"
		puts "-- Menu: "
		puts "---- 1) Registrar Ingreso"
		puts "---- 2) Registrar Gasto"
		puts "---- 3) Definir Categorias"
		puts "---- 4) Consultar Categorias"
		puts "---- 5) Consultar historial"
		print "Seleccione una opción: "

		opcion = gets.chomp.to_i
		(opcion >= 1 && opcion <= 5) ? accion(opcion) : (puts "opción no valida")

		print "Desea realizar otra acción? (y/n): "
		continuar = gets.chomp.downcase
		continuar == "y" ? menu : (puts "Hasta pronto!!")
	end

	def ingreso_gasto(opcion)

		categoria = 
			if opcion == "Gasto"
				print "Ingrese la categoria del gasto: "
				categoria = gets.chomp
			end
			
		print "Descripción del #{opcion}: "
		descripcion = gets.chomp

		print "Valor del #{opcion}: "
		valor = gets.chomp.to_f

		print "Mes del #{opcion}: "
		mes = gets.chomp.to_i
		
		opcion == "Ingreso" ? @persona.ingreso(descripcion, valor, mes) : @persona.gasto(descripcion, valor, mes, categoria)
	end

	def historial(mes)
		@persona.consultar_movimientos(mes)
	end

	def registrar_categoria()
		continuar = true
		while continuar
			print "Ingresa el nombre de la categoria: "
			categoria = gets.chomp
			print "Ingresa el monto maximo de la categoria: "
			monto = gets.chomp
			@persona.registrar_categoria(categoria, monto)

			print "Desea registrar otra categoria? (y/n): "
			continuar = (gets.chomp.downcase == "y") ? true : false
			#continuar = gets.chomp.downcase
		end
	end

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
		else
			print "Ingresa el mes a realizar la consulta: "
			mes = gets.chomp.to_i
			system "clear"
			historial(mes)
		end
	end

end

banco = Banco.new