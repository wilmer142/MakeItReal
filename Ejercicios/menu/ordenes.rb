require "./menu.rb"
require "./errors.rb"
require "pry"

module Orden

	class Orden

		include Menu
		include Errors

		attr_accessor :ordenes, :num_orden, :menu

		def initialize
			@menu = Menu.new
			@num_orden = 1
			@ordenes = Hash.new
		end

		def crear_orden(codigo, cantidad)
			if @menu.existe_codigo(codigo)
				if platillo_disponible(codigo)
					orden = Array.new
					orden = @ordenes[@num_orden.to_s.to_sym] if @ordenes.key?(@num_orden.to_s.to_sym) 
						item_orden = {codigo: codigo, cantidad: cantidad, estado: "En proceso"}
					orden.push(item_orden)
					@ordenes[@num_orden.to_s.to_sym] = orden
				end
			end
		end

		def mostrar_total(num_orden)
			total = 0
			if existe_orden(num_orden)
				puts "---- MOSTRANDO TOTAL DE LA ORDEN #{num_orden} ----"
				@ordenes[num_orden.to_s.to_sym].each do |orden|
					#binding.pry
					total += orden[:cantidad] * @menu.platillos[orden[:codigo].to_s.to_sym][:precio].to_i
				end
				puts "el total de la orden #{num_orden} es: #{total}"
			else
				raise OrdenNotFoundError.new("El numero de orden ingresado no existe")
			end
			puts ""
			total
		end

		def total(num_orden)
			total = 0
			if existe_orden(num_orden)
				@ordenes[num_orden.to_s.to_sym].each do |orden|
					total += orden[:cantidad] * @menu.platillos[orden[:codigo].to_s.to_sym][:precio].to_i
				end
				total
			else
				raise OrdenNotFoundError.new("El numero de orden ingresado no existe")
			end
		end

		def mostrar_ordenes
			puts "---- MOSTRANDO ORDENES ----"
			@ordenes.each do |num_orden, orden|
				#binding.pry
				total_orden = 0				
				puts "Orden numero: #{num_orden}"
				orden.each do |orden_detalle|
					if orden_detalle[:estado] == "En proceso"
						producto = @menu.platillos[orden_detalle[:codigo].to_s.to_sym]
						valor = producto[:precio].to_i * orden_detalle[:cantidad].to_i
						total_orden += valor
						puts "--Platillo: #{producto[:platillo]}"
						puts "--Cantidad: #{orden_detalle[:cantidad]}"
						puts "--Valor: #{valor}"
					end
				end
				puts "-- Total Orden: #{total_orden}" if total_orden > 0
				puts ""
			end
			puts ""
		end

		def mostrar_orden(num_orden)
			if existe_orden(num_orden)
				puts "---- MOSTRANDO ORDEN ----"
				total_orden = 0				
				puts "Orden numero: #{num_orden}"
				@ordenes[num_orden.to_s.to_sym].each do |orden_detalle|
					if orden_detalle[:estado] == "En proceso"
						producto = @menu.platillos[orden_detalle[:codigo].to_s.to_sym]
						valor = producto[:precio].to_i * orden_detalle[:cantidad].to_i
						total_orden += valor
						puts "--Platillo: #{producto[:platillo]}"
						puts "--Cantidad: #{orden_detalle[:cantidad]}"
						puts "--Valor: #{valor}"
						puts ""
					end
				end
				puts "---Total Orden: #{total_orden}" if total_orden > 0
			end
		end

		def existe_orden(num_orden)
			if @ordenes.key?(num_orden.to_s.to_sym)
				true
			else
				raise OrdenNotFoundError.new("El numero de orden ingresado no existe")
			end
		end

		def platillo_disponible(codigo)
			if @menu.platillos[codigo.to_s.to_sym][:disponible] == "true"
				true
			else
				raise PlatilloNotAvailableError.new("El platillo no se encuentra disponible")
			end
	end

	end
end