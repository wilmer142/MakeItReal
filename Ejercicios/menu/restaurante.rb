require "./caja.rb"
require "pry"
require "./errors.rb"

class Restaurante

	include Caja, Errors

	def initialize
		@caja = Caja.new
		menu
	end

	def menu
		system "clear"
		puts "------ ¡Bienvenido a la mejor Sazon de Make It ------"
		puts ""
		puts "-- Menu: "
		puts "---- 1) Ingresar platillo al menu (Carga Masiva)"
		puts "---- 2) Ingresar platillo al menu (Unitario)"
		puts "---- 3) Consultar Menu"
		puts "---- 4) Consultar Platillo"
		puts "---- 5) Registrar pedido"
		puts "---- 6) Consultar pedido"
		puts "---- 7) Consultar pedidos en Cola"
		puts "---- 8) Pagar Pedido"
		puts "---- 9) Consultar Pedidos Pagados"
		puts "---- 10) Consultar Platillos Vendidos"
		puts "---- 11) Consultar Total Vendido"
		puts ""
		print "Seleccione una opción: "
		opcion = gets.chomp.to_i
		puts ""
		(opcion >= 1 && opcion <= 11) ? accion(opcion) : (puts "opción no valida")
		puts ""
		print "Desea realizar otra acción? (y/n): "
		continuar = gets.chomp.downcase
		continuar == "y" ? menu : (puts "Hasta pronto!!")
	end

	def ingresar_platillo_masivo
		begin 
			print "Ingresa el nombre del archivo a cargar: "
			nombre_archivo = gets.chomp
			@caja.orden.menu.carga_masiva(nombre_archivo)
		rescue => error
			puts "Oops, Ha ocurrido un error:"
			puts "--- Mensaje: #{error.message}"
		end
	end

	def ingresar_platillo
		begin
			print "Ingrese el codigo del platillo: "
			codigo = gets.chomp.to_i
			print "Ingrese el nombre del platillo: "
			platillo = gets.chomp
			print "Ingrese el precio del platillo: "
			precio = gets.chomp
			print "¿Platillo disponible? (y/n): "
			disponible = gets.chomp.downcase == "y" ? true : false
			@caja.orden.menu.carga_unitaria(codigo, platillo, precio, disponible)
			puts "Platillo añadido correctamente!"
		rescue => error
			puts "Oops, Ha ocurrido un error:"
			puts "--- Mensaje: #{error.message}"
		end
	end

	def consultar_platilo
		begin
			print "Ingrese el codigo del platillo: "
			codigo = gets.chomp.to_i
			@caja.orden.menu.mostrar_platillo(codigo)
		rescue => error
			puts "Oops, Ha ocurrido un error:"
			puts "--- Mensaje: #{error.message}"
		end	
	end

	def registrar_pedido
		begin
			print "Ingrese el codigo del platillo: "
			codigo = gets.chomp
			print "Ingrese la cantidad: "
			cantidad = gets.chomp.to_i
			@caja.orden.crear_orden(codigo, cantidad)
			print "desea registrar otro platillo a la orden? (y/n): "
			continuar = gets.chomp
			(continuar == "y") ? (registrar_pedido) : (@caja.orden.num_orden += 1)
		rescue => error
			puts "Oops, Ha ocurrido un error:"
			puts "--- Mensaje: #{error.message}"
		end
	end

	def consultar_pedido
		begin
			print "Ingrese el numero del pedido: "
			num_pedido = gets.chomp.to_i
			@caja.orden.mostrar_orden(num_pedido)
		rescue => error
			puts "Oops, Ha ocurrido un error:"
			puts "--- Mensaje: #{error.message}"
		end
	end

	def pagar_pedido
		begin
			print "Ingrese el numero de la orden: "
			num_orden = gets.chomp.to_i
			@caja.pagar_orden(num_orden)
			puts "Pedido pagado correctamente!"
		rescue => error
			puts "Oops, Ha ocurrido un error:"
			puts "--- Mensaje: #{error.message}"
		end 
	end

	def accion(opcion)

		case opcion

		when 1
			ingresar_platillo_masivo
		when 2
			ingresar_platillo
		when 3 
			@caja.orden.menu.mostrar_menu
		when 4
			consultar_platilo
		when 5
			registrar_pedido
		when 6
			consultar_pedido
		when 7
			@caja.orden.mostrar_ordenes
		when 8
			pagar_pedido
		when 9
			@caja.detalle_ordenes_pagadas
		when 10
			@caja.productos_vendidos
		else
			@caja.total_pagado
		end
	end

end

restaurante = Restaurante.new