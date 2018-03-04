require "./menu.rb"
require "./ordenes.rb"
require "pry"

module Caja

	class Caja
		
		include Orden, Menu
		attr_accessor :ordenes_pagadas, :orden

		def initialize

			@orden = Orden.new
			@ordenes_pagadas = Hash.new

		end

		def pagar_orden(num_orden)
			if @orden.existe_orden(num_orden)
				if !orden_pagada(num_orden)
					@ordenes_pagadas[num_orden.to_s.to_sym] = @orden.total(num_orden)
					platillo_orden = 0
					@orden.ordenes[num_orden.to_s.to_sym].each do |platillo|
						@orden.ordenes[num_orden.to_s.to_sym][platillo_orden][:estado] == "Pagado"
						@orden.menu.platillos[platillo[:codigo].to_s.to_sym].key?(:cantidad) ? (@orden.menu.platillos[platillo[:codigo].to_s.to_sym][:cantidad] += platillo[:cantidad].to_i) :
							(@orden.menu.platillos[platillo[:codigo].to_s.to_sym][:cantidad] = platillo[:cantidad].to_i)
						platillo_orden += 1
					end
				else
					puts "El pedido ya fue pagado"
				end
			end
		end

		def productos_vendidos
			puts "---- DETALLE PRODUCTOS VENDIDOS ----"
			@orden.menu.platillos.each do |codigo_platillo, detalle_platillo|
				total = detalle_platillo[:cantidad].to_i * detalle_platillo[:precio].to_i
				puts "Producto: #{detalle_platillo[:platillo]}, # Vendidos: #{detalle_platillo[:cantidad]}, Total vendido #{total}"
			end
		end

		def detalle_ordenes_pagadas
			puts "---- DETALLE ORDENES PAGADAS ----"
			@ordenes_pagadas.each do |orden, valor|
				puts "# Orden: #{orden}, valor: #{valor}"
			end
		end

		def total_pagado
			total = 0
			puts "---- TOTAL PAGADO ----"
			@ordenes_pagadas.each do |orden, valor|
				total += valor.to_i
			end
			puts total
		end

		def orden_pagada(num_orden)
			@ordenes_pagadas.key?(num_orden.to_s.to_sym) ? true : false
		end

	end
end