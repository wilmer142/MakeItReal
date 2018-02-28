module Categorias

	class CategoriasPorcentaje
		
		def calcular_porcentaje(transacciones)
			gasto_total = 0
			categorias_gasto = Hash.new
			transacciones.each do |transaccion|
				if transaccion[:detalle] == "Gasto"
					if categorias_gasto.key?(transaccion[:categoria]) 
						categorias_gasto[transaccion[:categoria]] += transaccion[:valor]
					else
						categorias_gasto[transaccion[:categoria]] = transaccion[:valor]
					end
					gasto_total += transaccion[:valor]
				end
			end

			mostrar_porcentaje_gastos(categorias_gasto, gasto_total)
		end

		private

		def mostrar_porcentaje_gastos(categorias_gasto, gasto_total)
			system "clear"
			puts "Total de gastos: #{gasto_total}"
			categorias_gasto.each do |categoria, valor|
				puts "Categoria: #{categoria}, porcentaje total: #{((valor/gasto_total)*100).round(2)}%"
			end
		end

	end
end